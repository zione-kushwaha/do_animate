import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:do_animate/do_animate.dart';

void main() {
  testWidgets('FadeInAnimation builds correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FadeInAnimation(
            child: Text('Test'),
          ),
        ),
      ),
    );

    expect(find.text('Test'), findsOneWidget);
  });

  testWidgets('BlinkingAnimation builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: BlinkingAnimation(
            child: Text('Blinking'),
          ),
        ),
      ),
    );

    expect(find.text('Blinking'), findsOneWidget);
  });

  testWidgets('BounceAnimation builds correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: BounceAnimation(
            child: Text('Bouncing'),
          ),
        ),
      ),
    );

    expect(find.text('Bouncing'), findsOneWidget);
  });

  testWidgets('SlideInAnimation.fromLeft builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SlideInAnimation.fromLeft(
            child: Text('Sliding'),
          ),
        ),
      ),
    );

    expect(find.text('Sliding'), findsOneWidget);
  });

  testWidgets('RotateAnimation builds correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RotateAnimation(
            child: Icon(Icons.refresh),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.refresh), findsOneWidget);
  });
}
