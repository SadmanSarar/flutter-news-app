import 'dart:convert';

import 'package:http/http.dart' as http;

import '../settings/SettingRepository.dart';
import '../settings/User.dart';
import '../URL.dart';
import '../api/models/Resource.dart';


class AuthRemoteService {
  SettingRepository settingRepository;

  AuthRemoteService(this.settingRepository);

  factory AuthRemoteService.create() {
    return AuthRemoteService(SettingRepository.create());
  }

  Future<Resource<dynamic>> login(
    String email,
    String password,
  ) async {
    var url = URL.login;
    // var url = 'http://requestbin.fullcontact.com/1fzhku61';
    var body = {
      'email': email,
      'password': password,
    };
    var client = http.Client();
    var request = new http.Request('POST', Uri.parse(url));
    //  request.headers['Content-Type'] = 'application/json; charset=utf-8';
    request.headers['Accept'] = 'application/json; charset=utf-8';
    request.bodyFields = body;
    var response = await client.send(request);
    var responseBody = await response.stream.bytesToString();
    print('Response: $responseBody');
    if (response.statusCode == 200) {
      var jsonBody = json.decode(responseBody);
      String apiToken = jsonBody['access_token'];
      print(apiToken);
      try {
        User user = User(
          jsonBody['user']['name'],
          jsonBody['user']['email'],
          jsonBody['user']['image'],
          );
        settingRepository.saveApiToken(apiToken);
        settingRepository.saveUser(user);
      } catch (ex, stack) {
        print(ex);
        print(stack);
      }
      return Resource.success(apiToken);
    } else {
      var jsonBody = json.decode(responseBody);
      String msg = jsonBody['user_message'];
      print('Response msg: $msg');
      return Resource.error(null, msg);
    }
  }
}
