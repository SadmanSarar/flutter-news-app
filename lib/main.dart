import 'package:flutter/material.dart';
import 'view/home.dart';
import 'view/splashscreen.dart';
import 'package:flutter_stetho/flutter_stetho.dart';

void main() {
  Stetho.initialize();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.red,
        backgroundColor: Colors.amber,
      ),
      // home: HomePage(title: 'Flutter Demo Home Page'),
      home: SplashScreen(),
      showPerformanceOverlay: false,
    );
  }
}
