# DoAnimate 🎭

A comprehensive Flutter animation package that provides beautiful, ready-to-use animation widgets for your Flutter applications. Make your UI come alive with smooth, performant animations!

[![pub package](https://img.shields.io/pub/v/do_animate.svg)](https://pub.dev/packages/do_animate)

## ✨ Features

- 🎨 **14 Pre-built Animations** - Ready to use out of the box
- 🚀 **High Performance** - Optimized animations using Flutter's native APIs
- 🎯 **Super Easy to Use** - One widget, just pick an animation type!
- 🛠️ **Highly Customizable** - Control duration, curves, delays, and more
- 📱 **Cross-platform** - Works on iOS, Android, Web, and Desktop
- ⚡ **Single Widget API** - No need to remember different widget names

## 📦 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  do_animate: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## 🎬 All 14 Animations - One Simple Widget!

Simply use `DoAnimateWidget` and choose from **14 animation types** using the `AnimationType` enum:

### ✅ All Animations Work Through DoAnimateWidget

Every single animation is accessible through the `DoAnimateWidget` - just change the `animationType`!

```dart
// ANY animation - same simple syntax!
DoAnimateWidget(
  animationType: AnimationType.fadeIn,  // Pick any from 14 types!
  child: Text('Hello World'),
)
```
| # | AnimationType | Description | Type |
|---|---------------|-------------|------|
| 1 | `fadeIn` | Fade in effect - gradually appears | One-time |
| 2 | `slideFromLeft` | Slide in from left side | One-time |
| 3 | `slideFromRight` | Slide in from right side | One-time |
| 4 | `slideFromTop` | Slide in from top | One-time |
| 5 | `slideFromBottom` | Slide in from bottom | One-time |
| 6 | `scaleIn` | Zoom/scale in effect | One-time |
| 7 | `blinking` | Continuous blinking/pulsing opacity | Loop |
| 8 | `bounce` | Continuous bouncing jump effect | Loop |
| 9 | `rotate` | Continuous rotation | Loop |
| 10 | `wave` | Wave/floating effect | Loop |
| 11 | `pulse` | Continuous scale pulsing | Loop |
| 12 | `shake` | Shake effect (one-time) | One-time |
| 13 | `shimmer` | Shimmer loading effect | Loop |
| 14 | `fadeSlide` | Combined fade and slide | One-time |
| `shake` | Shake effect (one-time) |
| `shimmer` | Shimmer loading effect |
| `fadeSlide` | Combined fade and slide |

### 💡 Examples - All Animations Work the Same Way!

```dart
// 1. Fade In
DoAnimateWidget(
  animationType: AnimationType.fadeIn,
  child: Text('Fading in'),
)

// 2. Slide from Left
DoAnimateWidget(
  animationType: AnimationType.slideFromLeft,
  child: Text('Sliding in'),
)

// 3. Scale In
DoAnimateWidget(
  animationType: AnimationType.scaleIn,
  child: Icon(Icons.favorite),
)

// 4. Bounce (continuous)
DoAnimateWidget(
  animationType: AnimationType.bounce,
  config: AnimationConfig(offset: 30.0),
  child: Icon(Icons.star),
)

// 5. Rotate (continuous)
DoAnimateWidget(
  animationType: AnimationType.rotate,
  child: Icon(Icons.refresh),
)

// 6. Shimmer (for loading)
DoAnimateWidget(
  animationType: AnimationType.shimmer,
  child: Container(width: 200, height: 20, color: Colors.white),
)

// 7. Using Preset Configs
DoAnimateWidget(
  animationType: AnimationType.fadeIn,
  config: AnimationConfig.fast(),  // or .slow(), .bouncy()
  child: Text('Fast animation!'),
)
```

## 🚀 Quick Start - Easy API

The easiest way to use DoAnimate is with `DoAnimateWidget` - just pick an animation type!

```dart
import 'package:flutter/material.dart';
import 'package:do_animate/do_animate.dart';

// Simple - just choose an AnimationType!
DoAnimateWidget(
  animationType: AnimationType.fadeIn,
  child: Text('Hello World'),
)

// With custom duration
DoAnimateWidget(
  animationType: AnimationType.bounce,
  config: AnimationConfig(
    duration: Duration(seconds: 2),
    offset: 30.0,
  ),
  child: Icon(Icons.star),
)

// Use predefined configs
DoAnimateWidget(
  animationType: AnimationType.scaleIn,
  config: AnimationConfig.fast(), // or .slow(), .bouncy()
  child: Container(...),
)
```

### Available Animation Types

```dart
AnimationType.fadeIn
AnimationType.slideFromLeft
AnimationType.slideFromRight
AnimationType.slideFromTop
AnimationType.slideFromBottom
AnimationType.scaleIn
AnimationType.blinking
AnimationType.bounce
AnimationType.rotate
AnimationType.wave
AnimationType.pulse
AnimationType.shake
AnimationType.shimmer
AnimationType.fadeSlide
```

## 🎯 Complete Example

Here's a complete example showing multiple animations:

```dart
import 'package:flutter/material.dart';
import 'package:do_animate/do_animate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('DoAnimate Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Easy API - Just choose animation type!
              DoAnimateWidget(
                animationType: AnimationType.fadeIn,
                child: Text('Fading In', style: TextStyle(fontSize: 24)),
              ),
              SizedBox(height: 20),
              DoAnimateWidget(
                animationType: AnimationType.slideFromLeft,
                child: Text('Sliding From Left', style: TextStyle(fontSize: 24)),
              ),
              SizedBox(height: 20),
              DoAnimateWidget(
                animationType: AnimationType.scaleIn,
                config: AnimationConfig.bouncy(),
                child: Text('Scaling In', style: TextStyle(fontSize: 24)),
              ),
              SizedBox(height: 40),
              DoAnimateWidget(
                animationType: AnimationType.rotate,
                child: Icon(Icons.refresh, size: 48),
              ),
## 🎨 Full Customization Options

All 14 animations support the same `AnimationConfig` customization:

```dart
DoAnimateWidget(
  animationType: AnimationType.fadeIn, // Works with ANY animation type!
  config: AnimationConfig(
    duration: Duration(seconds: 1),
    curve: Curves.elasticOut,
    delay: Duration(milliseconds: 200),
  ),
  child: YourWidget(),
)
```

### 📝 AnimationConfig Properties:
Use `AnimationConfig` to customize any animation:
| Property | Used For | Description |
|----------|----------|-------------|
| `duration` | All animations | Control animation speed |
| `curve` | All animations | Animation curve (Curves.easeIn, etc.) |
| `delay` | One-time animations | Delay before starting |
| `offset` | bounce, shake | Jump/shake distance |
| `minScale/maxScale` | pulse | Scale range |
| `beginScale` | scaleIn | Starting scale value |
| `amplitude` | wave | Wave height |
| `clockwise` | rotate | Rotation direction |
| `baseColor/highlightColor` | shimmer | Shimmer colors |
| `slideBegin` | fadeSlide | Custom slide offset |
| `shakes` | shake | Number of shakes |

### ⚡ Quick Preset Configs:

```dart
AnimationConfig.fast()    // 300ms, easeOut - snappy animations
AnimationConfig.slow()    // 1200ms, easeInOut - smooth, gentle
AnimationConfig.bouncy()  // 800ms, elasticOut - fun, playful
```*delay**: Delay before animation starts
- **offset**: For bounce/shake animations
- **minScale/maxScale**: For pulse animations
- **beginScale**: For scale animations
- **amplitude**: For wave animations
- **clockwise**: For rotate animations
- **baseColor/highlightColor**: For shimmer animations
- **slideBegin**: For slide animations

### Preset Configs:

```dart
AnimationConfig.fast()    // 300ms, easeOut
AnimationConfig.slow()    // 1200ms, easeInOut
AnimationConfig.bouncy()  // 800ms, elasticOut
```

## 🔄 Animation Types

### One-time Animations
Play once when the widget is built:
- `AnimationType.fadeIn`
- `AnimationType.slideFromLeft/Right/Top/Bottom`
- `AnimationType.scaleIn`
- `AnimationType.fadeSlide`
- `AnimationType.shake`

### Continuous Animations
Loop indefinitely:
- `AnimationType.blinking`
- `AnimationType.bounce`
- `AnimationType.rotate`
- `AnimationType.wave`
- `AnimationType.pulse`
- `AnimationType.shimmer`

## 🌟 Best Practices

1. **Use delays for sequential animations**:
```dart
Column(
  children: [
    DoAnimateWidget(
      animationType: AnimationType.fadeIn,
      child: Widget1(),
    ),
    DoAnimateWidget(
      animationType: AnimationType.fadeIn,
      config: AnimationConfig(delay: Duration(milliseconds: 200)),
      child: Widget2(),
    ),
    DoAnimateWidget(
      animationType: AnimationType.fadeIn,
      config: AnimationConfig(delay: Duration(milliseconds: 400)),
      child: Widget3(),
    ),
  ],
)
```

2. **Use shimmer for loading states**:
```dart
isLoading
  ? DoAnimateWidget(
      animationType: AnimationType.shimmer,
      child: PlaceholderWidget(),
    )
  : ActualContent()
```

3. **Choose the right animation type for your use case**:
- Use `fadeIn` for subtle entrances
- Use `slideFromLeft/Right` for navigation transitions
- Use `bounce` or `pulse` for attention-grabbing elements
- Use `shimmer` for skeleton loading screens

## 📖 Documentation

For detailed documentation, visit [pub.dev/packages/do_animate](https://pub.dev/packages/do_animate)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 💬 Support

If you have any questions or issues, please file an issue on [GitHub](https://github.com/zione-kushwaha/do_animate/issues).

## ⭐ Show Your Support

If you like this package, please give it a ⭐ on [GitHub](https://github.com/zione-kushwaha/do_animate) and a 👍 on [pub.dev](https://pub.dev/packages/do_animate)!

---

Made with ❤️ for the Flutter community
