import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_flutter/data/URL.dart';
import 'package:news_app_flutter/event/Eventbus.dart';
import 'package:news_app_flutter/event/events.dart';

class SettingRemoteService {
  final _eventBust = EventBusProvider.defaultInstance();

  Future<Map<String, String>> fetchSettings(
    String apiToken,
  ) async {
    var url = URL.addQuery(URL.settings, {
      'api_token': apiToken,
    });
    final response = await http.get(url,headers: {
      'Accept' : 'application/json'
    });

    if (response.statusCode == 200) {
      print(response.body);
      var jsonBody = json.decode(response.body);
      String privacyPolicy = jsonBody['privacy_policy'];
      return {'privacyPolicy': privacyPolicy};
    } else if (response.statusCode == 401) {
      _eventBust.fire(AuthErrorEvent());
      throw Exception('Auth Error');
    } else {
      throw Exception('Failed to load post');
    }
  }
}
