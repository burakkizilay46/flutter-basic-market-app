import 'package:flutter/material.dart';
import 'package:market/core/navigation/navigation_service.dart';

class BaseProvider extends ChangeNotifier {
  NavigationService navigation = NavigationService.instance;
}
