import 'package:cvs_completer/core/extensions.dart';
import 'package:cvs_completer/data/players/pro_csv_mapper.dart';
import 'package:cvs_completer/data/variables/age_group.dart';
import 'package:cvs_completer/data/variables/agent_infos.dart';
import 'package:cvs_completer/data/variables/date_of_birth.dart';
import 'package:cvs_completer/data/variables/dominant_foot.dart';
import 'package:cvs_completer/data/variables/filter_country.dart';
import 'package:cvs_completer/data/variables/player_style_tag.dart';
import 'package:cvs_completer/data/variables/pool_level.dart';
import 'package:cvs_completer/data/variables/position.dart';
import 'package:cvs_completer/data/variables/vimeo_uri.dart';
import 'package:cvs_completer/data/variables/youtube_uri.dart';
import 'package:enchanted_collection/enchanted_collection.dart';

class BasePlayer {
  const BasePlayer({
    required this.id,
    required this.stateName,
    required this.nickname,
    required this.fullName,
    required this.country,
    required this.dob,
    required this.height,
    required this.dominantFoot,
    required this.transferMarketingPosition,
    required this.mainPositions,
    required this.subPositions,
    required this.level,
    required this.playerStyles,
    required this.profileImage,
    required this.nationality,
    required this.ageGroup,
    required this.youtubeUri,
    required this.vimeoUri,
    required this.ogolUri,
    required this.currentTeamName,
    required this.agentInfos,
  });
  final String fullName;
  final String nationality;
  final FilterAppContry country;
  final DateOfBirth dob;
  final int height;
  final DominantFoot dominantFoot;
  final List<Position>? transferMarketingPosition;
  final List<Position>? mainPositions;
  final List<Position>? subPositions;
  final Level level;
  final YoutubeUri? youtubeUri;
  final VimeoUri? vimeoUri;
  final AgeGroup ageGroup;
  final Uri? ogolUri;
  final List<PlayerStyleTag> playerStyles;
  final CreditedResource? profileImage;
  final int id;
  final String nickname;

  // - Mostrar sem clube
  // - Não tem liga
  // - Retirar os com texto 'aposentado
  // - Os em branco significa não sabe (Unknown)
  final String? currentTeamName;
  final String? stateName;
  final AgentInfos agentInfos;

  static List<BasePlayer> fromAllCVS(
    List<List<dynamic>> data,
  ) {
    final response = <BasePlayer>[];
    var index = -1;
    CsvMapper? mapper;
    for (final line in data) {
      index++;

      if (index == 0) {
        mapper = CsvMapper.fromIdentifierLines(line);
      } else {
        final basePlayer = BasePlayer.fromCVSLine(line, mapper!);
        if (basePlayer != null) {
          response.add(basePlayer);
        }
      }
      // fromText
    }

    return response;
  }

