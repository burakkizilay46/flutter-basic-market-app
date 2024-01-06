import 'package:flutter/material.dart';

class BaseProvider<T> extends ChangeNotifier {
  T _data;

  BaseProvider(this._data);

  T get data => _data;

  void updateData(T newData) {
    _data = newData;
    notifyListeners();
  }
}
