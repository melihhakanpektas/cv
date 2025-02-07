import 'dart:math';

import 'package:flutter/material.dart';
import 'package:melihhakanpektas/shared/constants.dart';

class AboutMeView extends StatefulWidget {
  const AboutMeView(
    this.scrollController, {
    super.key,
  });
  final ScrollController scrollController;

  @override
  State<AboutMeView> createState() => _AboutMeViewState();
}

class _AboutMeViewState extends State<AboutMeView> with SingleTickerProviderStateMixin {
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
        return Padding(
          padding: const EdgeInsets.all(kContentPadding),
          child: Center(
            child: SingleChildScrollView(
              controller: widget.scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: kToolbarHeight + 30),
                  FadeTransition(
                    opacity: AlwaysStoppedAnimation(value < 0.2 ? 0 : min(1, (value - 0.2) * 4)),
                    child: const Text(
                      'About Me',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  const SizedBox(height: 30),
                  FadeTransition(
                    opacity: AlwaysStoppedAnimation(value < 0.4 ? 0 : min(1, (value - 0.4) * 4)),
                    child: const Text(
                      '''
                  As a senior Flutter developer with 4+ years of proven expertise, I've consistently delivered high-impact mobile solutions that drive business growth. My portfolio includes successfully launched applications serving 100,000+ users, demonstrating my ability to build and scale robust mobile solutions.

                  Key Technical Achievements:
                  • Reduced app load times by 70% through advanced caching strategies and optimized state management
                  • Architected mission-critical payment systems processing 1M+ in transactions using Stripe, Google Pay, and Apple Pay
                  • Pioneered AI integration solutions combining ChatGPT and DALLE, resulting in 40% increase in user engagement
                  • Built scalable Firebase backends
                  
                  I specialize in transforming complex business requirements into elegant, maintainable code. My expertise in implementing sophisticated features like real-time synchronization, complex state management, and high-performance animations has consistently resulted in applications that exceed client expectations and user needs.

                  On the infrastructure side, I've designed and implemented robust Firebase architectures with advanced security rules and optimized database structures, resulting in significant cost savings while maintaining peak performance. My experience with Cloud Functions and automated workflows has helped businesses streamline their operations and reduce manual intervention.
                  ''',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
