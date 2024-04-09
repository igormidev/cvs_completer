
// @freezed
// class Team with _$Team {
//   const factory Team({
//     required String name,
//     required Uri icon,
//     required Country country,
//     League? league,
//   }) = _Team;

//   factory Team.fromPb(pb.Team pb, {required pb.League? league}) => Team(
//         name: pb.name,
//         icon: Uri.parse(pb.icon),
//         country: Country(
//           code: pb.country.alpha2Code,
//           name: pb.country.name,
//         ),
//         league:
//             // undefined leagueの場合は所属リーグを無し(null)として扱う
//             (league != null && league.id != Int64(1))
//                 ? League.fromPb(league)
//                 : null,
//       );

//   factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
// }
