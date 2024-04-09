import 'package:cvs_completer/repositories/dsf_player_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final playersRepositoryProvider = Provider((ref) => DsfPlayerRepository(ref));
