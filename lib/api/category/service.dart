import 'model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../url.dart';

class CategoryRemoteService {
  Future<List<Category>> fetchCategory(String apiToken) async {
    var url = URL.addQuery(URL.category, {
      'api_token': apiToken,
    });
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      return Category.listFromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
