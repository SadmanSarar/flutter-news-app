// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:news_app_flutter/App.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());
  });

  test('Normal Test', () {
    var a = 1 +2;
    var b = 3;
    expect(b, a);
  });

  test('Normal Test', () {
    var a = 2 * 2;
    var b = 4;
    expect(b, a);
  });
}
