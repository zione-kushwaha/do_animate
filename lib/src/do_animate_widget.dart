import 'package:flutter/material.dart';
import 'animation_type.dart';
import 'blinking_animation.dart';
import 'bounce_animation.dart';
import 'fade_in_animation.dart';
import 'fade_slide_animation.dart';
import 'pulse_animation.dart';
import 'rotate_animation.dart';
import 'scale_in_animation.dart';
import 'shake_animation.dart';
import 'shimmer_animation.dart';
import 'slide_in_animation.dart';
import 'wave_animation.dart';

/// A unified widget that provides easy access to all DoAnimate animations.
///
/// Simply choose an [AnimationType] and the widget will apply the appropriate animation.
///
/// Example:
/// ```dart
/// DoAnimateWidget(
///   animationType: AnimationType.fadeIn,
///   child: Text('Animated Text'),
/// )
///
/// // With custom configuration
/// DoAnimateWidget(
///   animationType: AnimationType.bounce,
///   config: AnimationConfig(
///     duration: Duration(seconds: 2),
///     offset: 30.0,
///   ),
///   child: Icon(Icons.star),
/// )
///
/// // Using predefined configs
/// DoAnimateWidget(
///   animationType: AnimationType.scaleIn,
///   config: AnimationConfig.fast(),
///   child: Container(...),
/// )
/// ```
class DoAnimateWidget extends StatelessWidget {
  /// The type of animation to apply
  final AnimationType animationType;

  /// The widget to animate
  final Widget child;

  /// Configuration for the animation
  final AnimationConfig? config;

  const DoAnimateWidget({
    super.key,
    required this.animationType,
    required this.child,
    this.config,
  });

  @override
  Widget build(BuildContext context) {
    final cfg = config ?? const AnimationConfig();

    switch (animationType) {
      case AnimationType.fadeIn:
        return FadeInAnimation(
          duration: cfg.duration,
          curve: cfg.curve,
          delay: cfg.delay,
          child: child,
        );

      case AnimationType.slideFromLeft:
        return SlideInAnimation.fromLeft(
          duration: cfg.duration,
          curve: cfg.curve,
          delay: cfg.delay,
          child: child,
        );

      case AnimationType.slideFromRight:
        return SlideInAnimation.fromRight(
          duration: cfg.duration,
          curve: cfg.curve,
          delay: cfg.delay,
          child: child,
        );

      case AnimationType.slideFromTop:
        return SlideInAnimation.fromTop(
          duration: cfg.duration,
          curve: cfg.curve,
          delay: cfg.delay,
          child: child,
        );

      case AnimationType.slideFromBottom:
        return SlideInAnimation.fromBottom(
          duration: cfg.duration,
          curve: cfg.curve,
          delay: cfg.delay,
          child: child,
        );

      case AnimationType.scaleIn:
        return ScaleInAnimation(
          duration: cfg.duration,
          curve: cfg.curve,
          delay: cfg.delay,
          beginScale: cfg.beginScale ?? 0.0,
          child: child,
        );

      case AnimationType.blinking:
        return BlinkingAnimation(
          duration: cfg.duration,
          curve: cfg.curve,
          child: child,
        );

      case AnimationType.bounce:
        return BounceAnimation(
          duration: cfg.duration,
          offset: cfg.offset ?? 20.0,
          child: child,
        );

      case AnimationType.rotate:
        return RotateAnimation(
          duration: cfg.duration,
          clockwise: cfg.clockwise ?? true,
          child: child,
        );

      case AnimationType.wave:
        return WaveAnimation(
          duration: cfg.duration,
          amplitude: cfg.amplitude ?? 10.0,
          child: child,
        );

      case AnimationType.pulse:
        return PulseAnimation(
          duration: cfg.duration,
          minScale: cfg.minScale ?? 0.95,
          maxScale: cfg.maxScale ?? 1.05,
          curve: cfg.curve,
          child: child,
        );

      case AnimationType.shake:
        return ShakeAnimation(
          duration: cfg.duration,
          offset: cfg.offset ?? 10.0,
          shakes: cfg.shakes ?? 3,
          child: child,
        );

      case AnimationType.shimmer:
        return ShimmerAnimation(
          duration: cfg.duration,
          baseColor: cfg.baseColor ?? const Color(0xFFE0E0E0),
          highlightColor: cfg.highlightColor ?? const Color(0xFFF5F5F5),
          child: child,
        );

      case AnimationType.fadeSlide:
        return FadeSlideAnimation(
          duration: cfg.duration,
          begin: cfg.slideBegin ?? const Offset(0, 0.5),
          delay: cfg.delay,
          child: child,
        );
    }
  }
}
