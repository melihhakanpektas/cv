import 'package:cv/features/home/home_view.dart';
import 'package:flutter/material.dart';

class RouteUtils {
  static get home => const HomeView();
  static Map<String, Widget Function(BuildContext)> get routes {
    return {
      '/': (context) => const HomeView(),
    };
  }
}
