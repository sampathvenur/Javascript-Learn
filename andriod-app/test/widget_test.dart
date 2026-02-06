// Basic Flutter widget test for JS Notes app

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:js_notes/main.dart';

void main() {
  testWidgets('App loads and shows home screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const JSNotesApp());

    // Verify that the app title appears
    expect(find.text('JavaScript'), findsWidgets);
  });
}
