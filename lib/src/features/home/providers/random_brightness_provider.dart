import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_color_switcher/src/features/home/providers/color_seed_notifier.dart';

///
/// provider for random brightness (lite or dark)
/// of the theme
///

final randomBrightnessProvider = StateProvider<Brightness>(
  (ref) {
    // watches for seed color changes and
    // generates a random brightness each time
    ref.watch(colorSeedProvider);

    return Brightness.values[Random().nextInt(Brightness.values.length)];
  },
);
