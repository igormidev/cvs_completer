// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';

final twoCvsDataProvider = StateProvider<TwoCvsData?>((ref) => null);

class TwoCvsData {
  final List<List<dynamic>>? file1;
  final List<List<dynamic>>? file2;
  const TwoCvsData({
    this.file1,
    this.file2,
  });
}
