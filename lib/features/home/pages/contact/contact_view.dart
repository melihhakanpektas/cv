import 'dart:math';

import 'package:flutter/material.dart';
import 'package:melihhakanpektas/shared/constants.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactView extends StatelessWidget {
  const ContactView(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: kToolbarHeight + 30),
                  FadeTransition(
                    opacity: AlwaysStoppedAnimation(value < 0.2 ? 0 : min(1, (value - 0.2) * 4)),
                    child: const Text(
                      'Contact Me',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  const SizedBox(height: 30),
                  FadeTransition(
                    opacity: AlwaysStoppedAnimation(value < 0.4 ? 0 : min(1, (value - 0.4) * 4)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.email),
                            const SizedBox(width: 10),
                            TextButton(
                              onPressed: () {
                                launchUrlString('mailto:contact@melihhakanpektas.com');
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: const Text('contact@melihhakanpektas.com'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.phone),
                            const SizedBox(width: 10),
                            TextButton(
                              onPressed: () {
                                launchUrlString('tel:+905012533899');
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: const Text('+90 501 253 38 99'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.location_on),
                            SizedBox(width: 10),
                            Text('Ankara, Turkey'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.language),
                            SizedBox(width: 10),
                            Text('English, Turkish'),
                          ],
                        ),
                      ],
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
