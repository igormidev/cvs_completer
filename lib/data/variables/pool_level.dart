import 'package:dsf_ms_proto/proto/dreamstock/dsf_ms_scout/v3/player_level.pb.dart'
    as pb;

enum Level {
  a,
  b,
  c,
  d,
  e,
  notEvaluated;

  static Level fromCVSText(String? text) {
    switch (text) {
      case 'A':
        return Level.a;
      case 'B':
        return Level.a;
      case 'C':
        return Level.a;
      case 'D':
        return Level.b;
      case 'E':
        return Level.c;
      default:
        return Level.notEvaluated;
    }
  }

  String getName() {
    switch (this) {
      case Level.a:
        return 'Level A';
      case Level.b:
        return 'Level B';
      case Level.c:
        return 'Level C';
      case Level.d:
        return 'Level D';
      case Level.e:
        return 'Level E';
      case Level.notEvaluated:
        return 'Undefinied';
    }
  }

  String get show {
    switch (this) {
      case Level.notEvaluated:
        return '?';
      case Level.a:
      case Level.b:
      case Level.c:
      case Level.d:
      case Level.e:
        return name.toUpperCase();
    }
  }

  int get colorCode {
    switch (this) {
      case Level.notEvaluated:
        return 0xFFD4D4D4;
      case Level.a:
        return 0xFF1AB43C;
      case Level.b:
        return 0xFF2B73FF;
      case Level.c:
        return 0xFF8412DE;
      case Level.d:
        return 0xFFFF4A01;
      case Level.e:
        return 0xFFFFBD00;
    }
  }

  factory Level.fromPb(pb.PlayerLevel l) {
    switch (l) {
      case pb.PlayerLevel.PLAYER_LEVEL_POOL_A:
        return Level.a;
      case pb.PlayerLevel.PLAYER_LEVEL_POOL_B:
        return Level.b;
      case pb.PlayerLevel.PLAYER_LEVEL_POOL_C:
        return Level.c;
      case pb.PlayerLevel.PLAYER_LEVEL_POOL_D:
        return Level.d;
      case pb.PlayerLevel.PLAYER_LEVEL_POOL_E:
        return Level.e;
      case pb.PlayerLevel.PLAYER_LEVEL_PENDING:
        return Level.notEvaluated;
      case pb.PlayerLevel.PLAYER_LEVEL_UNSPECIFIED:
        return Level.notEvaluated;
      // ignore: no_default_cases
      default:
        throw ArgumentError('unknown level');
    }
  }
}
