import 'model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../url.dart';

class NewsRemoteService {
  Future<List<News>> fetchNews(String apiToken) async {
    var url = URL.addQuery(URL.news, {
      'api_token': apiToken,
    });
    print(url);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      return News.listFromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
