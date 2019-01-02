import 'dart:async';

import 'package:news_app_flutter/data/settings/SettingRemoteService.dart';
import 'package:news_app_flutter/data/settings/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingRepository {
  SettingRemoteService remoteService;
  Future<SharedPreferences> prefs;

  SettingRepository(this.remoteService, this.prefs);

  factory SettingRepository.create() {
    return SettingRepository(
        SettingRemoteService(), SharedPreferences.getInstance());
  }

  Future<Null> fetchAndGet() async {
    var future = remoteService.fetchSettings(
      await getApiToken(),
    );
    Map<String, String> data = await future;

    var privacyPolicy = data['privacyPolicy'];
    var pref = await prefs;
    pref.setString('privacyPolicy', privacyPolicy);
  }

  Future<String> getPrivacyPolicy() async {
    var pref = await prefs;
    return pref.getString('privacyPolicy');
  }

  Future<String> getApiToken() async {
    var pref = await prefs;
    return pref.getString('apiToken');
  }

  Future<bool> saveApiToken(String apiToken) async {
    var pref = await prefs;
    return pref.setString('apiToken', apiToken);
  }

  Future<User> getUser() async {
    var pref = await prefs;
    return User(
      pref.getString('user.name'),
      pref.getString('user.email'),
      pref.getString('user.image'),
    );
  }

  Future<bool> saveUser(User user) async {
    var pref = await prefs;
    pref.setString('user.name', user.name);
    pref.setString('user.email', user.email);
    return pref.setString('user.image', user.image);
  }
}
