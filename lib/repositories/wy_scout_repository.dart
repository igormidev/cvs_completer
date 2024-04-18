// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:cvs_completer/data/career_stat.dart';
import 'package:cvs_completer/data/player_advanced_stats.dart';
import 'package:cvs_completer/data/championship_stat.dart';
import 'package:cvs_completer/data/result_player.dart';
import 'package:cvs_completer/providers/progress_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cvs_completer/providers/csv_maneger_providers.dart';
import 'package:cvs_completer/providers/wy_scout_provider.dart';
import 'package:cvs_completer/repositories/restfull_client.dart';

class WyScoutRepository {
  const WyScoutRepository(this.ref);
  final Ref ref;

  Future<void> getAllPlayerWyScoutIDByName(
    List<String> playersName,
  ) async {
    final int total = playersName.length;
    ref.read(progressWyScoutApiProvider.notifier).state =
        Progress(total: total, amount: 0);
    final restfull = ref.read(restfullWyScoutClient);
    int quantity = 0;
    for (final name in playersName) {
      final playerResponse = await restfull.getList<String>(
        path: '/search',
        queryParameters: {
          'query': name,
          'gender': 'men',
          'objType': 'player',
        },
        fromMapFunction: (map) => map['wyId'] == null ? '' : "${map['wyId']}",
      );

      playerResponse.fold(
        (String error) {
          ref.read(csvProErrorProvider.notifier).state = [
            ...ref.read(csvProErrorProvider.notifier).state,
            '$name: $error',
          ];
        },
        (List<String> playersWyScoutId) {
          if (playersWyScoutId.isNotEmpty) {
            ref.read(wyScoutNameIdStateProvider.notifier).state = {
              ...ref.read(wyScoutNameIdStateProvider),
              name: playersWyScoutId.join(' '),
            };
          }
        },
      );
      quantity += 1;
      ref.read(progressWyScoutApiProvider.notifier).state =
          Progress(total: total, amount: quantity);
    }
  }

  Future<void> getProUsersStats(List<String> wyIds) async {
    final int total = wyIds.length;
    final restfull = ref.read(restfullWyScoutClient);
    int quantity = 0;
    for (final wyId in wyIds) {
      final carrearResponse = await restfull.get<ResultPlayer>(
        path: '/players/$wyId/career',
        queryParameters: {
          'fetch': 'player',
          'details': 'team,competition,season'
        },
        fromMapFunction: (map) async {
          final contacts = await restfull.get(
            path: '/players/$wyId/contractinfo',
            fromMapFunction: (map) => map,
          );

          return contacts.fold((contactError) {
            throw Exception('Error on get contacts: $contactError');
          }, (contacts) async {
            final newMap = {
              ...map,
              ...contacts,
            };

            final result = PlayerStat.fromWySouct(
              newMap,
            );

            final careerStats = (map['career'] as List<dynamic>).map((map) {
              final castedMap = map as Map<dynamic, dynamic>;
              return CareerStat.fromWySouct(castedMap);
            }).toList();

            final List<ChampionshipStat> playersResult = [];

            for (final CareerStat careerStat in careerStats) {
              final playerAdvancedStatInChampionship = await restfull.get(
                path: '/players/$wyId/advancedstats',
                queryParameters: {
                  if (careerStat.compId != null)
                    'compId': careerStat.compId?.toString() ?? '',
                },
                fromMapFunction: (map) {
                  return PlayerAdvancedStat.fromMap(
                      (map['total'] as Map).cast());
                },
              );

              playerAdvancedStatInChampionship.fold((error) {
                throw Exception('Error on get player advanced stats: $error');
              }, (playerAdvancedStat) {
                playersResult.add(
                  ChampionshipStat(
                    career: careerStat,
                    playerStat: playerAdvancedStat,
                  ),
                );
              });
            }

            return ResultPlayer(
              championshipStat: playersResult,
              playerStat: result,
            );
          });
        },
      );
      carrearResponse.fold(
        (String error) {
          ref.read(csvProErrorProvider.notifier).state = [
            ...ref.read(csvProErrorProvider.notifier).state,
            'ID: $wyId, $error',
          ];
        },
        (ResultPlayer stat) {
          ref.read(wyScoutStateProvider.notifier).state = {
            ...ref.read(wyScoutStateProvider),
            wyId: stat,
          };
        },
      );

      quantity += 1;
      ref.read(progressWyScoutApiProvider.notifier).state =
          Progress(total: total, amount: quantity);
    }
  }
}

class PlayerStats {
  final int goals;
  final int avarageGoals;
  final int keyPasses;
  final int avarageKeyPasses;
  final int assists;
  final int avarageAssists;
  final int weight;
  const PlayerStats({
    required this.goals,
    required this.keyPasses,
    required this.avarageKeyPasses,
    required this.avarageGoals,
    required this.assists,
    required this.avarageAssists,
    required this.weight,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'goals': goals,
      'avarageGoals': avarageGoals,
      'keyPasses': keyPasses,
      'avarageKeyPasses': avarageKeyPasses,
      'assists': assists,
      'avarageAssists': avarageAssists,
      'weight': weight,
    };
  }

  factory PlayerStats.fromMap(Map<String, dynamic> map) {
    return PlayerStats(
      goals: map['goals'] as int,
      avarageGoals: map['avarageGoals'] as int,
      keyPasses: map['keyPasses'] as int,
      avarageKeyPasses: map['avarageKeyPasses'] as int,
      assists: map['assists'] as int,
      avarageAssists: map['avarageAssists'] as int,
      weight: map['weight'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlayerStats.fromJson(String source) =>
      PlayerStats.fromMap(json.decode(source) as Map<String, dynamic>);

  factory PlayerStats.fromWYApi(Map<dynamic, dynamic> map) {
    return PlayerStats(
      goals: map['total']['goals'] as int,
      keyPasses: map['total']['keyPasses'] as int,
      assists: map['total']['assists'] as int,
      avarageGoals: map['average']['goals'] as int,
      avarageAssists: map['average']['assists'] as int,
      avarageKeyPasses: map['average']['keyPasses'] as int,
      weight: map['player']['weight'] as int,
    );
  }
}
