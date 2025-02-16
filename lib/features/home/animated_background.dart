import 'package:flutter/material.dart';
import 'package:melihhakanpektas/features/home/animated_row.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late final VoidCallback listener;
  final List<String> pngs = [
    'assets/images/background_images/android_studio_1.png',
    'assets/images/background_images/dart_0.png',
    'assets/images/background_images/firebase_0.png',
    'assets/images/background_images/flutter_0.png',
    'assets/images/background_images/kotlin_0.png',
    'assets/images/background_images/node_js_0.png',
    'assets/images/background_images/swift_0.png',
    'assets/images/background_images/vscode_0.png',
    'assets/images/background_images/xcode_0.png',
    'assets/images/background_images/app_store_0.png',
    'assets/images/background_images/google_play_store_0.png',
    'assets/images/background_images/c++_0.png',
    'assets/images/background_images/unreal_engine_0.png',
    'assets/images/background_images/blender_0.png',
    'assets/images/background_images/astro_0.png',
    'assets/images/background_images/html_0.png',
    'assets/images/background_images/css_0.png',
    'assets/images/background_images/js_0.png',
  ];
  List<List<String>> pngLists = [];
  int repeatIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
    listener = () {
      if (_controller.isCompleted) {
        repeatIndex = (repeatIndex + 1) % pngs.length;
        _controller
          ..reset()
          ..forward();
      }
    };

    _controller
      ..addListener(listener)
      ..forward();
  }

  @override
  void dispose() {
    try {
      _controller
        ..removeListener(listener)
        ..dispose();
      _animation.removeListener(listener);
    } catch (e) {
      debugPrint('Error during dispose: $e');
    } finally {
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const rowMinHeight = 300.0;
    final rowCount = size.height ~/ rowMinHeight;
    if (pngLists.isEmpty || pngLists.length != rowCount) {
      pngLists = List.generate(rowCount, (index) => List<String>.from(pngs)..shuffle());
    }
    return Column(
      children: [
        for (int i = 0; i < rowCount; i++)
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Expanded(
                child: AnimatedRow(
                  ltr: i.isOdd,
                  animation: _animation.value,
                  pngs: pngLists[i],
                  repeatIndex: repeatIndex,
                ),
              );
            },
          ),
      ],
    );
  }
}
