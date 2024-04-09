import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

enum AgeGroup {
  @JsonValue('U13')
  u13,
  @JsonValue('U15')
  u15,
  @JsonValue('U17')
  u17,
  @JsonValue('U20')
  u20,
  @JsonValue('OVER20')
  over20;

  static AgeGroup fromDateOfBirth(DateTime date) {
    // DSではその年に迎える年齢で年齢カテゴリを計算するため、誕生日を12/31に固定する
    final age = date.toAge();
    if (age <= 13) {
      return AgeGroup.u13;
    } else if (age <= 15) {
      return AgeGroup.u15;
    } else if (age <= 17) {
      return AgeGroup.u17;
    } else if (age <= 20) {
      return AgeGroup.u20;
    } else {
      return AgeGroup.over20;
    }
  }
}

extension AgeGroupExt on AgeGroup {
  String get code {
    switch (this) {
      case AgeGroup.u13:
        return 'U13';
      case AgeGroup.u15:
        return 'U15';
      case AgeGroup.u17:
        return 'U17';
      case AgeGroup.u20:
        return 'U20';
      case AgeGroup.over20:
        return 'OVER20';
    }
  }

  static AgeGroup? fromString(String code) {
    switch (code) {
      case 'U13':
        return AgeGroup.u13;
      case 'U15':
        return AgeGroup.u15;
      case 'U17':
        return AgeGroup.u17;
      case 'U20':
        return AgeGroup.u20;
      case 'OVER20':
        return AgeGroup.over20;
      default:
        return null;
    }
  }
}

extension DateTimeExt on DateTime {
  String toDsfIso8601() {
    final format = DateFormat("yyyy-MM-dd'T'HH:mm:ss+SSS0");
    return format.format(this);
  }

  int getAge() {
    int date(DateTime x) {
      final y = x.year.toString().padLeft(4, '0');
      final m = x.month.toString().padLeft(2, '0');
      final d = x.day.toString().padLeft(2, '0');
      return int.tryParse('$y$m$d') ?? 0;
    }

    return ((date(DateTime.now()) - date(this)) / 10000).floor();
  }

  int toAge() {
    int format(DateTime x) {
      final y = x.year.toString().padLeft(4, '0');
      return int.tryParse('${y}1231') ?? 0;
    }

    final age = ((format(DateTime.now()) - format(this)) / 10000).floor();

    return age;
  }
}
