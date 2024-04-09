import 'package:intl/intl.dart';

class DateOfBirth {
  const DateOfBirth(this.datetime);
  final DateTime datetime;

  int age() {
    final a = int.parse(DateFormat('yyyyMMdd').format(DateTime.now()));
    final b = int.parse(DateFormat('yyyyMMdd').format(datetime));
    return ((a - b) / 10000).floor();
  }
}
