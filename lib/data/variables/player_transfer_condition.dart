import 'package:dsf_ms_proto/proto/dreamstock/dsf_ms_scout/v3/pool_player.pb.dart'
    as pb;

enum PlayerTransferCondition {
  freeTransfer, //
  freeLoan,
  freeLoanWithBuyOption,
  paidTransfer, //
  paidLoan,
  paidLoanWithBuyOption,
  tbd; //

  static PlayerTransferCondition fromText(String text) {
    switch (text) {
      case 'Free Transfer':
        return PlayerTransferCondition.freeTransfer;
      case 'Paid Transfer':
        return PlayerTransferCondition.paidTransfer;
      case 'Free Loan':
        return PlayerTransferCondition.freeLoan;
      case 'Cree Loan w/ Buy Option':
        return PlayerTransferCondition.freeLoanWithBuyOption;
      case 'Paid Loan w/ Buy Option':
        return PlayerTransferCondition.paidLoanWithBuyOption;
      case 'Paid Loan':
        return PlayerTransferCondition.paidLoan;
      default:
        return PlayerTransferCondition.tbd;
    }
  }

  factory PlayerTransferCondition.fromPb(pb.PoolPlayerTransferCondition l) {
    switch (l) {
      case pb.PoolPlayerTransferCondition
            .POOL_PLAYER_TRANSFER_CONDITION_FREE_TRANSFER:
        return PlayerTransferCondition.freeTransfer;
      case pb.PoolPlayerTransferCondition
            .POOL_PLAYER_TRANSFER_CONDITION_FREE_LOAN:
        return PlayerTransferCondition.freeLoan;
      case pb.PoolPlayerTransferCondition
            .POOL_PLAYER_TRANSFER_CONDITION_FREE_LOAN_WITH_BUY_OPTION:
        return PlayerTransferCondition.freeLoanWithBuyOption;
      case pb.PoolPlayerTransferCondition
            .POOL_PLAYER_TRANSFER_CONDITION_PAID_TRANSFER:
        return PlayerTransferCondition.paidTransfer;
      case pb.PoolPlayerTransferCondition
            .POOL_PLAYER_TRANSFER_CONDITION_PAID_LOAN:
        return PlayerTransferCondition.paidLoan;
      case pb.PoolPlayerTransferCondition
            .POOL_PLAYER_TRANSFER_CONDITION_PAID_LOAN_WITH_BUY_OPTION:
        return PlayerTransferCondition.paidLoanWithBuyOption;
      case pb.PoolPlayerTransferCondition
            .POOL_PLAYER_TRANSFER_CONDITION_UNSPECIFIED:
        return PlayerTransferCondition.tbd;
      // ignore: no_default_cases
      default:
        throw ArgumentError("unknown player's transfer condition");
    }
  }
}
