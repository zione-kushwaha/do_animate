import 'package:flutter/material.dart';
import 'package:do_animate/do_animate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DoAnimate Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AnimationDemoPage(),
    );
  }
}

class AnimationDemoPage extends StatelessWidget {
  const AnimationDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DoAnimate Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSection(
              'Fade In Animation',
              FadeInAnimation(
                delay: const Duration(milliseconds: 200),
                child: _buildCard('I fade in smoothly', Colors.blue),
              ),
            ),
            _buildSection(
              'Slide In Animations',
              Column(
                children: [
                  SlideInAnimation.fromLeft(
                    delay: const Duration(milliseconds: 300),
                    child: _buildCard('← From Left', Colors.green),
                  ),
                  const SizedBox(height: 10),
                  SlideInAnimation.fromRight(
                    delay: const Duration(milliseconds: 400),
                    child: _buildCard('From Right →', Colors.orange),
                  ),
                  const SizedBox(height: 10),
                  SlideInAnimation.fromTop(
                    delay: const Duration(milliseconds: 500),
                    child: _buildCard('↑ From Top', Colors.purple),
                  ),
                ],
              ),
            ),
            _buildSection(
              'Scale In Animation',
              ScaleInAnimation(
                delay: const Duration(milliseconds: 600),
                beginScale: 0.3,
                child: _buildCard('I scale in!', Colors.teal),
              ),
            ),
            _buildSection(
              'Continuous Animations',
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlinkingAnimation(
                    duration: const Duration(seconds: 2),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Blinking',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  BounceAnimation(
                    offset: 15,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text('Bouncing'),
                    ),
                  ),
                  RotateAnimation(
                    duration: const Duration(seconds: 3),
                    child:
                        const Icon(Icons.refresh, size: 40, color: Colors.blue),
                  ),
                ],
              ),
            ),
            _buildSection(
              'Wave Animation',
              WaveAnimation(
                amplitude: 10,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    '🌊 Floating like a wave',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            _buildSection(
              'Pulse Animation',
              PulseAnimation(
                minScale: 0.95,
                maxScale: 1.05,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    '💗 Pulsing',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            _buildSection(
              'Shimmer Animation (Loading Effect)',
              ShimmerAnimation(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            _buildSection(
              'Fade + Slide Combo',
              FadeSlideAnimation(
                delay: const Duration(milliseconds: 700),
                begin: const Offset(0, 0.3),
                child: _buildCard('Fade + Slide Together', Colors.deepPurple),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, Widget child) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Widget _buildCard(String text, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
