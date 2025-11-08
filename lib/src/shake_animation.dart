import 'dart:math';
import 'package:flutter/material.dart';

/// A widget that creates a shake effect.
///
/// Useful for error states or to draw attention to an element.
///
/// Example:
/// ```dart
/// ShakeAnimation(
///   duration: Duration(milliseconds: 500),
///   offset: 10.0,
///   child: TextField(
///     decoration: InputDecoration(errorText: 'Invalid input'),
///   ),
/// )
/// ```
class ShakeAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double offset;
  final int shakes;

  const ShakeAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.offset = 10.0,
    this.shakes = 3,
  });

  @override
  State<ShakeAnimation> createState() => _ShakeAnimationState();
}

class _ShakeAnimationState extends State<ShakeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this)
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final sineValue = sin(widget.shakes * 2 * pi * _controller.value);
        final offset = widget.offset * sineValue * (1 - _controller.value);
        return Transform.translate(
          offset: Offset(offset, 0),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
