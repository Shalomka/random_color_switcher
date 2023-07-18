// unit test for providers
// Path: test/unit_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:random_color_switcher/src/features/home/providers/color_seed_notifier.dart';
import 'package:random_color_switcher/src/features/home/providers/random_brightness_provider.dart';

// test providers
void main() {
  group('Color and brightness providers', () {
    test('colorSeedProvider returns different color each time', () {
      // create a provider container
      final container = ProviderContainer();

      // read the provider
      final color = container.read(colorSeedProvider);

      // expect value to be color
      expect(color, isA<Color>());

      // expect value to be in Colors.primaries
      expect(Colors.primaries.contains(color), true);

      // refrest the provider
      container.read(colorSeedProvider.notifier).refresh();

      // read the provider again
      final newColor = container.read(colorSeedProvider);

      // expect new value to be color
      expect(newColor, isA<Color>());

      // expect new value to be in Colors.primaries
      expect(Colors.primaries.contains(newColor), true);

      // expect new value to be different from the previous one
      expect(newColor != color, true);
    });

    test('randomBrightnessProvider returns Brightness', () {
      // create a provider container
      final container = ProviderContainer();

      // read the provider
      final brightness = container.read(randomBrightnessProvider);

      // brightness should be Brightness
      expect(brightness, isA<Brightness>());

      // brightness should be Brightness.dark or Brightness.light
      expect(
        brightness == Brightness.dark || brightness == Brightness.light,
        true,
      );
    });
  });
}
