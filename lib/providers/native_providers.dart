import 'package:hooks_riverpod/hooks_riverpod.dart';

final logInProErrorProvider = StateProvider<String?>((ref) => null);
final logInProLoadingProvider = StateProvider<bool>((ref) => false);
final logInProDataProvider = StateProvider<String?>((ref) => null);

final logInBaseErrorProvider = StateProvider<String?>((ref) => null);
final logInBaseLoadingProvider = StateProvider<bool>((ref) => false);
final logInBaseDataProvider = StateProvider<String?>((ref) => null);

final isProSelected = StateProvider<bool>((ref) => true);
