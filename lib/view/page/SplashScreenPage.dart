import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app_flutter/data/settings/SettingRepository.dart';
import 'package:news_app_flutter/view/page/HomePage.dart';
import 'package:news_app_flutter/view/page/LoginPage.dart';

class SplashScreenPage extends StatelessWidget {
  final settingRepository = SettingRepository.create();

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      _gotoNextScreen(context);
    });

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.crop,
                color: Colors.white,
                size: 120,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'News App',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox.fromSize(
                  size: Size(40, 40),
                  child: CircularProgressIndicator(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _gotoNextScreen(BuildContext context) async {
    var apiToken = await settingRepository.getApiToken();

    Widget destination =
        (apiToken == null || apiToken.isEmpty) ? LoginPage() : HomePage();

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => destination,
        ));
  }
}
