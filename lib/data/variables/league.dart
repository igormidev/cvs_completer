import 'dart:convert';

import 'package:dsf_ms_proto/proto/dreamstock/dsf_ms_scout/v3/league.pb.dart'
    as pb;
import 'package:freezed_annotation/freezed_annotation.dart';
part 'league.freezed.dart';
part 'league.g.dart';

@freezed
class League with _$League {
  const factory League({
    required String name,
    required Uri icon,
    required Country country,
  }) = _League;

  factory League.fromPb(pb.League p) => League(
        name: p.name,
        icon: Uri.parse(p.icon),
        country: Country(
          code: p.country.alpha2Code,
          name: p.country.name,
        ),
      );

  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);
}

class Country {
  const Country({required this.code, required this.name});
  final String code;
  final String name;

  String get flag {
    final flag = code.toUpperCase().replaceAllMapped(
          RegExp(r'[A-Z]'),
          (match) => String.fromCharCode(
            match.group(0)!.codeUnitAt(0) + 127397,
          ),
        );
    return flag;
  }

  String get nameWithFlag => '$flag $name';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'name': name,
    };
  }

  factory Country.fromJson(Map<String, dynamic> map) {
    return Country(
      code: map['code'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}
