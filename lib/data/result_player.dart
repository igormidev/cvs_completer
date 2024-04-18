// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:cvs_completer/data/career_stat.dart';
import 'package:cvs_completer/data/championship_stat.dart';

class ResultPlayer {
  final List<ChampionshipStat> championshipStat;
  final PlayerStat playerStat;
  const ResultPlayer({
    required this.championshipStat,
    required this.playerStat,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'championshipStat': championshipStat.map((x) => x.toMap()).toList(),
      'playerStat': playerStat.toMap(),
    };
  }

  factory ResultPlayer.fromMap(Map<String, dynamic> map) {
    return ResultPlayer(
      championshipStat: List<ChampionshipStat>.from(
        (map['championshipStat'] as List<int>).map<ChampionshipStat>(
          (x) => ChampionshipStat.fromMap(x as Map<String, dynamic>),
        ),
      ),
      playerStat: PlayerStat.fromMap(map['playerStat'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultPlayer.fromJson(String source) =>
      ResultPlayer.fromMap(json.decode(source) as Map<String, dynamic>);
}
