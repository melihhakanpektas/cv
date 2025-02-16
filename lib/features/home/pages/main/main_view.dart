import 'dart:math';

import 'package:flutter/material.dart';
import 'package:melihhakanpektas/shared/constants.dart';
import 'package:melihhakanpektas/shared/neon_widget.dart';

class MainView extends StatefulWidget {
  const MainView(
    this.scrollController, {
    super.key,
  });
  final ScrollController scrollController;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..forward();
  }

  @override
  void dispose() {
    try {
      _animationController.dispose();
    } catch (e) {
      debugPrint('Error during dispose: $e');
    } finally {
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        final value = _animationController.value;
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: AlwaysStoppedAnimation(min(1, value * 3)),
            curve: Curves.fastOutSlowIn,
          ),
          child: Center(
            child: SingleChildScrollView(
              controller: widget.scrollController,
              child: Padding(
                padding: const EdgeInsets.all(kContentPadding),
                child: Column(
                  children: [
                    const SizedBox(height: kToolbarHeight + 30),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (MediaQuery.of(context).size.width < kMobileMaxContentWidth) ...[
                                Center(
                                  child: FadeTransition(
                                    opacity: AlwaysStoppedAnimation(
                                      value < 0.8 ? 0 : min(1, (value - 0.8) * 4),
                                    ),
                                    child: Neon(
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: min(
                                              kMaxContentWidth,
                                              MediaQuery.of(context).size.width,
                                            ) /
                                            kMaxContentWidth *
                                            150.0,
                                        backgroundImage: const AssetImage(
                                          'assets/images/melih_hakan_pektas_small.jpg',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                              FadeTransition(
                                opacity: AlwaysStoppedAnimation(
                                  value < 0.2 ? 0 : min(1, (value - 0.2) * 4),
                                ),
                                child: const Text(
                                  "Hello, I'm",
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                              FadeTransition(
                                opacity: AlwaysStoppedAnimation(
                                  value < 0.4 ? 0 : min(1, (value - 0.4) * 4),
                                ),
                                child: const Text(
                                  'Melih Hakan Pektas',
                                  style: TextStyle(fontSize: 50),
                                ),
                              ),
                              FadeTransition(
                                opacity: AlwaysStoppedAnimation(
                                  value < 0.6 ? 0 : min(1, (value - 0.6) * 4),
                                ),
                                child: const Text(
                                  'I am a Full Stack Developer mostly for Web and Mobile platforms with +4 years of experience.',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (MediaQuery.of(context).size.width > kMobileMaxContentWidth) ...[
                          const SizedBox(width: kContentPadding),
                          FadeTransition(
                            opacity:
                                AlwaysStoppedAnimation(value < 0.8 ? 0 : min(1, (value - 0.8) * 4)),
                            child: Neon(
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: min(kMaxContentWidth, MediaQuery.of(context).size.width) /
                                    kMaxContentWidth *
                                    150.0,
                                backgroundImage:
                                    const AssetImage('assets/images/melih_hakan_pektas_small.jpg'),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
