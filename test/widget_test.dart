/* // This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:slideshow_v/main.dart';

void main() {
  testWidgets('Renderation slides', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SlideShow(
      slides: [
        Text('slide 1'),
        Text('slide 2'),
        Text('slide 3'),
        Text('slide 4'),
        Text('slide 5'),
      ],
    ));

    // Verify that our counter starts at 0.
    expect(find.byType(Column), findsOneWidget);
  });
}
 */