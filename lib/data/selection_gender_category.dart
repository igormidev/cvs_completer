import 'package:freezed_annotation/freezed_annotation.dart';

enum SelectionGenderCategory {
  @JsonValue('Unspecified')
  unspecified,
  @JsonValue('Man')
  man,
  @JsonValue('Woman')
  woman,
}

extension SelectionGenderCategoryExt on SelectionGenderCategory {
  String get code {
    switch (this) {
      case SelectionGenderCategory.man:
        return 'Man';
      case SelectionGenderCategory.woman:
        return 'Woman';
      case SelectionGenderCategory.unspecified:
        return 'Unspecified';
    }
  }

  static SelectionGenderCategory? fromString(String code) {
    switch (code) {
      case 'Man':
        return SelectionGenderCategory.man;
      case 'Woman':
        return SelectionGenderCategory.woman;
      case 'Unspecified':
        return SelectionGenderCategory.unspecified;
      default:
        return null;
    }
  }
}
