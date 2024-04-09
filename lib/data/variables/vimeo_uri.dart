class VimeoUri {
  const VimeoUri(this.uri);
  final Uri uri;

  String? get id =>
      RegExp(r'^https://vimeo.com/(\d+)/.+$').firstMatch(uri.toString())?[1];
}
