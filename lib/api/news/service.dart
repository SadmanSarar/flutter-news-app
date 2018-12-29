import 'model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../url.dart';

class NewsRemoteService {
  Future<List<News>> fetchNews(
    String apiToken,
    String type,
    String categoryId,
  ) async {
    var url = URL.addQuery(URL.news, {
      'api_token': apiToken,
      'type': type,
      'category_id': categoryId,
    });
    final response = await http.get(
      url,
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      print(response.body);
      return News.listFromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
