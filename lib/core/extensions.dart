extension ListStringExtension on List<String> {
  List<String> removeNullOrEmpty() {
    return where(
      (element) => element.replaceAll(' ', '').isNotEmpty,
    ).whereType<String>().toList();
  }

  List<String>? returnNullIfEmpty() {
    return isEmpty ? null : this;
  }
}
