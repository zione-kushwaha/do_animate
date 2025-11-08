import 'package:flutter/material.dart';

/// A widget that creates a continuous rotation effect.
///
/// The child widget will rotate continuously either clockwise or counter-clockwise.
///
/// Example:
/// ```dart
/// RotateAnimation(
///   duration: Duration(seconds: 3),
///   clockwise: true,
///   child: Icon(Icons.refresh),
/// )
/// ```
class RotateAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final bool clockwise;

  const RotateAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 3),
    this.clockwise = true,
  });

  @override
  State<RotateAnimation> createState() => _RotateAnimationState();
}

class _RotateAnimationState extends State<RotateAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: widget.clockwise
          ? _controller
          : Tween<double>(begin: 1.0, end: 0.0).animate(_controller),
      child: widget.child,
    );
  }
}
