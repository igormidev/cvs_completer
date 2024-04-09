import 'package:dsf_ms_proto/proto/dreamstock/dsf_ms_scout/v3/position.pbenum.dart'
    as proto;

enum Position {
  df,
  mf,
  fw,
  gk,
  cb,
  lsb,
  rsb,
  cmf,
  dmf,
  omf,
  // lmf,
  // rmf,
  cf,
  lwg,
  rwg;

  factory Position.fromProto(proto.Position input) {
    switch (input) {
      case proto.Position.POSITION_DF:
        return Position.df;
      case proto.Position.POSITION_MF:
        return Position.mf;
      case proto.Position.POSITION_FW:
        return Position.fw;
      case proto.Position.POSITION_GK:
        return Position.gk;
      case proto.Position.POSITION_CB:
        return Position.cb;
      case proto.Position.POSITION_LSB:
        return Position.lsb;
      case proto.Position.POSITION_RSB:
        return Position.rsb;
      case proto.Position.POSITION_CMF:
        return Position.cmf;
      case proto.Position.POSITION_DMF:
        return Position.dmf;
      case proto.Position.POSITION_OMF:
        return Position.omf;
      case proto.Position.POSITION_CF:
        return Position.cf;
      case proto.Position.POSITION_LWG:
        return Position.lwg;
      case proto.Position.POSITION_RWG:
        return Position.rwg;

      // RMF, LMFはpoolでは使わない
      // https://app.nuclino.com/dreamstock/dreamstock/20220829-26206914-95e4-4ce4-9bd1-744faec5c26a
      case proto.Position.POSITION_LMF:
      case proto.Position.POSITION_RMF:
      case proto.Position.POSITION_UNSPECIFIED:
        break;
    }
    throw Exception('Unexpected position is given.');
  }

  proto.Position get asProto {
    switch (this) {
      case Position.df:
        return proto.Position.POSITION_DF;
      case Position.mf:
        return proto.Position.POSITION_MF;
      case Position.fw:
        return proto.Position.POSITION_FW;
      case Position.gk:
        return proto.Position.POSITION_GK;
      case Position.cb:
        return proto.Position.POSITION_CB;
      case Position.lsb:
        return proto.Position.POSITION_LSB;
      case Position.rsb:
        return proto.Position.POSITION_RSB;
      case Position.cmf:
        return proto.Position.POSITION_CMF;
      case Position.dmf:
        return proto.Position.POSITION_DMF;
      case Position.omf:
        return proto.Position.POSITION_OMF;
      case Position.cf:
        return proto.Position.POSITION_CF;
      case Position.lwg:
        return proto.Position.POSITION_LWG;
      case Position.rwg:
        return proto.Position.POSITION_RWG;
    }
  }

  String displayName() {
    switch (this) {
      case Position.gk:
        return 'GK';

      // ignore: no_default_cases
      default:
        return name.toUpperCase();
    }
  }

  static List<Position> get all => Position.values
      .where(
        (element) => ![
          Position.fw,
          Position.df,
          Position.mf,
        ].contains(element),
      )
      .toList();
}

extension PositionListExt on List<Position> {
  List<proto.Position>? get asQuery =>
      isEmpty ? null : map((e) => e.asProto).toList();
}
