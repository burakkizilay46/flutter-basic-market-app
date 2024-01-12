import 'package:flutter/material.dart';
import 'package:market/feature/market/model/product_model.dart';

class HomeProvider extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  final List<ProductModel> _basketProducts = [];
  List<ProductModel> get basketProducts => _basketProducts;

  int get basketCount => _basketProducts.length;

  void addToBasket(ProductModel product) {
    _basketProducts.add(product);
    notifyListeners();
  }

  void setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}
