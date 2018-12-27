class URL {
  static String baseUrl = "http://news-app.sadmansarar.xyz";
  static String category = baseUrl + '/api/category';

  static String addQuery(String url, Map<String, String> query) {
    url = url + '?';
    query.forEach((String key, String value) {
      url = url + '$key=$value&';
    });
    return url;
  }

  static String imageUrl(String imgUrl) {
    return 'http://news-app.sadmansarar.xyz/storage/' + imgUrl;
  }
}
