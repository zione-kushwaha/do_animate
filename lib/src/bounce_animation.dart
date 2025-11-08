import 'package:flutter/material.dart';

/// A widget that creates a bouncing jump effect.
///
/// The child widget will continuously bounce up and down.
///
/// Example:
/// ```dart
/// BounceAnimation(
///   duration: Duration(milliseconds: 1000),
///   offset: 20.0,
///   child: Icon(Icons.star),
/// )
/// ```
class BounceAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double offset;

  const BounceAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1000),
    this.offset = 20.0,
  });

  @override
  State<BounceAnimation> createState() => _BounceAnimationState();
}

class _BounceAnimationState extends State<BounceAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this)
      ..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.0,
      end: -widget.offset,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
