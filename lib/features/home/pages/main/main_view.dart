import 'dart:math';

import 'package:cv/shared/constants.dart';
import 'package:cv/shared/neon_widget.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  final ScrollController scrollController;
  const MainView(
    this.scrollController, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        duration: const Duration(seconds: 3),
        tween: Tween<double>(begin: 0, end: 1),
        builder: (context, double value, child) {
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: AlwaysStoppedAnimation(min(1, value * 3)),
              curve: Curves.fastOutSlowIn,
            ),
            child: Center(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(kContentPadding),
                  child: Row(
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
                                      value < 0.8 ? 0 : min(1, (value - 0.8) * 4)),
                                  child: Neon(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius:
                                          min(kMaxContentWidth, MediaQuery.of(context).size.width) /
                                              kMaxContentWidth *
                                              150.0,
                                      backgroundImage: const AssetImage(
                                          'assets/images/melih_hakan_pektas_small.jpg'),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20.0),
                            ],
                            FadeTransition(
                              opacity: AlwaysStoppedAnimation(
                                  value < 0.2 ? 0 : min(1, (value - 0.2) * 4)),
                              child: const Text(
                                'Hello, I\'m',
                                style: TextStyle(fontSize: 30.0),
                              ),
                            ),
                            FadeTransition(
                              opacity: AlwaysStoppedAnimation(
                                  value < 0.4 ? 0 : min(1, (value - 0.4) * 4)),
                              child: const Text(
                                'Melih Hakan Pektas',
                                style: TextStyle(fontSize: 50.0),
                              ),
                            ),
                            FadeTransition(
                              opacity: AlwaysStoppedAnimation(
                                  value < 0.6 ? 0 : min(1, (value - 0.6) * 4)),
                              child: const Text(
                                'I am a Mobile Application Developer mostly using Flutter with +2 years of experience',
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
                        )
                      ]
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
