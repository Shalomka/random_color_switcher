// Test: widget_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:random_color_switcher/app.dart';
import 'package:random_color_switcher/src/features/home/ui/home_page.dart';

void main() {
  group('Homepage', () {
    testWidgets(
      'App widget loading HomePage',
      (WidgetTester tester) async {
        // Build our app with the providerScope and trigger a frame.
        await tester.pumpWidget(const ProviderScope(child: App()));

        // Verify if the HomePage is present.
        expect(find.byType(HomePage), findsOneWidget);

        // Verify if Hello World is present.
        expect(find.text('Hello there'), findsOneWidget);

        // Verify if the HomePage is present.
        await tester.tap(find.byType(HomePage));
      },
    );

    testWidgets(
      'Tapping anywhere on the homepage changes color',
      (tester) async {
        // Build our app with the providerScope and trigger a frame.
        await tester.pumpWidget(const ProviderScope(child: App()));

        // find the color of the container widget by key

        const containerKey = ValueKey('color container');

        final color = tester
            .widget<Container>(
              find.byKey(containerKey),
            )
            .color;
        expect(color, isA<Color>());

        // tap at the center of the screen
        await tester.tapAt(const Offset(100, 100));

        // wait for the app to rebuild
        await tester.pumpAndSettle();

        // ignore: lines_longer_than_80_chars
        final newColor = tester.widget<Container>(find.byKey(containerKey)).color;
        expect(newColor, isA<Color>());

        // check if the new color is different from the old color
        expect(color, isNot(newColor));
      },
    );
  });
}
