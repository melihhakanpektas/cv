import 'dart:math';

import 'package:flutter/material.dart';
import 'package:melihhakanpektas/shared/constants.dart';

class AboutMeView extends StatelessWidget {
  const AboutMeView(
    this.scrollController, {
    super.key,
  });
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(seconds: 4),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return Padding(
          padding: const EdgeInsets.all(kContentPadding),
          child: Center(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  As a mobile application developer, I bring over 2 years of experience in mobile application development mostly using Flutter & Firebase. I began my professional journey in software development with Flutter, during which I independently developed and published 2 web application projects and 2 mobile application, collaborated on over 10 projects, emphasizing teamwork and effective communication.
                  In my project engagements, I have integrated Al services such as ChatGPT and DALLE, alongside payment services including Stripe, Google Pay, Apple Pay, and PayTR. I have undertaken both front-end and back-end development responsibilities, predominantly utilizing Firebase and Google Cloud services for the backend infrastructure. Throughout the development lifecycle, I have adhered to Agile Methodologies and leveraged version control systems effectively.
                  ''',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
