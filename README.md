# DoAnimate 🎭

A comprehensive Flutter animation package that provides beautiful, ready-to-use animation widgets for your Flutter applications. Make your UI come alive with smooth, performant animations!

[![pub package](https://img.shields.io/pub/v/do_animate.svg)](https://pub.dev/packages/do_animate)

## ✨ Features

- 🎨 **11 Pre-built Animations** - Ready to use out of the box
- 🚀 **High Performance** - Optimized animations using Flutter's native APIs
- 🎯 **Easy to Use** - Simple, intuitive API
- 🛠️ **Highly Customizable** - Control duration, curves, delays, and more
- 📱 **Cross-platform** - Works on iOS, Android, Web, and Desktop
- 🧩 **Composable** - Combine animations for complex effects

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

## 🎬 Available Animations

### 1. **FadeInAnimation** - Fade in effect
```dart
FadeInAnimation(
  duration: Duration(milliseconds: 600),
  delay: Duration(milliseconds: 200),
  child: Text('Fading in'),
)
```

### 2. **SlideInAnimation** - Slide in from any direction
```dart
SlideInAnimation.fromLeft(
  duration: Duration(milliseconds: 800),
  child: Container(child: Text('Sliding in')),
)

// Also available: fromRight, fromTop, fromBottom
```

### 3. **ScaleInAnimation** - Zoom in effect
```dart
ScaleInAnimation(
  duration: Duration(milliseconds: 600),
  beginScale: 0.5,
  child: Icon(Icons.favorite),
)
```

### 4. **BlinkingAnimation** - Blinking/pulsing opacity
```dart
BlinkingAnimation(
  duration: Duration(seconds: 2),
  child: Text('Blinking Text'),
)
```

### 5. **BounceAnimation** - Bouncing jump effect
```dart
BounceAnimation(
  duration: Duration(milliseconds: 1000),
  offset: 20.0,
  child: Icon(Icons.star),
)
```

### 6. **RotateAnimation** - Continuous rotation
```dart
RotateAnimation(
  duration: Duration(seconds: 3),
  clockwise: true,
  child: Icon(Icons.refresh),
)
```

### 7. **ShimmerAnimation** - Shimmer loading effect
```dart
ShimmerAnimation(
  duration: Duration(milliseconds: 1500),
  baseColor: Colors.grey[300]!,
  highlightColor: Colors.grey[100]!,
  child: Container(
    width: 200,
    height: 20,
    color: Colors.white,
  ),
)
```

### 8. **WaveAnimation** - Wave/floating effect
```dart
WaveAnimation(
  duration: Duration(seconds: 2),
  amplitude: 10.0,
  child: Icon(Icons.water_drop),
)
```

### 9. **PulseAnimation** - Pulsing scale effect
```dart
PulseAnimation(
  duration: Duration(milliseconds: 1000),
  minScale: 0.95,
  maxScale: 1.05,
  child: Icon(Icons.notifications),
)
```

### 10. **ShakeAnimation** - Shake effect for errors
```dart
ShakeAnimation(
  duration: Duration(milliseconds: 500),
  offset: 10.0,
  shakes: 3,
  child: TextField(),
)
```

### 11. **FadeSlideAnimation** - Combined fade and slide
```dart
FadeSlideAnimation(
  duration: Duration(milliseconds: 800),
  begin: Offset(0, 0.5),
  delay: Duration(milliseconds: 100),
  child: Card(child: Text('Animated Card')),
)
```

## 🎯 Usage Example

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
              FadeInAnimation(
                delay: Duration(milliseconds: 200),
                child: Text('Fading In', style: TextStyle(fontSize: 24)),
              ),
              SizedBox(height: 20),
              SlideInAnimation.fromLeft(
                delay: Duration(milliseconds: 400),
                child: Text('Sliding From Left', style: TextStyle(fontSize: 24)),
              ),
              SizedBox(height: 20),
              ScaleInAnimation(
                delay: Duration(milliseconds: 600),
                child: Text('Scaling In', style: TextStyle(fontSize: 24)),
              ),
              SizedBox(height: 40),
              RotateAnimation(
                child: Icon(Icons.refresh, size: 48),
              ),
              SizedBox(height: 20),
              BounceAnimation(
                child: Icon(Icons.star, size: 48, color: Colors.amber),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## 🎨 Customization

All animations support customization through parameters:

- **duration**: Control animation speed
- **curve**: Choose from Flutter's animation curves (Curves.easeIn, Curves.bounceOut, etc.)
- **delay**: Add delays before animation starts
- **Custom properties**: Each animation has specific properties (offset, scale, rotation, etc.)

Example with custom curve:

```dart
FadeInAnimation(
  duration: Duration(seconds: 1),
  curve: Curves.elasticOut,
  child: YourWidget(),
)
```

## 🔄 Animation Types

### One-time Animations
These animations play once when the widget is built:
- FadeInAnimation
- SlideInAnimation
- ScaleInAnimation
- FadeSlideAnimation
- ShakeAnimation (plays once on build)

### Continuous Animations
These animations loop indefinitely:
- BlinkingAnimation
- BounceAnimation
- RotateAnimation
- WaveAnimation
- PulseAnimation
- ShimmerAnimation

## 🌟 Best Practices

1. **Use delays for sequential animations**:
```dart
Column(
  children: [
    FadeInAnimation(delay: Duration(milliseconds: 0), child: Widget1()),
    FadeInAnimation(delay: Duration(milliseconds: 200), child: Widget2()),
    FadeInAnimation(delay: Duration(milliseconds: 400), child: Widget3()),
  ],
)
```

2. **Combine animations for complex effects**:
```dart
FadeInAnimation(
  child: ScaleInAnimation(
    child: YourWidget(),
  ),
)
```

3. **Use ShimmerAnimation for loading states**:
```dart
isLoading
  ? ShimmerAnimation(child: PlaceholderWidget())
  : ActualContent()
```

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
