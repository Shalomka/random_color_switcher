import 'package:flutter/material.dart';

/// animated switcher with blinking effect
class AnimatedBlinker extends StatelessWidget {
  /// child widget to be animated
  final Widget? child;

  /// default constructor
  const AnimatedBlinker({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 240),
      switchInCurve: Curves.bounceIn,
      switchOutCurve: Curves.easeOut,
      transitionBuilder: (child, animation) {
        // fade and size transition
        // to dramatize color change
        // with blinking effect
        return FadeTransition(
          opacity: animation,
          child: SizeTransition(
            sizeFactor: animation,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
