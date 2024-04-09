import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension Nullable<T> on T {
  /// This applies the given function when the value is not null.
  R let<R>(R Function(T it) fn) => fn(this);
}

extension StringNullExt on String? {
  String? formatWhiteSpaceOrEmptyStringToNull() {
    if (this == null || this!.trim().isEmpty) {
      return null;
    }
    return this;
  }
}

extension DateTimeExt on DateTime {
  String format(BuildContext context, {bool isLocal = false}) {
    final locale = Localizations.localeOf(context);
    return DateFormat.yMMMMd(locale.languageCode)
        .format(isLocal ? toLocal() : this);
  }
}
