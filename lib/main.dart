import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:news_app_flutter/App.dart';

void main() {
  Stetho.initialize();
  runApp(App());
}
