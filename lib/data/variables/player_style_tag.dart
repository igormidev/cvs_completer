// ignore_for_file: no_default_cases

import 'package:cvs_completer/data/players/pro_csv_mapper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_style_tag.freezed.dart';

@freezed
class CreditedResource with _$CreditedResource {
  const factory CreditedResource({
    required Uri uri,
    required String credit,
  }) = _CreditedResource;
}

@freezed
class PlayerStyleTag with _$PlayerStyleTag {
  const factory PlayerStyleTag({
    required PlayerStyleType type,
    required PlayerStyleState state,
  }) = _PlayerStyleTag;
  // ignore: unused_element
  const PlayerStyleTag._();

  // api-v3のtagはenumではなく任意のStringのリストである
  static PlayerStyleTag? tryParse(String tag) {
    final m = RegExp(r'^PlayerStyle_([A-Za-z0-9]+)_(\d)$').firstMatch(tag);
    if (m != null) {
      final t = '${m.group(1)![0].toLowerCase()}${m.group(1)!.substring(1)}';
      final s = int.parse(m.group(2)!);
      return PlayerStyleTag(
        type: PlayerStyleType.values.byName(t),
        state: PlayerStyleState.values.where((e) => e.number == s).first,
      );
    } else {
      return null;
    }
  }

  static PlayerStyleTag? fromCVS(
    String? key,
    CSVColumns column,
  ) {
    final state = int.tryParse(key ?? 'a');
    final hasState = state != null;
    if (hasState) {
      final stateMap = PlayerStyleState.values.where((e) => e.number == state);
      if (stateMap.isEmpty) {
        return null;
      }
      return PlayerStyleTag(
        type: PlayerStyleType.fromCSVColumn(
          column,
        )!,
        state: stateMap.first,
      );
    } else {
      final isCommon = key != null &&
          [CSVColumns.commonHardWorking, CSVColumns.commonLeadership]
              .contains(column);

      if (!isCommon) {
        return null;
      }

      return PlayerStyleTag(
        type: PlayerStyleType.fromCSVColumn(
          column,
        )!,
        state: PlayerStyleState.former, // Can be anyone...
      );
    }
  }
}

enum PlayerStyleState {
  current(1),
  former(2);

  const PlayerStyleState(this.number);
  final int number;
}

enum PlayerStyleType {
  gkStandard,
  gkDistribution,
  gkSweeper,
  cbMobilityAndAnticipation,
  cbBallPlaying,
  cbPower,
  sbInside,
  sbOffensive,
  sbDefensive,
  dmfConstruction,
  dmfDestruction,
  cmfBoxToBox,
  omfBalance,
  omfNumber10,
  omfShadowStriker,
  wgStandardWinger,
  wgInsideForward,
  wgFinisher,
  cfTargetMan,
  cfCreative,
  cfSpeed,
  commonHardWorking,
  commonLeadership;

  static PlayerStyleType? fromCSVColumn(CSVColumns columnType) {
    switch (columnType) {
      case CSVColumns.gkStandard:
        return PlayerStyleType.gkStandard;
      case CSVColumns.gkDistribution:
        return PlayerStyleType.gkDistribution;
      case CSVColumns.gkSweeper:
        return PlayerStyleType.gkSweeper;
      case CSVColumns.cbMobilityAndAnticipation:
        return PlayerStyleType.cbMobilityAndAnticipation;
      case CSVColumns.cbBallPlaying:
        return PlayerStyleType.cbBallPlaying;
      case CSVColumns.cbPower:
        return PlayerStyleType.cbPower;
      case CSVColumns.sbInside:
        return PlayerStyleType.sbInside;
      case CSVColumns.sbOffensive:
        return PlayerStyleType.sbOffensive;
      case CSVColumns.sbDefensive:
        return PlayerStyleType.sbDefensive;
      case CSVColumns.dmfConstruction:
        return PlayerStyleType.dmfConstruction;
      case CSVColumns.dmfDestruction:
        return PlayerStyleType.dmfDestruction;
      case CSVColumns.cmfBoxToBox:
        return PlayerStyleType.cmfBoxToBox;
      case CSVColumns.omfBalance:
        return PlayerStyleType.omfBalance;
      case CSVColumns.omfNumber10:
        return PlayerStyleType.omfNumber10;
      case CSVColumns.omfShadowStriker:
        return PlayerStyleType.omfShadowStriker;
      case CSVColumns.wgStandardWinger:
        return PlayerStyleType.wgStandardWinger;
      case CSVColumns.wgInsideForward:
        return PlayerStyleType.wgInsideForward;
      case CSVColumns.wgFinisher:
        return PlayerStyleType.wgFinisher;
      case CSVColumns.cfTargetMan:
        return PlayerStyleType.cfTargetMan;
      case CSVColumns.cfCreative:
        return PlayerStyleType.cfCreative;
      case CSVColumns.cfSpeed:
        return PlayerStyleType.cfSpeed;
      case CSVColumns.commonHardWorking:
        return PlayerStyleType.commonHardWorking;
      case CSVColumns.commonLeadership:
        return PlayerStyleType.commonLeadership;
      default:
        return null;
    }
  }
}
