import 'package:cvs_completer/data/variables/league.dart';
import 'package:dsf_ms_proto/proto/dreamstock/dsf_ms_scout/v3/league.pb.dart'
    as pb;
import 'package:dsf_ms_proto/proto/dreamstock/dsf_ms_scout/v3/team.pb.dart'
    as pb;
import 'package:fixnum/fixnum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  const factory Team({
    required String name,
    required Uri icon,
    required Country country,
    League? league,
  }) = _Team;

  factory Team.fromPb(pb.Team pb, {required pb.League? league}) => Team(
        name: pb.name,
        icon: Uri.parse(pb.icon),
        country: Country(
          code: pb.country.alpha2Code,
          name: pb.country.name,
        ),
        league:
            // undefined leagueの場合は所属リーグを無し(null)として扱う
            (league != null && league.id != Int64(1))
                ? League.fromPb(league)
                : null,
      );

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}
