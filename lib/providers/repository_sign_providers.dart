import 'package:cvs_completer/repositories/base_sign_in_repository.dart';
import 'package:cvs_completer/repositories/pro_sign_in_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final proSignInRepositoryProvider = Provider((ref) => PROSignInRepository());
final baseSignInRepositoryProvider = Provider((ref) => BASESignInRepository());
