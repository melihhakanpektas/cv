import 'package:flutter/material.dart';

class AnimatedRow extends StatelessWidget {
  const AnimatedRow({
    required this.ltr,
    required this.animation,
    required this.pngs,
    required this.repeatIndex,
    super.key,
  });
  final bool ltr;
  final double animation;
  final List<String> pngs;
  final int repeatIndex;

  @override
  Widget build(BuildContext context) {
    var newPngs = List<String>.from(pngs);
    if (ltr) {
      newPngs = newPngs.reversed.toList();
    }
    const pngWidth = 400.0;
    const pngHeight = 250;
    const padding = 50.0;
    final pngCountOnScreen = (MediaQuery.of(context).size.width ~/ pngWidth) + 2;
    return OverflowBox(
      alignment: ltr ? Alignment.centerLeft : Alignment.centerRight,
      maxWidth: pngCountOnScreen * pngWidth,
      child: Transform.translate(
        offset: Offset(
          ltr ? -animation * pngWidth : animation * pngWidth,
          0,
        ),
        child: Row(
          children: [
            for (int i = 0; i < pngCountOnScreen; i++)
              Container(
                width: pngWidth,
                padding: const EdgeInsets.symmetric(horizontal: padding),
                child: Image.asset(
                  ltr
                      ? newPngs[(i + repeatIndex) % newPngs.length]
                      : newPngs[(newPngs.length - 1 - i + repeatIndex) % newPngs.length],
                  height: pngHeight - padding * 2,
                  width: pngWidth - padding * 2,
                  fit: BoxFit.contain,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
