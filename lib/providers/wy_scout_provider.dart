import 'package:cvs_completer/data/career_stat.dart';
import 'package:cvs_completer/repositories/wy_scout_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final wyScoutRepositoryProvider = Provider((ref) => WyScoutRepository(ref));
final wyScoutStateProvider =
    StateProvider<Map<String, PlayerStat>>((ref) => {});
final wyScoutNameIdStateProvider =
    StateProvider<Map<String, String>>((ref) => {});
