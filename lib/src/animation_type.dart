import 'package:flutter/material.dart';

/// Enum representing different types of animations available in DoAnimate.
enum AnimationType {
  /// Fade in animation - gradually appears from transparent to opaque
  fadeIn,

  /// Slide in from left side
  slideFromLeft,

  /// Slide in from right side
  slideFromRight,

  /// Slide in from top
  slideFromTop,

  /// Slide in from bottom
  slideFromBottom,

  /// Scale in animation - zoom in effect
  scaleIn,

  /// Blinking animation - continuous opacity pulsing
  blinking,

  /// Bounce animation - continuous jumping effect
  bounce,

  /// Rotate animation - continuous rotation
  rotate,

  /// Wave animation - floating/wave effect
  wave,

  /// Pulse animation - continuous scale pulsing
  pulse,

  /// Shake animation - shake effect (one-time)
  shake,

  /// Shimmer animation - loading shimmer effect
  shimmer,

  /// Fade and slide combined animation
  fadeSlide,
}

/// Configuration for animation behavior
class AnimationConfig {
  /// Duration of the animation
  final Duration duration;

  /// Animation curve
  final Curve curve;

  /// Delay before animation starts
  final Duration? delay;

  /// Offset for bounce/slide animations
  final double? offset;

  /// Scale values for scale/pulse animations
  final double? minScale;
  final double? maxScale;
  final double? beginScale;

  /// Rotation direction for rotate animation
  final bool? clockwise;

  /// Amplitude for wave animation
  final double? amplitude;

  /// Number of shakes for shake animation
  final int? shakes;

  /// Colors for shimmer animation
  final Color? baseColor;
  final Color? highlightColor;

  /// Slide begin offset for custom slide/fadeSlide
  final Offset? slideBegin;

  const AnimationConfig({
    this.duration = const Duration(milliseconds: 600),
    this.curve = Curves.easeInOut,
    this.delay,
    this.offset,
    this.minScale,
    this.maxScale,
    this.beginScale,
    this.clockwise,
    this.amplitude,
    this.shakes,
    this.baseColor,
    this.highlightColor,
    this.slideBegin,
  });

  /// Quick config for fast animations
  factory AnimationConfig.fast() {
    return const AnimationConfig(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  /// Quick config for slow animations
  factory AnimationConfig.slow() {
    return const AnimationConfig(
      duration: Duration(milliseconds: 1200),
      curve: Curves.easeInOut,
    );
  }

  /// Quick config for bouncy animations
  factory AnimationConfig.bouncy() {
    return const AnimationConfig(
      duration: Duration(milliseconds: 800),
      curve: Curves.elasticOut,
    );
  }
}
