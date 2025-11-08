## 1.0.0

* Initial release
* **Single unified widget API**: `DoAnimateWidget` for all animations
* **14 animation types** available through `AnimationType` enum:
  - `fadeIn` - Fade in effect
  - `slideFromLeft` - Slide from left
  - `slideFromRight` - Slide from right
  - `slideFromTop` - Slide from top
  - `slideFromBottom` - Slide from bottom
  - `scaleIn` - Zoom/scale in effect
  - `blinking` - Continuous blinking/pulsing
  - `bounce` - Continuous bouncing
  - `rotate` - Continuous rotation
  - `wave` - Wave/floating effect
  - `pulse` - Continuous scale pulsing
  - `shake` - Shake effect
  - `shimmer` - Shimmer loading effect
  - `fadeSlide` - Combined fade and slide
* **AnimationConfig** for full customization (duration, curve, delay, and animation-specific properties)
* **Preset configs**: `AnimationConfig.fast()`, `.slow()`, `.bouncy()`
* Full documentation with examples
* Example app demonstrating all 14 animations
* Comprehensive test coverage
