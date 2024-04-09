import 'package:cvs_completer/core/utils.dart';
import 'package:cvs_completer/data/position.dart';
import 'package:cvs_completer/data/variables/affiliation.dart';
import 'package:cvs_completer/data/variables/date_of_birth.dart';
import 'package:cvs_completer/data/variables/dominant_foot.dart';
import 'package:cvs_completer/data/variables/player_style_tag.dart';
import 'package:cvs_completer/data/variables/player_transfer_condition.dart';
import 'package:cvs_completer/data/variables/pool_level.dart';
import 'package:cvs_completer/data/variables/vimeo_uri.dart';
import 'package:cvs_completer/data/variables/youtube_uri.dart';
import 'package:dsf_ms_proto/proto/dreamstock/dsf_ms_scout/v3/pool_player.pb.dart'
    as pb;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player.freezed.dart';

@freezed
class ProPlayer with _$ProPlayer {
  const factory ProPlayer({
    required int id,
    required String spreadsheetId,
    required String nickname,
    required String fullName,
    required DateOfBirth dob,
    required double height,
    required DominantFoot dominantFoot,
    required List<Position> mainPositions,
    required List<Position> subPositions,
    required Level level,
    required Affiliation? currentTeam,
    required Affiliation? formerTeam,
    required Affiliation? lenderTeam,
    required YoutubeUri? youtubeUri,
    required VimeoUri? vimeoUri,
    Uri? transfermarktUri,
    required Uri? ogolUri,
    required String? instatId,
    required List<PlayerStyleTag> playerStyles,
    required int currentValue,
    required int desiredAnnualSalary,
    int? transferFee,
    @Default('') String otherCost,
    required bool isVerified,
    DateTime? confirmedAt,
    required PlayerTransferCondition transferCondition,
    required CreditedResource profileImage,
  }) = _ProPlayer;

  // ignore: unused_element
  const ProPlayer._();

  String? get videoForPodPlayer {
    if (youtubeUri != null) {
      return 'https://youtu.be/${youtubeUri!.id ?? ""}';
    } else if (vimeoUri != null) {
      return vimeoUri!.id;
    } else {
      return null;
    }
  }
}

@freezed
class CreditedResource with _$CreditedResource {
  const factory CreditedResource({
    required Uri uri,
    required String credit,
  }) = _CreditedResource;
}

/// extension to convert proto model to app model
extension PbPoolPlayerToAppOrder on pb.PoolPlayer {
  ProPlayer toPlayer() => ProPlayer(
        id: id.toInt(),
        spreadsheetId: spreadsheetId.toString(),
        nickname: nickname,
        // sometimes full names are set as "TBC"
        // if we haven't contracted with the agents.
        fullName: fullName.toUpperCase() == 'TBC' ? '' : fullName,

        dob: DateOfBirth(dateOfBirth.toDateTime()),
        height: height,
        dominantFoot: DominantFoot.fromPb(dominantFoot),
        mainPositions: firstPositions.map(Position.fromProto).toList(),
        subPositions: secondPositions.map(Position.fromProto).toList(),
        level: Level.fromPb(level),
        currentTeam: transferHistories.current(),
        formerTeam: transferHistories.former(),
        lenderTeam: transferHistories.lender(),
        youtubeUri: Uri.tryParse(youtubeUrl)
            ?.let((it) => it.host == 'www.youtube.com' ? YoutubeUri(it) : null),
        vimeoUri: Uri.tryParse(vimeoUrl)
            ?.let((it) => it.host == 'vimeo.com' ? VimeoUri(it) : null),
        transfermarktUri:
            transfermarktUrl.isNotEmpty ? Uri.tryParse(transfermarktUrl) : null,
        ogolUri: ogolUrl.isNotEmpty ? Uri.tryParse(ogolUrl) : null,
        instatId: instatId.isNotEmpty ? instatId : null,
        playerStyles: tags
            .map(PlayerStyleTag.tryParse)
            .whereType<PlayerStyleTag>()
            .toList(),
        currentValue: currentValue.toInt(),
        desiredAnnualSalary: desiredAnnualSalary.salary.toInt(),
        transferFee: hasTransferFee() ? transferFee.toInt() : null,
        otherCost: otherCosts,
        isVerified: hasVerifiedAt(),
        confirmedAt: hasConfirmedAt() ? confirmedAt.toDateTime() : null,
        transferCondition: PlayerTransferCondition.fromPb(transferCondition),
        profileImage: CreditedResource(
          uri: Uri.tryParse(profileImageUrl) ?? Uri.parse(''),
          credit: profileImageUrl.isNotEmpty ? profileImageCredit : '',
        ),
      );
}
