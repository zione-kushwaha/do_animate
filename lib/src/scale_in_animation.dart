import 'package:flutter/material.dart';

/// A widget that creates a zoom-in/scale effect.
///
/// The child widget will grow from a smaller size to its full size.
///
/// Example:
/// ```dart
/// ScaleInAnimation(
///   duration: Duration(milliseconds: 600),
///   beginScale: 0.5,
///   child: Icon(Icons.favorite),
/// )
/// ```
class ScaleInAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration? delay;
  final double? beginScale;

  const ScaleInAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.curve = Curves.easeOut,
    this.delay,
    this.beginScale = 0.0,
  });

  @override
  State<ScaleInAnimation> createState() => _ScaleInAnimationState();
}

class _ScaleInAnimationState extends State<ScaleInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _hasStarted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);

    _animation = Tween<double>(
      begin: widget.beginScale,
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
    return ScaleTransition(scale: _animation, child: widget.child);
  }
}
