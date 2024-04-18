// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:cvs_completer/data/career_stat.dart';
import 'package:cvs_completer/data/player_advanced_stats.dart';

class ChampionshipStat {
  final CareerStat career;
  final PlayerAdvancedStat playerStat;
  const ChampionshipStat({
    required this.career,
    required this.playerStat,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'career': career.toMap(),
      'playerStat': playerStat.toMap(),
    };
  }

  factory ChampionshipStat.fromMap(Map<String, dynamic> map) {
    return ChampionshipStat(
      career: CareerStat.fromMap(map['career'] as Map<String, dynamic>),
      playerStat:
          PlayerAdvancedStat.fromMap(map['playerStat'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChampionshipStat.fromJson(String source) =>
      ChampionshipStat.fromMap(json.decode(source) as Map<String, dynamic>);
}
