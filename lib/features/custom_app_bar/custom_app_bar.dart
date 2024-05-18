import 'package:flutter/material.dart';
import 'package:melihhakanpektas/shared/constants.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    String? fontFamily,
    List<Widget>? actions,
    VoidCallback? titleOnTap,
    super.key,
    super.backgroundColor,
  }) : super(
          actions: <Widget>[
            Container(),
          ],
          automaticallyImplyLeading: false,
          title: SizedBox(
            width: 1200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kContentPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: InkWell(
                        onTap: titleOnTap,
                        child: Text(
                          'Melih Hakan Pektas',
                          style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: 25,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.5,
                            shadows: const [
                              Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  if (actions != null)
                    Row(
                      children: actions,
                    ),
                ],
              ),
            ),
          ),
          centerTitle: true,
        );
}
