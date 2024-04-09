import 'package:cvs_completer/data/variables/age_group.dart';
import 'package:cvs_completer/data/variables/body_part.dart';
import 'package:cvs_completer/data/variables/position.dart';
import 'package:dsf_ms_proto/proto/dreamstock/dsf_ms_mobile/v3/player_level.pbenum.dart';
import 'package:dsf_ms_proto/proto/dreamstock/dsf_ms_mobile/v3/position.pb.dart'
    as grpc_position;
import 'package:dsf_ms_proto/util/string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dsf_mobile_user.freezed.dart';
part 'dsf_mobile_user.g.dart';

@freezed
class DSFMobileUser with _$DSFMobileUser {
  factory DSFMobileUser({
    required String uuid,
    required Uri? icon,
    required String firstName,
    required String lastName,
    required String teamName,
    required UserTeam? team,
    required String bio,
    required DateTime dateOfBirth,
    required List<Position> positions,
    required List<AgeGroup> ageGroups,
    required BodyPart? dominantFoot,
    required int? height,
    required int? squadNumber,
    required bool? hasAgent,
    required DateTime? teamContractBegunAt,
    required DateTime? teamContractEndedAt,
    required bool isFollower,
    required bool isFollowee,
    required int numFollowers,
    required int numFollowees,
    required PlayerLevel playerLevel,
  }) = _User;
  const DSFMobileUser._();

  factory DSFMobileUser.fromJson(Map<String, dynamic> json) {
    return DSFMobileUser(
      uuid: json['uuid'] as String,
      icon: Uri.tryParse(json['profileImageUrl'] as String),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      teamName: json['teamName'] as String,
      team: _userTeamDecoder(json),
      bio: json['bio'] as String,
      dateOfBirth: DateTime.parse(json['birthday'] as String),
      positions: _positionsDecoder(json),
      ageGroups: _ageGroups(json),
      dominantFoot: json.forPlayer('dominantBodyPart', BodyPartExt.fromString),
      height: _height(json),
      squadNumber: json.forPlayer<int>('uniformNumber'),
      hasAgent: json.forPlayer<bool>('hasAgent'),
      teamContractBegunAt:
          json.forPlayer('teamContractBegunAt', DateTime.tryParse),
      teamContractEndedAt:
          json.forPlayer('teamContractEndedAt', DateTime.tryParse),
      isFollowee: json['isFollowee'] as bool,
      isFollower: json['isFollower'] as bool,
      numFollowers: json['numFollowers'] as int,
      numFollowees: json['numFollowees'] as int,
      playerLevel: PlayerLevel.PLAYER_LEVEL_UNSPECIFIED,
    );
  }

  // factory User.fromApiV3(grpc_user.User user) {
  //   return User(
  //     uuid: user.uuid,
  //     icon: Uri.tryParse(user.profileImageUrl),
  //     firstName: user.firstName,
  //     lastName: user.lastName,
  //     teamName: user.teamName,
  //     team: UserTeam(icon: Uri.parse(user.team.icon)),
  //     bio: user.bio,
  //     dateOfBirth: user.dateOfBirth.toDateTime(),
  //     positions: _apiV3PositionsDecoder(user.positions),
  //     ageGroups: [user.ageGroup.toAgeGroup ?? AgeGroup.over20],
  //     dominantFoot:
  //         user.selfRelatedInfo.userType.playerInfo.dominantFoot.toBodyPart,
  //     height: (user.selfRelatedInfo.userType.playerInfo.height * 100).toInt(),
  //     squadNumber: user.selfRelatedInfo.userType.playerInfo.uniformNumber,
  //     hasAgent: user.selfRelatedInfo.userType.playerInfo.hasAgent,
  //     teamContractBegunAt: user
  //         .selfRelatedInfo.userType.playerInfo.teamContractPeriod.begunAt
  //         .toDateTime(),
  //     teamContractEndedAt: user
  //         .selfRelatedInfo.userType.playerInfo.teamContractPeriod.endedAt
  //         .toDateTime(),
  //     isFollowee: user.selfRelatedInfo.isFollowed,
  //     isFollower: false, // TODO(shotaro): api-v3のアップデートに伴って追加予定
  //     numFollowers: user.numFollowers.toInt(),
  //     numFollowees: user.numFollowees.toInt(),
  //     playerLevel: user.selfRelatedInfo.userType.playerInfo.playerLevel,
  //   );
  // }

