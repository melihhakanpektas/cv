import 'package:cv/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    String? fontFamily,
    List<Widget>? actions,
    super.key,
    super.backgroundColor,
  }) : super(
          actions: <Widget>[
            Container(),
          ],
          automaticallyImplyLeading: false,
          title: SizedBox(
            width: 1200.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kContentPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Melih Hakan Pektas',
                        style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 25,
                          fontFamily: GoogleFonts.orbitron().fontFamily!,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.5,
                          shadows: const [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 2.0,
                            ),
                          ],
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
