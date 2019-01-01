import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_flutter/data/URL.dart';
import 'package:news_app_flutter/data/api/models/Resource.dart';
import 'package:news_app_flutter/data/settings/SettingRepository.dart';
import 'package:news_app_flutter/data/settings/User.dart';
import 'package:news_app_flutter/event/Eventbus.dart';
import 'package:news_app_flutter/event/events.dart';

class AuthRemoteService {
  SettingRepository settingRepository;

  AuthRemoteService(this.settingRepository);

  factory AuthRemoteService.create() {
    return AuthRemoteService(SettingRepository.create());
  }

  Future<Resource<dynamic>> login(String email,
      String password,) async {
    var url = URL.login;
//    var url = 'http://requestbin.fullcontact.com/165xw8t1';
    var body = {
      'email': email,
      'password': password,
    };
    url = URL.addQuery(url, body);
    var client = http.Client();
    var request = new http.Request('POST', Uri.parse(url));
    //  request.headers['Content-Type'] = 'application/json; charset=utf-8';
    request.headers['Accept'] = 'application/json; charset=utf-8';
    request.headers['email'] = email;
    request.headers['password'] = password;

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

  Future<Resource<dynamic>> changePassword(String newPass,
      String oldPass,) async {
    var url = URL.changePass;
    var body = {
      'new_password': newPass,
      'old_password': oldPass,
      'api_token': await settingRepository.getApiToken(),
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
      String userMessage = jsonBody['user_message'];
      settingRepository.saveApiToken('');
      EventBusProvider.defaultInstance().fire(AuthErrorEvent());
      var value = Resource.success(userMessage);
      value.message = userMessage;
      return value;
    } else if (response.statusCode == 401) {
      EventBusProvider.defaultInstance().fire(AuthErrorEvent());
    } else {
      var jsonBody = json.decode(responseBody);
      String msg = jsonBody['user_message'];
      print('Response msg: $msg');
      return Resource.error(null, msg);
    }
  }
}
