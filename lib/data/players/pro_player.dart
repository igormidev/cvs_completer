// ignore_for_file: public_member_api_docs
// ignore_for_file: sort_constructors_first

import 'package:cvs_completer/core/string.dart';
import 'package:cvs_completer/core/extensions.dart';
import 'package:cvs_completer/data/players/pro_csv_mapper.dart';
import 'package:cvs_completer/data/variables/agent_infos.dart';
import 'package:cvs_completer/data/variables/date_of_birth.dart';
import 'package:cvs_completer/data/variables/dominant_foot.dart';
import 'package:cvs_completer/data/variables/filter_country.dart';
import 'package:cvs_completer/data/variables/player_style_tag.dart';
import 'package:cvs_completer/data/variables/player_transfer_condition.dart';
import 'package:cvs_completer/data/variables/pool_level.dart';
import 'package:cvs_completer/data/variables/position.dart';
import 'package:cvs_completer/data/variables/vimeo_uri.dart';
import 'package:cvs_completer/data/variables/youtube_uri.dart';
import 'package:enchanted_collection/enchanted_collection.dart';

class ProPlayer {
  const ProPlayer({
    required this.id,
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
    required this.transferFeeInDollar,
    required this.transferCondition,
    required this.playerStyles,
    required this.isVerified,
    required this.profileImage,
    required this.nationality,
    required this.currentTeam,
    required this.loanTeam,
    required this.youtubeUri,
    required this.vimeoUri,
    required this.transfermarktUri,
    required this.ogolUri,
    required this.currentValue,
    required this.annualSalary,
    required this.agentInfos,
  });

  final String fullName;
  final String? nationality;
  final FilterAppContry country;
  final DateOfBirth dob;
  final int height;
  final DominantFoot dominantFoot;
  final List<Position>? transferMarketingPosition;
  final List<Position>? mainPositions;
  final List<Position>? subPositions;
  final Level level;
  final CurrentTeam? currentTeam;
  final LoanTeam? loanTeam;
  final YoutubeUri? youtubeUri;
  final VimeoUri? vimeoUri;
  final Uri? transfermarktUri;
  final Uri? ogolUri;
  final List<PlayerStyleTag> playerStyles;
  final bool isVerified;
  final CreditedResource? profileImage;
  final int id;
  final String nickname;
  final PlayerTransferCondition transferCondition;
  final double? currentValue;
  final double? annualSalary;
  final double? transferFeeInDollar;
  final AgentInfos agentInfos;

  static List<ProPlayer> fromAllCVS(
    List<List<dynamic>> data,
  ) {
    final response = <ProPlayer>[];
    var index = -1;
    CsvMapper? mapper;
    for (final line in data) {
      index++;

      if (index == 0) {
        mapper = CsvMapper.fromIdentifierLines(line);
      } else {
        final proPlayer = ProPlayer.fromCVSLine(line, mapper!);
        if (proPlayer != null) {
          response.add(proPlayer);
        }
      }
    }

    /*
      
    */

    final countryAndOccourenciesCount = <String, int>{};

    for (final entry in response) {
      final key = entry.nationality;
      if (entry.country == FilterAppContry.unknown) {
        countryAndOccourenciesCount[key.toString()] =
            (countryAndOccourenciesCount[key.toString()] ?? 0) + 1;
      }
    }

    // TODO(IGOR): Remove this. Just for testing pourposes
    // final cs = countryAndOccourenciesCount.entries.toList();
    // cs.sort(
    //   (a, b) => b.value.compareTo(a.value),
    // );

    // for (final entry in cs) {
    //   print('${entry.key}: ${entry.value}');
    // }

    return response;
  }

