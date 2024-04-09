import 'package:freezed_annotation/freezed_annotation.dart';

enum Position {
  @JsonValue('GK')
  gk,
  @JsonValue('DF')
  df,
  @JsonValue('MF')
  mf,
  @JsonValue('FW')
  fw,
  @JsonValue('CB')
  cb,
  @JsonValue('LSB')
  lsb,
  @JsonValue('RSB')
  rsb,
  @JsonValue('DMF')
  dmf,
  @JsonValue('LMF')
  lmf,
  @JsonValue('RMF')
  rmf,
  @JsonValue('LWG')
  lwg,
  @JsonValue('RWG')
  rwg,
  @JsonValue('OMF')
  omf,
  @JsonValue('CF')
  cf;

  static Position? fromString(String code) {
    switch (code) {
      case 'GK':
        return Position.gk;
      case 'DF':
        return Position.df;
      case 'MF':
        return Position.mf;
      case 'FW':
        return Position.fw;
      case 'CB':
        return Position.cb;
      case 'LSB':
        return Position.lsb;
      case 'RSB':
        return Position.rsb;
      case 'DMF':
        return Position.dmf;
      case 'LMF':
        return Position.lmf;
      case 'RMF':
        return Position.rmf;
      case 'LWG':
        return Position.lwg;
      case 'RWG':
        return Position.rwg;
      case 'OMF':
        return Position.omf;
      case 'CF':
        return Position.cf;
      default:
        return null;
    }
  }
}

extension PositionExt on Position {
  String get code {
    switch (this) {
      case Position.gk:
        return 'GK';
      case Position.df:
        return 'DF';
      case Position.mf:
        return 'MF';
      case Position.fw:
        return 'FW';
      case Position.cb:
        return 'CB';
      case Position.lsb:
        return 'LSB';
      case Position.rsb:
        return 'RSB';
      case Position.dmf:
        return 'DMF';
      case Position.lmf:
        return 'LMF';
      case Position.rmf:
        return 'RMF';
      case Position.lwg:
        return 'LWG';
      case Position.rwg:
        return 'RWG';
      case Position.omf:
        return 'OMF';
      case Position.cf:
        return 'CF';
    }
  }

  static Position? fromString(String code) {
    switch (code) {
      case 'GK':
        return Position.gk;
      case 'DF':
        return Position.df;
      case 'MF':
        return Position.mf;
      case 'FW':
        return Position.fw;
      case 'CB':
        return Position.cb;
      case 'LSB':
        return Position.lsb;
      case 'RSB':
        return Position.rsb;
      case 'DMF':
        return Position.dmf;
      case 'LMF':
        return Position.lmf;
      case 'RMF':
        return Position.rmf;
      case 'LWG':
        return Position.lwg;
      case 'RWG':
        return Position.rwg;
      case 'OMF':
        return Position.omf;
      case 'CF':
        return Position.cf;
      default:
        return null;
    }
  }

  String get textName {
    switch (this) {
      case Position.gk:
        return 'Goal keeper';
      case Position.df:
        return 'Defensive fielder';
      case Position.mf:
        return 'Mid fielder';
      case Position.fw:
        return 'Forward';
      case Position.cb:
        return 'Center back';
      case Position.lsb:
        return 'Left side back';
      case Position.rsb:
        return 'Right side back';
      case Position.dmf:
        return 'Defensive mid fielder';
      case Position.lmf:
        return 'Left mid fielder';
      case Position.rmf:
        return 'Right mid fielder';
      case Position.lwg:
        return 'Left wing forward';
      case Position.rwg:
        return 'Right wing forward';
      case Position.omf:
        return 'Offensive mid fielder';
      case Position.cf:
        return 'Center forward';
    }
  }

  Position get category {
    switch (this) {
      case Position.cb:
      case Position.lsb:
      case Position.rsb:
      case Position.df:
        return Position.df;
      case Position.dmf:
      case Position.lmf:
      case Position.rmf:
      case Position.omf:
      case Position.mf:
        return Position.mf;
      case Position.lwg:
      case Position.rwg:
      case Position.cf:
      case Position.fw:
        return Position.fw;
      case Position.gk:
        return Position.gk;
    }
  }

  static List<Position> get categoryGk => [Position.gk];
  static List<Position> get categoryDf =>
      [Position.cb, Position.lsb, Position.rsb];
  static List<Position> get categoryMf =>
      [Position.dmf, Position.omf, Position.lmf, Position.rmf];

  static List<Position> get categoryFw =>
      [Position.cf, Position.lwg, Position.rwg];

  List<Position> get subCategory {
    switch (this) {
      case Position.gk:
        return categoryGk;
      case Position.df:
        return categoryDf;
      case Position.mf:
        return categoryMf;
      case Position.fw:
        return categoryFw;
      // ignore: no_default_cases
      default:
        return [];
    }
  }

  bool get isSubCategory =>
      (categoryGk.contains(this) ||
          categoryDf.contains(this) ||
          categoryMf.contains(this) ||
          categoryFw.contains(this)) &&
      (this != category);
}

extension PositionsExt on List<Position> {
  List<Position> get firstTwoPositions {
    final subPositions = where((e) => e.isSubCategory).toList();
    final categoryPositions = where((e) => !e.isSubCategory).toList();
    if (subPositions.length >= 2) {
      return subPositions.getRange(0, 2).toList();
    } else if (subPositions.length == 1) {
      return subPositions;
    } else if (subPositions.isEmpty && categoryPositions.length >= 2) {
      return categoryPositions.getRange(0, 2).toList();
    } else {
      return categoryPositions;
    }
  }

  /// only sub positions where
  List<Position> get whereSubCategory {
    // Include gk in sub positions.
    final subs = where((e) => e.isSubCategory || e == Position.gk);
    return subs.toList();
  }
}
