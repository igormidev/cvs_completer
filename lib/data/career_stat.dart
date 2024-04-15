// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

class PlayerStat {
  final String? imageDataURL;
  final int? weight;
  final String? currentTeamContractExpiration;
  final String? agency;
  final List<CareerStat> career;
  const PlayerStat({
    required this.imageDataURL,
    required this.weight,
    required this.currentTeamContractExpiration,
    required this.agency,
    required this.career,
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
      // : '${map['agencies']}',
      career: (map['career'] as List<dynamic>).map((map) {
        final castedMap = map as Map<dynamic, dynamic>;
        return CareerStat.fromWySouct(castedMap);
      }).toList(),
    );
  }

  @override
  String toString() {
    return 'PlayerStat(imageDataURL: $imageDataURL, weight: $weight, currentTeamContractExpiration: $currentTeamContractExpiration, agency: $agency, career: $career)';
  }

  @override
  bool operator ==(covariant PlayerStat other) {
    if (identical(this, other)) return true;

    return other.imageDataURL == imageDataURL &&
        other.weight == weight &&
        other.currentTeamContractExpiration == currentTeamContractExpiration &&
        other.agency == agency &&
        listEquals(other.career, career);
  }

  @override
  int get hashCode {
    return imageDataURL.hashCode ^
        weight.hashCode ^
        currentTeamContractExpiration.hashCode ^
        agency.hashCode ^
        career.hashCode;
  }

  PlayerStat copyWith({
    String? imageDataURL,
    int? weight,
    String? currentTeamContractExpiration,
    String? agency,
    List<CareerStat>? career,
  }) {
    return PlayerStat(
      imageDataURL: imageDataURL ?? this.imageDataURL,
      weight: weight ?? this.weight,
      currentTeamContractExpiration:
          currentTeamContractExpiration ?? this.currentTeamContractExpiration,
      agency: agency ?? this.agency,
      career: career ?? this.career,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageDataURL': imageDataURL,
      'weight': weight,
      'currentTeamContractExpiration': currentTeamContractExpiration,
      'agency': agency,
      'career': career.map((x) => x.toMap()).toList(),
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
      career: List<CareerStat>.from(
        (map['career'] as List<int>).map<CareerStat>(
          (x) => CareerStat.fromMap(x as Map<String, dynamic>),
        ),
      ),
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
  final String? countryCode;
  final String? teamName;
  final String? teamIconUrl;
  final String? competitionName;
  const CareerStat({
    required this.goals,
    required this.minutesPlayed,
    required this.redCards,
    required this.yellowCards,
    required this.shirtNumber,
    required this.substituteIn,
    required this.substituteOnBench,
    required this.substituteOut,
    required this.countryCode,
    required this.teamName,
    required this.teamIconUrl,
    required this.competitionName,
  });

  String toJson() => json.encode(toMap());

  factory CareerStat.fromJson(String source) =>
      CareerStat.fromMap(json.decode(source) as Map<String, dynamic>);

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
      'countryCode': countryCode,
      'teamName': teamName,
      'teamIconUrl': teamIconUrl,
      'competitionName': competitionName,
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
      countryCode:
          map['countryCode'] != null ? map['countryCode'] as String : null,
      teamName: map['teamName'] != null ? map['teamName'] as String : null,
      teamIconUrl:
          map['teamIconUrl'] != null ? map['teamIconUrl'] as String : null,
      competitionName: map['competitionName'] != null
          ? map['competitionName'] as String
          : null,
    );
  }

  factory CareerStat.fromWySouct(Map<dynamic, dynamic> map) {
    return CareerStat(
      goals: map['goal'] != null ? map['goal'] as int : null,
      minutesPlayed:
          map['minutesPlayed'] != null ? map['minutesPlayed'] as int : null,
      redCards: map['redCards'] != null ? map['redCards'] as int : null,
      yellowCards: map['yellowCard'] != null ? map['yellowCard'] as int : null,
      shirtNumber:
          map['shirtNumber'] != null ? map['shirtNumber'] as int : null,
      substituteIn:
          map['substituteIn'] != null ? map['substituteIn'] as int : null,
      substituteOnBench: map['substituteOnBench'] != null
          ? map['substituteOnBench'] as int
          : null,
      substituteOut:
          map['substituteOut'] != null ? map['substituteOut'] as int : null,
      countryCode: map['team'] == null
          ? null
          : map['team']['area'] == null
              ? null
              : map['team']['area']['alpha2code'] == null
                  ? null
                  : map['team']['area']['alpha2code'] as String,
      teamName: map['team'] == null
          ? null
          : map['team']['name'] == null
              ? null
              : map['team']['name'] as String,
      teamIconUrl: map['team'] == null
          ? null
          : map['team']['imageDataURL'] == null
              ? null
              : map['team']['imageDataURL'] as String,
      competitionName: map['competition'] == null
          ? null
          : map['competition']['name'] == null
              ? null
              : map['competition']['name'] as String,
      /*
      countryCode:
          ([(map['team'] as Map?)?['area']] as Map?)?['alpha2code'] != null
              ? map['team']['area']['alpha2code'] as String
              : null,
      teamName: (map['team'] as Map?)?['name'] != null
          ? map['team']['name'] as String
          : null,
      teamIconUrl: (map['team'] as Map?)?['imageDataURL'] != null
          ? map['team']['imageDataURL'] as String
          : null,
      competitionName: (map['competition'] as Map?)?['name'] != null
          ? map['competition']['name'] as String
          : null,
      */
    );
  }
}
