extension StringExt on String {
  List<String> lines() => split(RegExp(r'\n'));

  String withoutLineBreaks() =>
      lines().where((e) => e.trim().isNotEmpty).join(' ');

  String get capitalized =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.capitalized)
      .join(' ');

  bool get isValidComment => [
        // email address
        RegExp(
            // ignore: require_trailing_commas
            r"[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
        // phone number
        RegExp(r'\+\d{2}\s?(\(\d{2,}\))?[-\s\.0-9]{4,}'),
        RegExp(r'\d{3,}[-\s\.\d]{8,}'),
        // url (https://docs.microsoft.com/en-us/previous-versions/msp-n-p/ff650303(v=pandp.10))
        RegExp(
          r"(ht|f)tp(s?)\:\/\/[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*(:(0-9)*)*(\/?)([a-zA-Z0-9\-\.\?\,\'\/\\\+&amp;%\$#_]*)?",
        ),
      ].every((reg) => !reg.hasMatch(this));

  bool get isValidPostDescription => isValidComment;

  bool get isValidBiography => isValidComment;

  // check whether this has a markdown link
  bool get isMarkdownFormat => RegExp(r'\[(.*)\]\(([^ ]*)\)').hasMatch(this);

  // String pattern in Markdown where the link part start with "/"
  RegExp get markdownWithDsfLink => RegExp(r'\[(.+)\]\((\/[^ ]*)\)');

  bool get isValidDsfMarkdown => markdownWithDsfLink.hasMatch(this);
  String get onlyDigits => replaceAll(RegExp(r'[^0-9]+'), '');
  String get onlyCaracters => replaceAll(RegExp(r'[^a-zA-Z]+'), '');
  String get onlyCaractersAndNumbers =>
      replaceAll(RegExp(r'[^0-9a-zA-Z]+'), '');

  bool get isValidEmailAddress => RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      ).hasMatch(this);

  String get replaceToATag => replaceAllMapped(
        markdownWithDsfLink,
        (Match m) => '<a href="${m[2]}">${m[1]}</a>',
      );

  bool get isValidNumberPositive => isNotEmpty && (int.tryParse(this) ?? 0) < 1;

  int get toBuildNumber {
    final parts = split('.');
    if (parts.length != 3) {
      throw const FormatException('Invalid version format');
    }

    final major = int.parse(parts[0]);
    final minor = int.parse(parts[1]);
    final patch = int.parse(parts[2]);

    final result = (major * 10000000) + (minor * 10000) + patch;
    return result;
  }

  String get trimName {
    // Replace whitespace characters (' ', '\n', '\u{A0}', etc.) with ' '.
    // Remove leading and trailing blank characters
    return replaceAll(RegExp(r'\s+'), ' ').trim();
  }
}
