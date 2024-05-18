import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Neon extends StatelessWidget {
  const Neon({
    required this.child,
    super.key,
    this.sigma = 10,
  });
  final Widget child;
  final double sigma;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
          child: Padding(
            padding: EdgeInsets.all(sigma * 2.5),
            child: child,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(sigma * 2.5),
          child: child,
        ),
      ],
    );
  }
}
