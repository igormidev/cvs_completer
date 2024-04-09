class YoutubeUri {
  const YoutubeUri(this.uri);
  final Uri uri;

  String? get id =>
      uri.queryParameters.containsKey('v') ? uri.queryParameters['v'] : null;
}
