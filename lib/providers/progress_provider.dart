import 'package:hooks_riverpod/hooks_riverpod.dart';

final progressDSFProApiProvider = StateProvider<Progress?>((ref) => null);
final progressWyScoutApiProvider = StateProvider<Progress?>((ref) => null);

class Progress {
  final int total;
  final int amount;
  const Progress({
    required this.total,
    required this.amount,
  });

  String get percentage => '${((amount / total) * 100).toStringAsFixed(2)}%';
}
