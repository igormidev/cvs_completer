import 'package:cvs_completer/data/dsf_mobile_user.dart';
import 'package:cvs_completer/data/players/player.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final csvProErrorProvider = StateProvider<List<String>>((ref) => []);
final csvProLoadingProvider = StateProvider<bool>((ref) => false);
// ID AND PLAYER WITH THAT ID
final csvProDataProvider = StateProvider<Map<String, ProPlayer>>((ref) => {});

final csvBaseErrorProvider = StateProvider<List<String>>((ref) => []);
final csvBaseLoadingProvider = StateProvider<bool>((ref) => false);
// ID AND PLAYER WITH THAT ID
final csvBaseDataProvider =
    StateProvider<Map<String, DSFMobileUser>>((ref) => {});
