// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class PlayerStat {
  final String? imageDataURL;
  final int? weight;
  final String? currentTeamContractExpiration;
  final String? agency;
  const PlayerStat({
    required this.imageDataURL,
    required this.weight,
    required this.currentTeamContractExpiration,
    required this.agency,
  });

  factory PlayerStat.fromWySouct(Map<dynamic, dynamic> map) {
    return PlayerStat(
      imageDataURL: (map['player'] as Map?)?['imageDataURL'] != null
          ? map['player']['imageDataURL'] as String
          : null,
      weight: (map['player'] as Map?)?['weight'] != null
          ? map['player']['weight'] as int
          : null,
      currentTeamContractExpiration: map['contractExpiration'] == null
          ? null
          : '${map['contractExpiration']}',
      agency: map['agencies'] == null
          ? null
          : (map['agencies'] as List<dynamic>).map((e) => '$e').join(', '),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageDataURL': imageDataURL,
      'weight': weight,
      'currentTeamContractExpiration': currentTeamContractExpiration,
      'agency': agency,
    };
  }

  factory PlayerStat.fromMap(Map<String, dynamic> map) {
    return PlayerStat(
      imageDataURL:
          map['imageDataURL'] != null ? map['imageDataURL'] as String : null,
      weight: map['weight'] != null ? map['weight'] as int : null,
      currentTeamContractExpiration:
          map['currentTeamContractExpiration'] != null
              ? map['currentTeamContractExpiration'] as String
              : null,
      agency: map['agency'] != null ? map['agency'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlayerStat.fromJson(String source) =>
      PlayerStat.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CareerStat {
  final int? goals;
  final int? minutesPlayed;
  final int? redCards;
  final int? yellowCards;
  final int? shirtNumber;
  final int? substituteIn;
  final int? substituteOnBench;
  final int? substituteOut;
  final int? compId;
  final String? countryCode;
  final String? teamName;
  final String? teamIconUrl;
  final String? competitionName;
  final String? startDate;
  final String? endDate;

  const CareerStat({
    required this.startDate,
    required this.endDate,
    required this.goals,
    required this.minutesPlayed,
    required this.redCards,
    required this.yellowCards,
    required this.shirtNumber,
    required this.substituteIn,
    required this.substituteOnBench,
    required this.substituteOut,
    required this.compId,
    required this.countryCode,
    required this.teamName,
    required this.teamIconUrl,
    required this.competitionName,
  });

  factory CareerStat.fromWySouct(Map<dynamic, dynamic> careerMap) {
    return CareerStat(
      compId: careerMap['competitionId'] == null
          ? null
          : careerMap['competitionId'] as int,
      startDate: careerMap['season'] == null
          ? null
          : careerMap['season']['startDate'] as String?,
      endDate: careerMap['season'] == null
          ? null
          : careerMap['season']['endDate'] as String?,
      goals: careerMap['goal'] != null ? careerMap['goal'] as int : null,
      minutesPlayed: careerMap['minutesPlayed'] != null
          ? careerMap['minutesPlayed'] as int
          : null,
      redCards:
          careerMap['redCards'] != null ? careerMap['redCards'] as int : null,
      yellowCards: careerMap['yellowCard'] != null
          ? careerMap['yellowCard'] as int
          : null,
      shirtNumber: careerMap['shirtNumber'] != null
          ? careerMap['shirtNumber'] as int
          : null,
      substituteIn: careerMap['substituteIn'] != null
          ? careerMap['substituteIn'] as int
          : null,
      substituteOnBench: careerMap['substituteOnBench'] != null
          ? careerMap['substituteOnBench'] as int
          : null,
      substituteOut: careerMap['substituteOut'] != null
          ? careerMap['substituteOut'] as int
          : null,
      countryCode: careerMap['team'] == null
          ? null
          : careerMap['team']['area'] == null
              ? null
              : careerMap['team']['area']['alpha2code'] == null
                  ? null
                  : careerMap['team']['area']['alpha2code'] as String,
      teamName: careerMap['team'] == null
          ? null
          : careerMap['team']['name'] == null
              ? null
              : careerMap['team']['name'] as String,
      teamIconUrl: careerMap['team'] == null
          ? null
          : careerMap['team']['imageDataURL'] == null
              ? null
              : careerMap['team']['imageDataURL'] as String,
      competitionName: careerMap['competition'] == null
          ? null
          : careerMap['competition']['name'] == null
              ? null
              : careerMap['competition']['name'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'goals': goals,
      'minutesPlayed': minutesPlayed,
      'redCards': redCards,
      'yellowCards': yellowCards,
      'shirtNumber': shirtNumber,
      'substituteIn': substituteIn,
      'substituteOnBench': substituteOnBench,
      'substituteOut': substituteOut,
      'compId': compId,
      'countryCode': countryCode,
      'teamName': teamName,
      'teamIconUrl': teamIconUrl,
      'competitionName': competitionName,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  factory CareerStat.fromMap(Map<String, dynamic> map) {
    return CareerStat(
      goals: map['goals'] != null ? map['goals'] as int : null,
      minutesPlayed:
          map['minutesPlayed'] != null ? map['minutesPlayed'] as int : null,
      redCards: map['redCards'] != null ? map['redCards'] as int : null,
      yellowCards:
          map['yellowCards'] != null ? map['yellowCards'] as int : null,
      shirtNumber:
          map['shirtNumber'] != null ? map['shirtNumber'] as int : null,
      substituteIn:
          map['substituteIn'] != null ? map['substituteIn'] as int : null,
      substituteOnBench: map['substituteOnBench'] != null
          ? map['substituteOnBench'] as int
          : null,
      substituteOut:
          map['substituteOut'] != null ? map['substituteOut'] as int : null,
      compId: map['compId'] != null ? map['compId'] as int : null,
      countryCode:
          map['countryCode'] != null ? map['countryCode'] as String : null,
      teamName: map['teamName'] != null ? map['teamName'] as String : null,
      teamIconUrl:
          map['teamIconUrl'] != null ? map['teamIconUrl'] as String : null,
      competitionName: map['competitionName'] != null
          ? map['competitionName'] as String
          : null,
      startDate: map['startDate'] != null ? map['startDate'] as String : null,
      endDate: map['endDate'] != null ? map['endDate'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CareerStat.fromJson(String source) =>
      CareerStat.fromMap(json.decode(source) as Map<String, dynamic>);
}
