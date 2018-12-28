import 'service.dart';
import 'dart:async';
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
      '1234',
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
}
