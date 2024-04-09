import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:cvs_completer/providers/native_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jwt_decode/jwt_decode.dart';

class PROSignInRepository {
  final CognitoUserPool _userPool = CognitoUserPool(
    'us-east-1_qWNmh55sn',
    '3qp6js0o3qpt3idqtroeqe4kn',
  );

  // Future<void> init(WidgetRef ref) async {
  //   _userPool = CognitoUserPool(
  //     'us-east-1_qWNmh55sn',
  //     '3qp6js0o3qpt3idqtroeqe4kn',
  //   );
  // }
  Future<void> begin({
    required String username,
    required String password,
    required WidgetRef ref,
  }) async {
    final user = CognitoUser(username, _userPool);
    try {
      final authDetails = AuthenticationDetails(
        username: username,
        password: password,
      );
      final session = await user.authenticateUser(authDetails);
      if (session != null) {
        if (session.isGeneral) {
          // await user.cacheTokens();
          ref.read(logInProDataProvider.notifier).state =
              (await user.getSession())?.idToken.jwtToken;
        } else {
          await user.signOut();
          ref.read(logInProErrorProvider.notifier).state = 'userIsNotGeneral';
        }
      } else {
        throw UnimplementedError('Session is null.');
      }
    } on CognitoClientException catch (e) {
      switch (e.name) {
        case 'UserNotFoundException':
          ref.read(logInProErrorProvider.notifier).state =
              'UserNotFoundException';
        case 'NotAuthorizedException':
          ref.read(logInProErrorProvider.notifier).state =
              'NotAuthorizedException';
        case 'UserNotConfirmedException':
          ref.read(logInProErrorProvider.notifier).state =
              'UserNotConfirmedException';
        default:
          ref.read(logInProErrorProvider.notifier).state =
              'Handler for ${e.name} is not provided.';
      }
    } on CognitoUserNewPasswordRequiredException {
      ref.read(logInProErrorProvider.notifier).state = 'New password required';
    } on CognitoUserException catch (e) {
      ref.read(logInProErrorProvider.notifier).state =
          'Error! (${e.challengeName})\n${e.message}';
    }
  }
}

enum SigninResult {
  ok,
  userNotFound,
  userNotAuthorized,
  userNotConfirmed,
  newPasswordRequired,
  userIsNotGeneral,
  error;
}

extension SessionUserGroup on CognitoUserSession {
  bool get isGeneral => _groups.contains('scoutbox-general');

  bool get isSuper => _groups.contains('scoutbox-super');

  List<String> get _groups {
    final jwt = Jwt.parseJwt(accessToken.jwtToken!);
    if (jwt['cognito:groups'] == null) {
      return [];
    } else {
      return (jwt['cognito:groups'] as Iterable<dynamic>)
          .cast<String>()
          .toList();
    }
  }
}
