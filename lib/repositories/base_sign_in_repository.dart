import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:cvs_completer/providers/native_providers.dart';
import 'package:cvs_completer/repositories/restfull_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BASESignInRepository {
  CognitoUser? _cognitoUser;
  final CognitoUserPool _userPool = CognitoUserPool(
    'us-east-1_qWNmh55sn',
    '7im8e198qlfip2b2f8g9hmjevi',
  );

  Future<void> signIn({
    required String username,
    required String password,
    required WidgetRef ref,
  }) async {
    try {
      _cognitoUser = CognitoUser(username, _userPool);
      final authDetails = AuthenticationDetails(
        username: username,
        password: password,
      );
      final session = await _cognitoUser?.authenticateUser(authDetails);
      if (session != null) {
        // await _cognitoUser?.cacheTokens();

        final idToken = (await _cognitoUser?.getSession())?.idToken.jwtToken;
        ref.read(logInBaseDataProvider.notifier).state = idToken;
        ref.read(logInBaseDataProvider.notifier).state = idToken;

        ref
            .read(restfullBaseClient)
            .addAnDefaultHeader('Authorization', 'Bearer $idToken');

        // await fetchProfile();
        // await registerFcmDeviceToken();
        // await Analytics().logLogin();
        // return Result.ok(SignInResult.ok);
      }
    } on CognitoClientException catch (e) {
      switch (e.name) {
        case 'UserNotFoundException':
          ref.read(logInBaseErrorProvider.notifier).state =
              'UserNotFoundException';
        case 'NotAuthorizedException':
          ref.read(logInBaseErrorProvider.notifier).state =
              'NotAuthorizedException';
        case 'UserNotConfirmedException':
          ref.read(logInBaseErrorProvider.notifier).state =
              'UserNotConfirmedException';
        default:
          ref.read(logInBaseErrorProvider.notifier).state =
              'Error: ${e.name}\n${e.message}';
      }
    } on CognitoUserException {
      ref.read(logInProErrorProvider.notifier).state = 'notConfirmed';
    } catch (e) {
      ref.read(logInProErrorProvider.notifier).state = 'Session doesn\'t exist';
    }
  }

  // Future<void> fetchProfile() async {
  //   final token = await idToken();
  //   final userId = (await _cognitoUser?.getUserAttributes())
  //       ?.firstWhere((x) => x.name == 'sub')
  //       .value;
  // }

  // Future<String?> idToken() async {
  //   if (!(_session?.isValid() ?? false)) {
  //     await _refreshSession();
  //   }
  //   return _session?.idToken.jwtToken;
  // }
}
