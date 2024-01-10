import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:market/feature/market/model/product_model.dart';

class HomeProvider extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  void setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}
