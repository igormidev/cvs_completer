import 'package:flutter_riverpod/flutter_riverpod.dart';

enum GeneratorMode {
  completeAditionalData,
  getWysoutId,
  joinTwoCVS;
}

final generatorModeStateProvider =
    StateProvider((ref) => GeneratorMode.getWysoutId);
