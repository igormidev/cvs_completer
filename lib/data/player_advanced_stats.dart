import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PlayerAdvancedStat {
  final int? accelerations;
  final int? aerialDuels;
  final int? assists;
  final int? crosses;
  final int? defensiveActions;
  final int? defensiveDuels;
  final int? defensiveDuelsWon;
  final int? directRedCards;
  final int? dribbles;
  final int? duels;
  final int? duelsWon;
  final int? fouls;
  final int? foulsSuffered;
  final int? freeKicks;
  final int? freeKicksOnTarget;
  final int? gkExits;
  final int? gkSaves;
  final int? gkShotsAgainst;
  final int? gkSuccessfulExits;
  final int? goalKicks;
  final int? headShots;
  final int? interceptions;
  final int? keyPasses;
  final int? lateralPasses;
  final int? longPasses;
  final int? offensiveDuels;
  final int? offensiveDuelsWon;
  final int? passes;
  final int? passesToFinalThird;
  final int? penalties;
  final int? progressivePasses;
  final int? progressiveRun;
  final int? receivedPass;
  final int? secondAssists;
  final int? shots;
  final int? shotsBlocked;
  final int? shotsOnTarget;
  final int? successfulAttackingActions;
  final int? successfulBackPasses;
  final int? successfulCrosses;
  final int? successfulDefensiveAction;
  final int? successfulDribbles;
  final int? successfulForwardPasses;
  final int? successfulGoalKicks;
  final int? successfulKeyPasses;
  final int? successfulLateralPasses;
  final int? successfulLongPasses;
  final int? successfulPasses;
  final int? successfulPassesToFinalThird;
  final int? successfulPenalties;
  final int? successfulProgressivePasses;

  const PlayerAdvancedStat({
    this.accelerations,
    this.aerialDuels,
    this.assists,
    this.crosses,
    this.defensiveActions,
    this.defensiveDuels,
    this.defensiveDuelsWon,
    this.directRedCards,
    this.dribbles,
    this.duels,
    this.duelsWon,
    this.fouls,
    this.foulsSuffered,
    this.freeKicks,
    this.freeKicksOnTarget,
    this.gkExits,
    this.gkSaves,
    this.gkShotsAgainst,
    this.gkSuccessfulExits,
    this.goalKicks,
    this.headShots,
    this.interceptions,
    this.keyPasses,
    this.lateralPasses,
    this.longPasses,
    this.offensiveDuels,
    this.offensiveDuelsWon,
    this.passes,
    this.passesToFinalThird,
    this.penalties,
    this.progressivePasses,
    this.progressiveRun,
    this.receivedPass,
    this.secondAssists,
    this.shots,
    this.shotsBlocked,
    this.shotsOnTarget,
    this.successfulAttackingActions,
    this.successfulBackPasses,
    this.successfulCrosses,
    this.successfulDefensiveAction,
    this.successfulDribbles,
    this.successfulForwardPasses,
    this.successfulGoalKicks,
    this.successfulKeyPasses,
    this.successfulLateralPasses,
    this.successfulLongPasses,
    this.successfulPasses,
    this.successfulPassesToFinalThird,
    this.successfulPenalties,
    this.successfulProgressivePasses,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accelerations': accelerations,
      'aerialDuels': aerialDuels,
      'assists': assists,
      'crosses': crosses,
      'defensiveActions': defensiveActions,
      'defensiveDuels': defensiveDuels,
      'defensiveDuelsWon': defensiveDuelsWon,
      'directRedCards': directRedCards,
      'dribbles': dribbles,
      'duels': duels,
      'duelsWon': duelsWon,
      'fouls': fouls,
      'foulsSuffered': foulsSuffered,
      'freeKicks': freeKicks,
      'freeKicksOnTarget': freeKicksOnTarget,
      'gkExits': gkExits,
      'gkSaves': gkSaves,
      'gkShotsAgainst': gkShotsAgainst,
      'gkSuccessfulExits': gkSuccessfulExits,
      'goalKicks': goalKicks,
      'headShots': headShots,
      'interceptions': interceptions,
      'keyPasses': keyPasses,
      'lateralPasses': lateralPasses,
      'longPasses': longPasses,
      'offensiveDuels': offensiveDuels,
      'offensiveDuelsWon': offensiveDuelsWon,
      'passes': passes,
      'passesToFinalThird': passesToFinalThird,
      'penalties': penalties,
      'progressivePasses': progressivePasses,
      'progressiveRun': progressiveRun,
      'receivedPass': receivedPass,
      'secondAssists': secondAssists,
      'shots': shots,
      'shotsBlocked': shotsBlocked,
      'shotsOnTarget': shotsOnTarget,
      'successfulAttackingActions': successfulAttackingActions,
      'successfulBackPasses': successfulBackPasses,
      'successfulCrosses': successfulCrosses,
      'successfulDefensiveAction': successfulDefensiveAction,
      'successfulDribbles': successfulDribbles,
      'successfulForwardPasses': successfulForwardPasses,
      'successfulGoalKicks': successfulGoalKicks,
      'successfulKeyPasses': successfulKeyPasses,
      'successfulLateralPasses': successfulLateralPasses,
      'successfulLongPasses': successfulLongPasses,
      'successfulPasses': successfulPasses,
      'successfulPassesToFinalThird': successfulPassesToFinalThird,
      'successfulPenalties': successfulPenalties,
      'successfulProgressivePasses': successfulProgressivePasses,
    };
  }

  factory PlayerAdvancedStat.fromMap(Map<String, dynamic> map) {
    return PlayerAdvancedStat(
      accelerations:
          map['accelerations'] != null ? map['accelerations'] as int : null,
      aerialDuels:
          map['aerialDuels'] != null ? map['aerialDuels'] as int : null,
      assists: map['assists'] != null ? map['assists'] as int : null,
      crosses: map['crosses'] != null ? map['crosses'] as int : null,
      defensiveActions: map['defensiveActions'] != null
          ? map['defensiveActions'] as int
          : null,
      defensiveDuels:
          map['defensiveDuels'] != null ? map['defensiveDuels'] as int : null,
      defensiveDuelsWon: map['defensiveDuelsWon'] != null
          ? map['defensiveDuelsWon'] as int
          : null,
      directRedCards:
          map['directRedCards'] != null ? map['directRedCards'] as int : null,
      dribbles: map['dribbles'] != null ? map['dribbles'] as int : null,
      duels: map['duels'] != null ? map['duels'] as int : null,
      duelsWon: map['duelsWon'] != null ? map['duelsWon'] as int : null,
      fouls: map['fouls'] != null ? map['fouls'] as int : null,
      foulsSuffered:
          map['foulsSuffered'] != null ? map['foulsSuffered'] as int : null,
      freeKicks: map['freeKicks'] != null ? map['freeKicks'] as int : null,
      freeKicksOnTarget: map['freeKicksOnTarget'] != null
          ? map['freeKicksOnTarget'] as int
          : null,
      gkExits: map['gkExits'] != null ? map['gkExits'] as int : null,
      gkSaves: map['gkSaves'] != null ? map['gkSaves'] as int : null,
      gkShotsAgainst:
          map['gkShotsAgainst'] != null ? map['gkShotsAgainst'] as int : null,
      gkSuccessfulExits: map['gkSuccessfulExits'] != null
          ? map['gkSuccessfulExits'] as int
          : null,
      goalKicks: map['goalKicks'] != null ? map['goalKicks'] as int : null,
      headShots: map['headShots'] != null ? map['headShots'] as int : null,
      interceptions:
          map['interceptions'] != null ? map['interceptions'] as int : null,
      keyPasses: map['keyPasses'] != null ? map['keyPasses'] as int : null,
      lateralPasses:
          map['lateralPasses'] != null ? map['lateralPasses'] as int : null,
      longPasses: map['longPasses'] != null ? map['longPasses'] as int : null,
      offensiveDuels:
          map['offensiveDuels'] != null ? map['offensiveDuels'] as int : null,
      offensiveDuelsWon: map['offensiveDuelsWon'] != null
          ? map['offensiveDuelsWon'] as int
          : null,
      passes: map['passes'] != null ? map['passes'] as int : null,
      passesToFinalThird: map['passesToFinalThird'] != null
          ? map['passesToFinalThird'] as int
          : null,
      penalties: map['penalties'] != null ? map['penalties'] as int : null,
      progressivePasses: map['progressivePasses'] != null
          ? map['progressivePasses'] as int
          : null,
      progressiveRun:
          map['progressiveRun'] != null ? map['progressiveRun'] as int : null,
      receivedPass:
          map['receivedPass'] != null ? map['receivedPass'] as int : null,
      secondAssists:
          map['secondAssists'] != null ? map['secondAssists'] as int : null,
      shots: map['shots'] != null ? map['shots'] as int : null,
      shotsBlocked:
          map['shotsBlocked'] != null ? map['shotsBlocked'] as int : null,
      shotsOnTarget:
          map['shotsOnTarget'] != null ? map['shotsOnTarget'] as int : null,
      successfulAttackingActions: map['successfulAttackingActions'] != null
          ? map['successfulAttackingActions'] as int
          : null,
      successfulBackPasses: map['successfulBackPasses'] != null
          ? map['successfulBackPasses'] as int
          : null,
      successfulCrosses: map['successfulCrosses'] != null
          ? map['successfulCrosses'] as int
          : null,
      successfulDefensiveAction: map['successfulDefensiveAction'] != null
          ? map['successfulDefensiveAction'] as int
          : null,
      successfulDribbles: map['successfulDribbles'] != null
          ? map['successfulDribbles'] as int
          : null,
      successfulForwardPasses: map['successfulForwardPasses'] != null
          ? map['successfulForwardPasses'] as int
          : null,
      successfulGoalKicks: map['successfulGoalKicks'] != null
          ? map['successfulGoalKicks'] as int
          : null,
      successfulKeyPasses: map['successfulKeyPasses'] != null
          ? map['successfulKeyPasses'] as int
          : null,
      successfulLateralPasses: map['successfulLateralPasses'] != null
          ? map['successfulLateralPasses'] as int
          : null,
      successfulLongPasses: map['successfulLongPasses'] != null
          ? map['successfulLongPasses'] as int
          : null,
      successfulPasses: map['successfulPasses'] != null
          ? map['successfulPasses'] as int
          : null,
      successfulPassesToFinalThird: map['successfulPassesToFinalThird'] != null
          ? map['successfulPassesToFinalThird'] as int
          : null,
      successfulPenalties: map['successfulPenalties'] != null
          ? map['successfulPenalties'] as int
          : null,
      successfulProgressivePasses: map['successfulProgressivePasses'] != null
          ? map['successfulProgressivePasses'] as int
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlayerAdvancedStat.fromJson(String source) =>
      PlayerAdvancedStat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant PlayerAdvancedStat other) {
    if (identical(this, other)) return true;

    return other.accelerations == accelerations &&
        other.aerialDuels == aerialDuels &&
        other.assists == assists &&
        other.crosses == crosses &&
        other.defensiveActions == defensiveActions &&
        other.defensiveDuels == defensiveDuels &&
        other.defensiveDuelsWon == defensiveDuelsWon &&
        other.directRedCards == directRedCards &&
        other.dribbles == dribbles &&
        other.duels == duels &&
        other.duelsWon == duelsWon &&
        other.fouls == fouls &&
        other.foulsSuffered == foulsSuffered &&
        other.freeKicks == freeKicks &&
        other.freeKicksOnTarget == freeKicksOnTarget &&
        other.gkExits == gkExits &&
        other.gkSaves == gkSaves &&
        other.gkShotsAgainst == gkShotsAgainst &&
        other.gkSuccessfulExits == gkSuccessfulExits &&
        other.goalKicks == goalKicks &&
        other.headShots == headShots &&
        other.interceptions == interceptions &&
        other.keyPasses == keyPasses &&
        other.lateralPasses == lateralPasses &&
        other.longPasses == longPasses &&
        other.offensiveDuels == offensiveDuels &&
        other.offensiveDuelsWon == offensiveDuelsWon &&
        other.passes == passes &&
        other.passesToFinalThird == passesToFinalThird &&
        other.penalties == penalties &&
        other.progressivePasses == progressivePasses &&
        other.progressiveRun == progressiveRun &&
        other.receivedPass == receivedPass &&
        other.secondAssists == secondAssists &&
        other.shots == shots &&
        other.shotsBlocked == shotsBlocked &&
        other.shotsOnTarget == shotsOnTarget &&
        other.successfulAttackingActions == successfulAttackingActions &&
        other.successfulBackPasses == successfulBackPasses &&
        other.successfulCrosses == successfulCrosses &&
        other.successfulDefensiveAction == successfulDefensiveAction &&
        other.successfulDribbles == successfulDribbles &&
        other.successfulForwardPasses == successfulForwardPasses &&
        other.successfulGoalKicks == successfulGoalKicks &&
        other.successfulKeyPasses == successfulKeyPasses &&
        other.successfulLateralPasses == successfulLateralPasses &&
        other.successfulLongPasses == successfulLongPasses &&
        other.successfulPasses == successfulPasses &&
        other.successfulPassesToFinalThird == successfulPassesToFinalThird &&
        other.successfulPenalties == successfulPenalties &&
        other.successfulProgressivePasses == successfulProgressivePasses;
  }

  @override
  int get hashCode {
    return accelerations.hashCode ^
        aerialDuels.hashCode ^
        assists.hashCode ^
        crosses.hashCode ^
        defensiveActions.hashCode ^
        defensiveDuels.hashCode ^
        defensiveDuelsWon.hashCode ^
        directRedCards.hashCode ^
        dribbles.hashCode ^
        duels.hashCode ^
        duelsWon.hashCode ^
        fouls.hashCode ^
        foulsSuffered.hashCode ^
        freeKicks.hashCode ^
        freeKicksOnTarget.hashCode ^
        gkExits.hashCode ^
        gkSaves.hashCode ^
        gkShotsAgainst.hashCode ^
        gkSuccessfulExits.hashCode ^
        goalKicks.hashCode ^
        headShots.hashCode ^
        interceptions.hashCode ^
        keyPasses.hashCode ^
        lateralPasses.hashCode ^
        longPasses.hashCode ^
        offensiveDuels.hashCode ^
        offensiveDuelsWon.hashCode ^
        passes.hashCode ^
        passesToFinalThird.hashCode ^
        penalties.hashCode ^
        progressivePasses.hashCode ^
        progressiveRun.hashCode ^
        receivedPass.hashCode ^
        secondAssists.hashCode ^
        shots.hashCode ^
        shotsBlocked.hashCode ^
        shotsOnTarget.hashCode ^
        successfulAttackingActions.hashCode ^
        successfulBackPasses.hashCode ^
        successfulCrosses.hashCode ^
        successfulDefensiveAction.hashCode ^
        successfulDribbles.hashCode ^
        successfulForwardPasses.hashCode ^
        successfulGoalKicks.hashCode ^
        successfulKeyPasses.hashCode ^
        successfulLateralPasses.hashCode ^
        successfulLongPasses.hashCode ^
        successfulPasses.hashCode ^
        successfulPassesToFinalThird.hashCode ^
        successfulPenalties.hashCode ^
        successfulProgressivePasses.hashCode;
  }

  @override
  String toString() {
    return 'PlayerAdvancedStat(accelerations: $accelerations, aerialDuels: $aerialDuels, assists: $assists, crosses: $crosses, defensiveActions: $defensiveActions, defensiveDuels: $defensiveDuels, defensiveDuelsWon: $defensiveDuelsWon, directRedCards: $directRedCards, dribbles: $dribbles, duels: $duels, duelsWon: $duelsWon, fouls: $fouls, foulsSuffered: $foulsSuffered, freeKicks: $freeKicks, freeKicksOnTarget: $freeKicksOnTarget, gkExits: $gkExits, gkSaves: $gkSaves, gkShotsAgainst: $gkShotsAgainst, gkSuccessfulExits: $gkSuccessfulExits, goalKicks: $goalKicks, headShots: $headShots, interceptions: $interceptions, keyPasses: $keyPasses, lateralPasses: $lateralPasses, longPasses: $longPasses, offensiveDuels: $offensiveDuels, offensiveDuelsWon: $offensiveDuelsWon, passes: $passes, passesToFinalThird: $passesToFinalThird, penalties: $penalties, progressivePasses: $progressivePasses, progressiveRun: $progressiveRun, receivedPass: $receivedPass, secondAssists: $secondAssists, shots: $shots, shotsBlocked: $shotsBlocked, shotsOnTarget: $shotsOnTarget, successfulAttackingActions: $successfulAttackingActions, successfulBackPasses: $successfulBackPasses, successfulCrosses: $successfulCrosses, successfulDefensiveAction: $successfulDefensiveAction, successfulDribbles: $successfulDribbles, successfulForwardPasses: $successfulForwardPasses, successfulGoalKicks: $successfulGoalKicks, successfulKeyPasses: $successfulKeyPasses, successfulLateralPasses: $successfulLateralPasses, successfulLongPasses: $successfulLongPasses, successfulPasses: $successfulPasses, successfulPassesToFinalThird: $successfulPassesToFinalThird, successfulPenalties: $successfulPenalties, successfulProgressivePasses: $successfulProgressivePasses)';
  }
}
