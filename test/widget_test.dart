// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipfsnets/include.dart';


Map<String, dynamic> parseData(String data) {
  return json.decode(data) as Map<String, dynamic>;
}

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    LogUtil.e("11111");
    // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);
    //
    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();
    //
    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);


    String data = "{code: 200, msg: suc, data: {access_token: 09ee18ff-0ba7-4682-96dc-8446c639cef9, expires_in: 604800}}";
    final Map<String, dynamic> _map = parseData(data);
    prints(""+_map.length.toString());
    LogUtil.e("11111"+_map.length.toString());
  });

}
