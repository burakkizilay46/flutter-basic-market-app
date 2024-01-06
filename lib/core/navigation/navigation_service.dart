import 'package:flutter/material.dart';
import 'package:market/core/navigation/INavigationService.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatiorKey = GlobalKey();
  bool removeOldRoutes(Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({String? path, Object? data}) async {
    await navigatiorKey.currentState!.pushNamed(path!, arguments: data);
  }

  @override
  Future<void> navigateToPageClear({String? path, Object? data}) async {
    await navigatiorKey.currentState!.pushNamedAndRemoveUntil(path!, removeOldRoutes, arguments: data);
  }

  @override
  Future<void> pop() async {
    await navigatiorKey.currentState!.maybePop();
  }
}
