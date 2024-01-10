import 'package:flutter/material.dart';
import 'package:market/core/base/provider/base_provider.dart';
import 'package:market/core/constants/navigation/navigation_constants.dart';
import 'package:market/feature/product_detail/view/product_detail_view.dart';

class MarketProvider extends BaseProvider {
  void navigateDetailPage() {
    navigation.navigateToPage(path: NavigationConstants.PRODUCT_DETAIL);
  }
}
