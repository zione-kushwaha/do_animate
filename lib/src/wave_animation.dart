import 'package:flutter/material.dart';

/// A widget that creates a wave/floating effect.
///
/// The child widget will move up and down in a smooth wave motion.
/// Great for decorative elements or attention-grabbing UI.
///
/// Example:
/// ```dart
/// WaveAnimation(
///   duration: Duration(seconds: 2),
///   amplitude: 10.0,
///   child: Icon(Icons.water_drop),
/// )
/// ```
class WaveAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double amplitude;

  const WaveAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 2),
    this.amplitude = 10.0,
  });

  @override
  State<WaveAnimation> createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation>
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            0,
            widget.amplitude * (0.5 - (_controller.value - 0.5).abs()),
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
