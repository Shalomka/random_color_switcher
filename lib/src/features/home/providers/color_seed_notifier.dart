import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// provider for color seed for material 3 color scheme
///

final colorSeedProvider = NotifierProvider<ColorSeedNotifier, Color>(
  ColorSeedNotifier.new,
);

///
/// notifier for color seed
///

class ColorSeedNotifier extends Notifier<Color> {
  /// default constructor generates a random primary color
  /// and sets it as the initial state
  @override
  Color build() {
    return _generateRandomColor();
  }

  /// generate a random primary color
  Color _generateRandomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  /// generates new color, makes sure it is
  /// not the same as the current one and
  /// refreshes the color in state.
  /// Uses recursion to make sure the new
  /// color is not the same as the current one.
  void refresh() {
    final newColor = _generateRandomColor();
    if (newColor != state) {
      state = newColor;
    } else {
      refresh();
    }
  }
}
