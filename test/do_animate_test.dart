import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:do_animate/do_animate.dart';

void main() {
  testWidgets('DoAnimateWidget with fadeIn builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DoAnimateWidget(
            animationType: AnimationType.fadeIn,
            child: Text('Test'),
          ),
        ),
      ),
    );

    expect(find.text('Test'), findsOneWidget);
  });

  testWidgets('DoAnimateWidget with blinking builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DoAnimateWidget(
            animationType: AnimationType.blinking,
            child: Text('Blinking'),
          ),
        ),
      ),
    );

    expect(find.text('Blinking'), findsOneWidget);
  });

  testWidgets('DoAnimateWidget with bounce builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DoAnimateWidget(
            animationType: AnimationType.bounce,
            child: Text('Bouncing'),
          ),
        ),
      ),
    );

    expect(find.text('Bouncing'), findsOneWidget);
  });

  testWidgets('DoAnimateWidget with slideFromLeft builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DoAnimateWidget(
            animationType: AnimationType.slideFromLeft,
            child: Text('Sliding'),
          ),
        ),
      ),
    );

    expect(find.text('Sliding'), findsOneWidget);
  });

  testWidgets('DoAnimateWidget with rotate builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DoAnimateWidget(
            animationType: AnimationType.rotate,
            child: Icon(Icons.refresh),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.refresh), findsOneWidget);
  });

  testWidgets('DoAnimateWidget with custom config works',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DoAnimateWidget(
            animationType: AnimationType.scaleIn,
            config: AnimationConfig(
              duration: Duration(seconds: 1),
              curve: Curves.bounceOut,
            ),
            child: Text('Scaled'),
          ),
        ),
      ),
    );

    expect(find.text('Scaled'), findsOneWidget);
  });

  testWidgets('DoAnimateWidget with preset config works',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DoAnimateWidget(
            animationType: AnimationType.fadeIn,
            config: AnimationConfig.fast(),
            child: const Text('Fast'),
          ),
        ),
      ),
    );

    expect(find.text('Fast'), findsOneWidget);
  });

  test('AnimationType enum has all expected values', () {
    expect(AnimationType.values.length, 14);
    expect(AnimationType.values.contains(AnimationType.fadeIn), true);
    expect(AnimationType.values.contains(AnimationType.slideFromLeft), true);
    expect(AnimationType.values.contains(AnimationType.bounce), true);
    expect(AnimationType.values.contains(AnimationType.shimmer), true);
  });
}
