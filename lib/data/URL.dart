class URL {
  static String baseUrl = "http://news-app.sadmansarar.xyz";
  // static String baseUrl = "http://192.168.1.116:8000";
  static String category = baseUrl + '/api/category';
  static String news = baseUrl + '/api/news';
  static String settings = baseUrl + '/api/settings';
  static String login = baseUrl + '/api/auth/login';
  static String changePass = baseUrl + '/api/change_password';

  static String addQuery(String url, Map<String, String> query) {
    url = url + '?';
    query.forEach((String key, String value) {
      url = url + '$key=$value&';
    });
    return url;
  }

  static String imageUrl(String imgUrl) {
    if(imgUrl == null || imgUrl.isEmpty){
      return 'https://images.unsplash.com/photo-1504711434969-e33886168f5c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80';
    }
    return 'http://news-app.sadmansarar.xyz/storage/' + imgUrl;
  }
}
