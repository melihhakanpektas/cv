import 'dart:ui';

import 'package:flutter/material.dart';

class Neon extends StatelessWidget {
  final Widget child;
  final double sigma;
  const Neon({required this.child, this.sigma = 10, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ImageFiltered(imageFilter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma), child: child),
        child,
      ],
    );
  }
}
