import 'dart:async';

import 'package:flutter/material.dart';
import 'package:market/core/base/provider/base_provider.dart';
import 'package:market/core/constants/navigation/navigation_constants.dart';

class SplashProvider extends BaseProvider {
  int time = 0;
  Timer? _timer;
  bool _pageTimeIsDone = false;
  bool get pageTimeIsDone => _pageTimeIsDone;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      time++;
      if (time == 5) {
        _timer?.cancel();
        _pageTimeIsDone = true;
        notifyListeners();
        navigateHomePage();
        return;
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Timer'ı dispose et
    super.dispose();
  }

  void navigateHomePage() {
    if (_pageTimeIsDone == true) {
      navigation.navigateToPageClear(path: NavigationConstants.HOME);
    }
  }
}
