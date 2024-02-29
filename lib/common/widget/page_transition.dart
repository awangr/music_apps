import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class PageTransition extends StatelessWidget {
  const PageTransition({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      transitionBuilder: (child, animation, secondaryAnimation) {
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
      child: child,
    );
  }
}
