import 'package:flutter/material.dart';
import 'package:market/core/constants/navigation/navigation_constants.dart';
import 'package:market/feature/home/view/home_view.dart';
import 'package:market/feature/splash/view/splash_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashView());
      default:
        return normalNavigate(const HomeView());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