  static ProPlayer? fromCVSLine(
    List<dynamic> data,
    CsvMapper csvMapper,
  ) {
    // print('gotTOUserWithId: ${data[0]}');
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

    final currentTeamLeague =
        data[mapper[CSVColumns.currentTeamLeague]!] as String?;

    final currentTeamJoinedAt =
        data[mapper[CSVColumns.currentTeamJoinedAt]!] as String?;

    final currentTeamJoinedAtDate =
        currentTeamJoinedAt == null || currentTeamJoinedAt.isEmpty
            ? null
            : DateTime(
                int.parse(currentTeamJoinedAt.substring(0, 4)),
                int.parse(currentTeamJoinedAt.substring(5, 7)),
                int.parse(currentTeamJoinedAt.substring(8, 10)),
              );

    final loanTeamName = data[mapper[CSVColumns.loanTeamName]!] as String?;
    final loanTeamExpiresAt =
        data[mapper[CSVColumns.loanTeamExpiresAt]!] == null
            ? null
            : '${data[mapper[CSVColumns.loanTeamExpiresAt]!]}';
    // print('loanTeamExpiresAt: $loanTeamExpiresAt');
    final loanTeamExpiresAtDate = loanTeamExpiresAt == null ||
            loanTeamExpiresAt.isEmpty ||
            loanTeamExpiresAt.length != 10
        ? null
        : DateTime(
            int.parse(loanTeamExpiresAt.substring(0, 4)),
            int.parse(loanTeamExpiresAt.substring(5, 7)),
            int.parse(loanTeamExpiresAt.substring(8, 10)),
          );

    final photoUri = data[mapper[CSVColumns.photoLink]!] as String?;
    final credit = data[mapper[CSVColumns.photoCredits]!] as String?;
    final cleanCurrentValue =
        (data[mapper[CSVColumns.currentValue]!] as String?)?.onlyDigits;
    final dominantFootText = data[mapper[CSVColumns.dominantfoot]!] as String?;
    if (dominantFootText == null) {
      return null;
    }
    var heightValue = data[mapper[CSVColumns.height]!] == ''
        ? null
        : data[mapper[CSVColumns.height]!] as int?;

    if (heightValue == null || heightValue == 0) {
      return null;
    }
    if (heightValue < 100) {
      heightValue = heightValue * 10;
    }

    final agentName = data[mapper[CSVColumns.agentName]!];
    final agentEmail = data[mapper[CSVColumns.agentEmail]!];
    final agentPhone = data[mapper[CSVColumns.agentPhone]!];
    final agencyName = data[mapper[CSVColumns.agencyName]!];

    return ProPlayer(
      transferFeeInDollar: double.tryParse(
        (data[mapper[CSVColumns.transferFee]!] as String?)?.onlyDigits ?? '',
      ),
      annualSalary: double.tryParse(
        (data[mapper[CSVColumns.yearSalary]!] as String?)?.onlyDigits ?? '',
      ),
      currentValue: double.tryParse(cleanCurrentValue ?? ''),
      transferCondition: PlayerTransferCondition.fromText(
        data[mapper[CSVColumns.conditions]!] as String,
      ),
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
      isVerified: (data[mapper[CSVColumns.conditions]!] as String?) == 'SIM',
      profileImage: photoUri == null || credit == null
          ? null
          : CreditedResource(
              uri: Uri.parse(photoUri),
              credit: credit,
            ),
      currentTeam: currentTeamName == null ||
              currentTeamLeague == null ||
              currentTeamJoinedAtDate == null
          ? null
          : CurrentTeam(
              joinetAt: currentTeamJoinedAtDate,
              league: currentTeamLeague,
              name: currentTeamName,
            ),
      loanTeam: loanTeamName == null || loanTeamExpiresAtDate == null
          ? null
          : LoanTeam(
              name: loanTeamName,
              loanExpiresAt: loanTeamExpiresAtDate,
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
      transfermarktUri: (playerSite?.contains('www.transfermarkt') ?? false)
          ? Uri.parse(playerSite!)
          : null,
      dob: DateOfBirth(
        DateTime(
          int.parse(dobYear),
          int.parse(dobMonth),
          int.parse(dobDay),
        ),
      ),
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

class CurrentTeam {
  final String name;
  final String league;
  final DateTime joinetAt;
  const CurrentTeam({
    required this.name,
    required this.league,
    required this.joinetAt,
  });
}

class LoanTeam {
  final String name;
  final DateTime loanExpiresAt;

  const LoanTeam({
    required this.name,
    required this.loanExpiresAt,
  });
}
