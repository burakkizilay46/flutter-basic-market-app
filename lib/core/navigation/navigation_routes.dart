import 'package:flutter/material.dart';
import 'package:market/core/constants/navigation/navigation_constants.dart';
import 'package:market/core/navigation/navigation_exception.dart';
import 'package:market/feature/home/view/home_view.dart';
import 'package:market/feature/market/model/product_model.dart';
import 'package:market/feature/product_detail/view/product_detail_view.dart';
import 'package:market/feature/splash/view/splash_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashView());
      case NavigationConstants.HOME:
        return normalNavigate(const HomeView());
      case NavigationConstants.PRODUCT_DETAIL:
        if (args.arguments is ProductModel) {
          return normalNavigate(ProductDetailView(product: args.arguments as ProductModel));
        }
        throw NavigateException<String>(args.arguments);
      default:
        return normalNavigate(const SplashView());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