  static BasePlayer? fromCVSLine(
    List<dynamic> data,
    CsvMapper csvMapper,
  ) {
    final mapper = csvMapper.targetColumnAndCorrespondingIndexInRow;
    final country = data[mapper[CSVColumns.nationality]!];
    final dobDate = data[mapper[CSVColumns.dob]!] as String?;
    if (dobDate == null || dobDate.length != 10) {
      return null;
    }
    // The date will be in format like: 1997-03-21
    final dobYear = dobDate.substring(0, 4);
    final dobMonth = dobDate.substring(5, 7);
    final dobDay = dobDate.substring(8, 10);

    final playerSite = data[mapper[CSVColumns.transfermarktOrOgol]!] as String?;

    final rawCurrentTeamName = data[mapper[CSVColumns.currentTeamName]!];
    final currentTeamName =
        rawCurrentTeamName == null || '$rawCurrentTeamName'.trim().isEmpty
            ? null
            : '$rawCurrentTeamName';

    final photoUri = data[mapper[CSVColumns.photoLink]!] as String?;
    final credit = data[mapper[CSVColumns.photoCredits]!] as String?;
    final dominantFootText = data[mapper[CSVColumns.dominantfoot]!] as String?;
    if (dominantFootText == null) {
      return null;
    }
    final heightValue = data[mapper[CSVColumns.height]!] == ''
        ? null
        : data[mapper[CSVColumns.height]!] as int?;

    if (heightValue == null || heightValue == 0) {
      return null;
    }

    final agentName = data[mapper[CSVColumns.agentName]!];
    final agentEmail = data[mapper[CSVColumns.agentEmail]!];
    final agentPhone = data[mapper[CSVColumns.agentPhone]!];
    final agencyName = data[mapper[CSVColumns.agencyName]!];

    final dob = DateOfBirth(
      DateTime(
        int.parse(dobYear),
        int.parse(dobMonth),
        int.parse(dobDay),
      ),
    );

    return BasePlayer(
      ageGroup: AgeGroup.fromDateOfBirth(dob.datetime),
      currentTeamName: currentTeamName,
      stateName: data[mapper[CSVColumns.state]!] as String?,
      agentInfos: AgentInfos(
        agentName: agentName == null ? null : '$agentName',
        agentEmail: agentEmail == null ? null : '$agentEmail',
        agentPhone: agentPhone == null ? null : '$agentPhone',
        agencyName: agencyName == null ? null : '$agencyName',
      ),
      playerStyles: [
        CSVColumns.gkStandard,
        CSVColumns.gkDistribution,
        CSVColumns.gkSweeper,
        CSVColumns.cbMobilityAndAnticipation,
        CSVColumns.cbBallPlaying,
        CSVColumns.cbPower,
        CSVColumns.sbInside,
        CSVColumns.sbOffensive,
        CSVColumns.sbDefensive,
        CSVColumns.dmfConstruction,
        CSVColumns.dmfDestruction,
        CSVColumns.cmfBoxToBox,
        CSVColumns.omfBalance,
        CSVColumns.omfNumber10,
        CSVColumns.omfShadowStriker,
        CSVColumns.wgStandardWinger,
        CSVColumns.wgInsideForward,
        CSVColumns.wgFinisher,
        CSVColumns.cfTargetMan,
        CSVColumns.cfCreative,
        CSVColumns.cfSpeed,
        CSVColumns.commonHardWorking,
        CSVColumns.commonLeadership,
      ]
          .map(
            (e) => PlayerStyleTag.fromCVS(
              '${data[mapper[e]!]}',
              e,
            ),
          )
          .removeNull
          .toList(),
      level: Level.fromCVSText(data[mapper[CSVColumns.pool]!] as String?),
      fullName: data[mapper[CSVColumns.fullName]!] as String,
      id: data[mapper[CSVColumns.id]!] as int,
      nickname: data[mapper[CSVColumns.nickname]!] as String,
      nationality: data[mapper[CSVColumns.nationality]!] as String,
      country: FilterAppContry.fromCode('$country'),
      height: heightValue,
      profileImage: photoUri == null || credit == null
          ? null
          : CreditedResource(
              uri: Uri.parse(photoUri),
              credit: credit,
            ),
      transferMarketingPosition:
          (data[mapper[CSVColumns.positionTransfermarkt]!] as String?)
              ?.split(' ')
              .removeNullOrEmpty()
              .returnNullIfEmpty()
              ?.map(Position.fromString)
              .whereType<Position>()
              .removeNull
              .toList(),
      mainPositions: (data[mapper[CSVColumns.mainPosition]!] as String?)
          ?.split(' ')
          .removeNullOrEmpty()
          .returnNullIfEmpty()
          ?.map(Position.fromString)
          .whereType<Position>()
          .toList(),
      subPositions: (data[mapper[CSVColumns.mainSubpositions]!] as String?)
          ?.split(' ')
          .returnNullIfEmpty()
          ?.removeNullOrEmpty()
          .map(Position.fromString)
          .whereType<Position>()
          .toList(),
      dominantFoot: DominantFoot.fromText(
        dominantFootText,
      ),
      ogolUri: (playerSite?.contains('www.ogol') ?? false)
          ? Uri.parse(playerSite!)
          : null,
      dob: dob,
      vimeoUri: data[mapper[CSVColumns.videoUrl]!] == null
          ? null
          : (data[mapper[CSVColumns.videoUrl]!] as String).contains('vimeo')
              ? null
              : VimeoUri(
                  Uri.parse(data[mapper[CSVColumns.videoUrl]!] as String),
                ),
      youtubeUri: data[mapper[CSVColumns.videoUrl]!] == null
          ? null
          : (data[mapper[CSVColumns.videoUrl]!] as String).contains('youtube')
              ? null
              : YoutubeUri(
                  Uri.parse(data[mapper[CSVColumns.videoUrl]!] as String),
                ),
    );
  }
}
