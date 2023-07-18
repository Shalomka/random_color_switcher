import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_color_switcher/src/features/home/providers/color_seed_notifier.dart';
import 'package:random_color_switcher/src/features/home/providers/random_brightness_provider.dart';
import 'package:random_color_switcher/src/features/home/ui/home_page.dart';

/// main entrance of the app
class App extends ConsumerWidget {
  /// default constructor
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // random color seed for material 3 color scheme
    final colorSeed = ref.watch(colorSeedProvider);

    // random brightness of the theme
    final randomBrightness = ref.watch(randomBrightnessProvider);

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorSeed,
        brightness: randomBrightness,
      ),
      home: const HomePage(),
    );
  }
}
