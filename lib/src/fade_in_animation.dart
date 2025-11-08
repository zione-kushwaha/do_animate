import 'package:flutter/material.dart';

/// A widget that creates a simple fade-in effect.
///
/// The child widget will gradually appear from transparent to opaque.
///
/// Example:
/// ```dart
/// FadeInAnimation(
///   duration: Duration(milliseconds: 600),
///   delay: Duration(milliseconds: 200),
///   child: Text('Fading in'),
/// )
/// ```
class FadeInAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration? delay;

  const FadeInAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.curve = Curves.easeIn,
    this.delay,
  });

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _hasStarted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    if (widget.delay != null) {
      Future.delayed(widget.delay!, () {
        if (mounted && !_hasStarted) {
          _hasStarted = true;
          _controller.forward();
        }
      });
    } else {
      _hasStarted = true;
      _controller.forward();
    }
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
