import 'package:flutter/material.dart';

/// A widget that combines fade and slide animations.
///
/// The child widget will simultaneously fade in and slide into position.
/// Perfect for list items or card entrance effects.
///
/// Example:
/// ```dart
/// FadeSlideAnimation(
///   duration: Duration(milliseconds: 800),
///   begin: Offset(0, 0.5),
///   delay: Duration(milliseconds: 100),
///   child: Card(child: Text('Animated Card')),
/// )
/// ```
class FadeSlideAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Offset begin;
  final Duration? delay;

  const FadeSlideAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.begin = const Offset(0, 0.5),
    this.delay,
  });

  @override
  State<FadeSlideAnimation> createState() => _FadeSlideAnimationState();
}

class _FadeSlideAnimationState extends State<FadeSlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _hasStarted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(
      begin: widget.begin,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

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
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(position: _slideAnimation, child: widget.child),
    );
  }
}
