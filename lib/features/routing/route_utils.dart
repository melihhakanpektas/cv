import 'package:flutter/material.dart';
import 'package:melihhakanpektas/features/home/home_view.dart';

class RouteUtils {
  static HomeView get home => const HomeView();
  static Map<String, Widget Function(BuildContext)> get routes {
    return {
      '/': (context) => const HomeView(),
    };
  }
}
