import 'package:collection/collection.dart';
import 'package:cvs_completer/core/utils.dart';
import 'package:cvs_completer/data/variables/team.dart';
import 'package:dsf_ms_proto/proto/dreamstock/dsf_ms_scout/v3/league.pb.dart'
    as pb;
import 'package:dsf_ms_proto/proto/dreamstock/dsf_ms_scout/v3/team.pb.dart'
    as pb;
import 'package:dsf_ms_proto/proto/dreamstock/dsf_ms_scout/v3/pool_player.pb.dart'
    as pb;
import 'package:fixnum/fixnum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'affiliation.freezed.dart';

/// Affiliation
/// 選手の所属情報
@freezed
class Affiliation with _$Affiliation {
  const factory Affiliation.current({
    required Team team,
    DateTime? contractEndedAt,
  }) = _CurrentAffiliation;
  const factory Affiliation.lender({
    required Team team,
    DateTime? contractEndedAt,
  }) = _LenderAffiliation;
  const factory Affiliation.former({
    required Team team,
    DateTime? contractEndedAt,
  }) = _FormerAffiliation;

  factory Affiliation.fromPb(pb.PoolPlayerTransfer p) {
    switch (p.transferType) {
      case pb.PoolPlayerTransferType.POOL_PLAYER_TRANSFER_TYPE_CURRENT:
        return Affiliation.current(
          team: Team.fromPb(p.team, league: p.league),
          contractEndedAt:
              p.hasContractEndedAt() ? p.contractEndedAt.toDateTime() : null,
        );
      case pb.PoolPlayerTransferType.POOL_PLAYER_TRANSFER_TYPE_LOAN_DEAL:
        return Affiliation.lender(team: Team.fromPb(p.team, league: p.league));
      case pb.PoolPlayerTransferType.POOL_PLAYER_TRANSFER_TYPE_LAST:
        return Affiliation.former(team: Team.fromPb(p.team, league: p.league));
      // ignore: no_default_cases
      default:
        throw ArgumentError('invalid transfer type');
    }
  }
}

extension PbTransferExt on List<pb.PoolPlayerTransfer> {
  Affiliation? current() =>
      _get(pb.PoolPlayerTransferType.POOL_PLAYER_TRANSFER_TYPE_CURRENT);

  Affiliation? former() =>
      _get(pb.PoolPlayerTransferType.POOL_PLAYER_TRANSFER_TYPE_LAST);

  Affiliation? lender() =>
      _get(pb.PoolPlayerTransferType.POOL_PLAYER_TRANSFER_TYPE_LOAN_DEAL);

  Affiliation? _get(pb.PoolPlayerTransferType type) =>
      whereNot((e) => e.team.id == Int64(10000000))
          .firstWhereOrNull((e) => e.transferType == type)
          ?.let(Affiliation.fromPb);
}
