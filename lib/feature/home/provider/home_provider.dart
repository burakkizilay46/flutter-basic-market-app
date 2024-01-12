import 'package:flutter/material.dart';
import 'package:market/feature/market/model/product_model.dart';

class HomeProvider extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  Map<ProductModel, int> basketProducts = {}; // Mükemmel bi kullanım!!!
  List<ProductModel> get basketItems => basketProducts.keys.toList();

  int get basketCount => basketProducts.length;

  void addToBasket(ProductModel product) {
    if (basketProducts[product] == null) {
      basketProducts[product] = 1;
      return;
    } else {
      basketProducts[product] = basketProducts[product]! + 1;
    }
    notifyListeners();
  }

  void removeToBasket(ProductModel product) {
    if (basketProducts[product] == null) {
      return;
    }
    if (basketProducts[product] == 1) {
      basketProducts.removeWhere((key, value) => key == product);
    } else {
      basketProducts[product] = basketProducts[product]! - 1;
    }
    notifyListeners();
  }

  double get basketTotalPrice {
    if (basketProducts.isEmpty) {
      return 0;
    } else {
      double _total = 0;
      basketProducts.forEach((key, value) {
        _total += (key.price! * value);
      });
      return _total;
    }
  }

  void setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}
