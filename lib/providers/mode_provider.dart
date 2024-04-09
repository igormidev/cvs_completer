import 'package:flutter_riverpod/flutter_riverpod.dart';

enum GeneratorMode {
  getWysoutId,
  completeAditionalData;
}

final generatorModeStateProvider =
    StateProvider((ref) => GeneratorMode.completeAditionalData);
