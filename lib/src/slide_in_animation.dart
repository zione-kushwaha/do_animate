import 'package:flutter/material.dart';

/// A widget that creates a slide-in effect from any direction.
///
/// The child widget will slide in from the specified direction.
/// Use the convenient named constructors for common directions.
///
/// Example:
/// ```dart
/// SlideInAnimation.fromLeft(
///   duration: Duration(milliseconds: 800),
///   child: Container(child: Text('Sliding in')),
/// )
/// ```
class SlideInAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Offset begin;
  final Curve curve;
  final Duration? delay;

  const SlideInAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.begin = const Offset(0, 1), // From bottom
    this.curve = Curves.easeOut,
    this.delay,
  });

  /// Slide in from the left side
  const SlideInAnimation.fromLeft({
    Key? key,
    required Widget child,
    Duration duration = const Duration(milliseconds: 800),
    Curve curve = Curves.easeOut,
    Duration? delay,
  }) : this(
          key: key,
          child: child,
          duration: duration,
          begin: const Offset(-1, 0),
          curve: curve,
          delay: delay,
        );

  /// Slide in from the right side
  const SlideInAnimation.fromRight({
    Key? key,
    required Widget child,
    Duration duration = const Duration(milliseconds: 800),
    Curve curve = Curves.easeOut,
    Duration? delay,
  }) : this(
          key: key,
          child: child,
          duration: duration,
          begin: const Offset(1, 0),
          curve: curve,
          delay: delay,
        );

  /// Slide in from the top
  const SlideInAnimation.fromTop({
    Key? key,
    required Widget child,
    Duration duration = const Duration(milliseconds: 800),
    Curve curve = Curves.easeOut,
    Duration? delay,
  }) : this(
          key: key,
          child: child,
          duration: duration,
          begin: const Offset(0, -1),
          curve: curve,
          delay: delay,
        );

  /// Slide in from the bottom
  const SlideInAnimation.fromBottom({
    Key? key,
    required Widget child,
    Duration duration = const Duration(milliseconds: 800),
    Curve curve = Curves.easeOut,
    Duration? delay,
  }) : this(
          key: key,
          child: child,
          duration: duration,
          begin: const Offset(0, 1),
          curve: curve,
          delay: delay,
        );
  @override
  State<SlideInAnimation> createState() => _SlideInAnimationState();
}

class _SlideInAnimationState extends State<SlideInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  bool _hasStarted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);

    _animation = Tween<Offset>(
      begin: widget.begin,
      end: Offset.zero,
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
    return SlideTransition(position: _animation, child: widget.child);
  }
}