  String get fullName =>
      '$firstName $lastName'.split(' ').map((e) => e.capitalized).join(' ');

  bool get hasContract =>
      teamContractBegunAt != null || teamContractEndedAt != null;
}

/// TeamはIDとnameが必要だが、dsf-apiのuser.teamはiconのみのため、専用のモデルを設ける
@freezed
class UserTeam with _$UserTeam {
  factory UserTeam({required Uri icon}) = _UserTeam;

  factory UserTeam.fromJson(Map<String, dynamic> json) =>
      _$UserTeamFromJson(json);
}

UserTeam? _userTeamDecoder(Map<String, dynamic> json) {
  if (json.keys.contains('team') && json['team'] != null) {
    return UserTeam(
      icon: Uri.parse((json['team'] as Map<String, dynamic>)['icon'] as String),
    );
  }
  return null;
}

List<Position> _positionsDecoder(Map<String, dynamic> json) {
  final codes = json.at<String>(
    player: 'positions',
    coach: 'positions',
    orElse: [],
  );

  return codes.map(PositionExt.fromString).whereType<Position>().toList();
}

List<AgeGroup> _ageGroups(Map<String, dynamic> json) {
  final codes = json.at<String>(
    player: 'ageGroups',
    coach: 'ageGroups',
    orElse: [],
  );

  return codes.map(AgeGroupExt.fromString).whereType<AgeGroup>().toList();
}

int? _height(Map<String, dynamic> json) {
  if (json.keys.contains('player') && json['player'] != null) {
    final value = (json['player'] as Map<String, dynamic>)['height'].toString();
    final metre = double.tryParse(value) ?? 0;
    return (metre * 100).floor();
  } else {
    return null;
  }
}

List<Position> _apiV3PositionsDecoder(List<grpc_position.Position> positions) {
  return positions.map((v) => v.toPosition).whereType<Position>().toList();
}

extension _JsonExt on Map {
  List<T> at<T>({
    required String player,
    required String coach,
    required List<T> orElse,
  }) {
    if (this['player'] != null && player.isNotEmpty) {
      return ((this['player'] as Map)[player] as List<dynamic>).cast<T>();
    } else if (this['coach'] != null && coach.isNotEmpty) {
      return ((this['coach'] as Map)[coach] as List<dynamic>).cast<T>();
    } else {
      return orElse;
    }
  }

  T? forPlayer<T>(String name, [T? Function(String value)? decoder]) {
    if (this['player'] != null) {
      final player = this['player'] as Map;
      if (player[name] != null) {
        return decoder != null
            ? decoder(player[name] as String)
            : player[name] as T;
      }
    }
    return null;
  }
}

extension GrpcPositionExt on grpc_position.Position {
  Position? get toPosition {
    switch (this) {
      case grpc_position.Position.POSITION_GK:
        return Position.gk;
      case grpc_position.Position.POSITION_DF:
        return Position.df;
      case grpc_position.Position.POSITION_MF:
        return Position.mf;
      case grpc_position.Position.POSITION_FW:
        return Position.fw;
      case grpc_position.Position.POSITION_CB:
        return Position.cb;
      case grpc_position.Position.POSITION_LSB:
        return Position.lsb;
      case grpc_position.Position.POSITION_RSB:
        return Position.rsb;
      case grpc_position.Position.POSITION_DMF:
        return Position.dmf;
      case grpc_position.Position.POSITION_LMF:
        return Position.lmf;
      case grpc_position.Position.POSITION_RMF:
        return Position.rmf;
      case grpc_position.Position.POSITION_LWG:
        return Position.lwg;
      case grpc_position.Position.POSITION_RWG:
        return Position.rwg;
      case grpc_position.Position.POSITION_OMF:
        return Position.omf;
      case grpc_position.Position.POSITION_CF:
        return Position.cf;
      case grpc_position.Position.POSITION_UNSPECIFIED:
        break;
    }
    return null;
  }
}
