import 'package:freezed_annotation/freezed_annotation.dart';

enum BodyPart {
  @JsonValue('Unknown')
  unknown,
  @JsonValue('Head')
  head,
  @JsonValue('RightFoot')
  rightFoot,
  @JsonValue('LeftFoot')
  leftFoot,
  @JsonValue('Both')
  both,
}

extension BodyPartExt on BodyPart {
  static BodyPart? fromString(String code) {
    switch (code) {
      case 'Head':
        return BodyPart.head;
      case 'RightFoot':
        return BodyPart.rightFoot;
      case 'LeftFoot':
        return BodyPart.leftFoot;
      default:
        return null;
    }
  }

  static String fromCode(BodyPart? part) {
    switch (part) {
      case BodyPart.head:
        return 'Head';
      case BodyPart.rightFoot:
        return 'Right';
      case BodyPart.leftFoot:
        return 'Left';
      // ignore: no_default_cases
      default:
        return '';
    }
  }

  String get code {
    switch (this) {
      case BodyPart.head:
        return 'Head';
      case BodyPart.rightFoot:
        return 'RightFoot';
      case BodyPart.leftFoot:
        return 'LeftFoot';
      // ignore: no_default_cases
      default:
        return '';
    }
  }
}
