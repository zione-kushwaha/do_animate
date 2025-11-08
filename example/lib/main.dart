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
            const Text(
              'Just pick an AnimationType! 🎨',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Simple usage - just select animation type!
            DoAnimateWidget(
              animationType: AnimationType.fadeIn,
              child: _buildCard('Fade In', Colors.blue),
            ),
            const SizedBox(height: 15),

            DoAnimateWidget(
              animationType: AnimationType.slideFromLeft,
              child: _buildCard('Slide From Left', Colors.green),
            ),
            const SizedBox(height: 15),

            DoAnimateWidget(
              animationType: AnimationType.slideFromRight,
              child: _buildCard('Slide From Right', Colors.orange),
            ),
            const SizedBox(height: 15),

            DoAnimateWidget(
              animationType: AnimationType.scaleIn,
              config: AnimationConfig.bouncy(),
              child: _buildCard('Scale In (Bouncy)', Colors.purple),
            ),
            const SizedBox(height: 15),

            // With custom configuration
            DoAnimateWidget(
              animationType: AnimationType.bounce,
              config: const AnimationConfig(
                duration: Duration(seconds: 2),
                offset: 25.0,
              ),
              child: _buildCard('Custom Bounce', Colors.amber),
            ),
            const SizedBox(height: 15),

            DoAnimateWidget(
              animationType: AnimationType.pulse,
              child: _buildCard('Pulse Animation', Colors.pink),
            ),
            const SizedBox(height: 15),

            DoAnimateWidget(
              animationType: AnimationType.rotate,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: const Icon(Icons.refresh, size: 60, color: Colors.teal),
              ),
            ),
            const SizedBox(height: 15),

            DoAnimateWidget(
              animationType: AnimationType.wave,
              child: _buildCard('Wave Effect', Colors.cyan),
            ),
            const SizedBox(height: 15),

            DoAnimateWidget(
              animationType: AnimationType.blinking,
              child: _buildCard('Blinking', Colors.red),
            ),
            const SizedBox(height: 15),

            DoAnimateWidget(
              animationType: AnimationType.shake,
              child: _buildCard('Shake Animation', Colors.deepOrange),
            ),
            const SizedBox(height: 15),

            DoAnimateWidget(
              animationType: AnimationType.shimmer,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[300]!),
                ),
              ),
            ),
            const SizedBox(height: 15),

            DoAnimateWidget(
              animationType: AnimationType.fadeSlide,
              child: _buildCard('Fade + Slide Combo', Colors.deepPurple),
            ),
            const SizedBox(height: 30),
          ],
        ),
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
