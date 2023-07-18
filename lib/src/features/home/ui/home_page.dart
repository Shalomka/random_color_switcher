import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:random_color_switcher/src/features/home/providers/color_seed_notifier.dart';
import 'package:random_color_switcher/src/features/home/ui/componenets/animated_blinker.dart';

/// home page of the app
class HomePage extends ConsumerWidget {
  /// default constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // background color for this screen
    final surfaceColor = Theme.of(context).colorScheme.primary;

    // contrasting text color for this screen, that
    //  would be readable on the background color
    final inverseSurfaceColor = Theme.of(context).colorScheme.onPrimary;

    return GestureDetector(
      // tapping enywhere on the screen will change
      // the theme of the app to the a new color scheme
      behavior: HitTestBehavior.opaque,
      onTap: () {
        ref.read(colorSeedProvider.notifier).refresh();
      },
      child: Scaffold(
        body: Center(
          child: AnimatedBlinker(
            // semantics for visually impaired users
            // and screen readers
            child: Semantics(
              // key is important for animated blinker
              key: ValueKey(surfaceColor),
              label: 'Tap anywhere for a new color',
              child: Container(
                // key for testing
                key: const ValueKey<String>('color container'),
                height: double.infinity,
                width: double.infinity,
                color: surfaceColor,
                child: Center(
                  child: Text(
                    'Hello there',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: inverseSurfaceColor,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
