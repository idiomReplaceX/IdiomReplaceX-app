class Util {

  static var regexHostNameWithPath = RegExp(r'(?=^.{4,253}$)(^((?!-)[a-zA-Z0-9-]{0,62}[a-zA-Z0-9]\.)+[a-zA-Z]{2,63}).*');

  static bool urlIsSecure(Uri url) {
    return (url.scheme == "https") || Util.isLocalizedContent(url);
  }

  static bool isLocalizedContent(Uri url) {
    return (url.scheme == "file" ||
        url.scheme == "chrome" ||
        url.scheme == "data" ||
        url.scheme == "javascript" ||
        url.scheme == "about");
  }

  static bool startsWithHttpScheme(String value) {
    return value.startsWith("http://") || value.startsWith("https://");
  }

  static bool looksLikeHostNameWithPath(String value) {
    return regexHostNameWithPath.hasMatch(value);
  }

  static String hostNameWithPath2Url(String value) {
    if (!startsWithHttpScheme(value) && Util.looksLikeHostNameWithPath(value)) {
      return 'https://' + value;
    } else {
      return value;
    }
  }


}