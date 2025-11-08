import 'package:flutter/material.dart';

/// A widget that creates a blinking/pulsing opacity effect.
///
/// The child widget will fade in and out continuously.
///
/// Example:
/// ```dart
/// BlinkingAnimation(
///   duration: Duration(seconds: 2),
///   child: Text('Blinking Text'),
/// )
/// ```
class BlinkingAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;

  const BlinkingAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 2),
    this.curve = Curves.easeInOut,
  });

  @override
  State<BlinkingAnimation> createState() => _BlinkingAnimationState();
}

class _BlinkingAnimationState extends State<BlinkingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this)
      ..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _animation, child: widget.child);
  }
}
