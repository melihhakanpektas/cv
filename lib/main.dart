import 'package:cv/features/routing/route_utils.dart';
import 'package:cv/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      routes: RouteUtils.routes,
      initialRoute: '/',
    );
  }

  ThemeData appTheme() {
    return ThemeData(
      fontFamily: GoogleFonts.lato().fontFamily,
      brightness: Brightness.dark,
      colorSchemeSeed: kMainColor,
      scaffoldBackgroundColor: kMainColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: kMainColor,
        elevation: 0.0,
      ),
    );
  }
}
