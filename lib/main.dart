import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melihhakanpektas/features/routing/route_utils.dart';
import 'package:melihhakanpektas/shared/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      title: 'Melih Hakan Pektas',
      routes: RouteUtils.routes,
      initialRoute: '/',
    );
  }

  ThemeData appTheme() {
    return ThemeData(
      fontFamily: GoogleFonts.lato().fontFamily,
      brightness: Brightness.dark,
      colorSchemeSeed: kMainColor,
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
