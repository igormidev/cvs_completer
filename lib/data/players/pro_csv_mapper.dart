// ignore_for_file: sort_constructors_first, depend_on_referenced_packages
import 'dart:developer';
import 'package:collection/collection.dart';
import 'package:cvs_completer/core/string.dart';
import 'package:enchanted_collection/enchanted_collection.dart';

class CsvMapper {
  CsvMapper._({
    required this.targetColumnAndCorrespondingIndexInRow,
  });
  final Map<CSVColumns, int> targetColumnAndCorrespondingIndexInRow;

  factory CsvMapper.fromIdentifierLines(List<dynamic> identifierLine) {
    final map = Map.fromEntries(
      identifierLine.mapper((line, isFirst, isLast, index) {
        final identifier = CSVColumns.fromText('$line');
        if (identifier == null) return null;
        return MapEntry(identifier, index);
      }).removeNull,
    );

    for (final element in CSVColumns.values) {
      if (!map.containsKey(element)) {
        log('[${identifierLine.first}] ProCsvMapper.fromIdentifierLines: $element not found in map');
      }
    }

    return CsvMapper._(
      targetColumnAndCorrespondingIndexInRow: map,
    );
  }
}

enum CSVColumns {
  id('id'),
  nickname('nickname'),
  transfermarktOrOgol('transfermarkt'),
  age('age'),
  dob('dob'),
  playerstat('playerstat'),
  height('height'),
  dominantfoot('foot'),
  photoLink('photolink'),
  photoCredits('photocredits'),
  fullName('fullname'),
  currentTeamName('club'),
  currentTeamLeague('league'),
  currentTeamJoinedAt('joined'),
  currentTeamContractExpiresAt('contractexpires'),
  loanTeamName('onloanfrom'),
  baseUUID('baseuuid'),
  idWyscout('idwyscout'),
  state('countrystate'),
  loanTeamExpiresAt('contractthereexpires'),
  positionTransfermarkt('positiontm'),
  mainPosition('adjustedmainpositionanalyzing'),
  mainSubpositions('adjustedotherpositionsanalyzing'),
  currentValue('currentvalue'),
  yearSalary('salaryyearlyusd'),
  transferFee('transferfeeusd'),
  nationality('nationality'),
  conditions('conditions'),
  over50Minutes('over50ofminutes'),
  videoUrl('youtubelink'),
  lastEvaluationDate('lastevaluationdate'),
  pool('pool'),

  // <-------- AGENT RELATED -------->
  agentName('agent'),
  agentEmail('agentsemail'),
  agentPhone('agentsphone'),
  agencyName('agency'),
  // <-------- AGENT RELATED -------->

  // <-------- PLAYER STYLE -------->
  gkStandard('standard'),
  gkDistribution('distribution'),
  gkSweeper('sweeper'),
  cbMobilityAndAnticipation('mobilityanticipation'),
  cbBallPlaying('ballplaying'),
  cbPower('power'),
  sbInside('insidesideback'),
  sbOffensive('offensivesideback'),
  sbDefensive('defensivesideback'),
  dmfConstruction('construction'),
  dmfDestruction('destruction'),
  cmfBoxToBox('boxtobox'),
  omfBalance('balance'),
  omfNumber10('number10'),
  omfShadowStriker('shadowstriker'),
  wgStandardWinger('standardwinger'),
  wgInsideForward('insideforward'),
  wgFinisher('finisher'),
  cfTargetMan('targetman'),
  cfCreative('crativeforward'),
  cfSpeed('speed'),
  commonHardWorking('hardworking'),
  commonLeadership('leadership'),
  // <-------- PLAYER STYLE -------->

  //
  ;

  final String textIdentifier;

  const CSVColumns(this.textIdentifier);

  static CSVColumns? fromText(String text) {
    final cleanText = text.toLowerCase().onlyCaractersAndNumbers;
    return CSVColumns.values
        .firstWhereOrNull((element) => element.textIdentifier == cleanText);
  }
}
