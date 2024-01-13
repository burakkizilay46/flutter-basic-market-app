import 'package:market/core/base/provider/base_provider.dart';
import 'package:market/core/constants/navigation/navigation_constants.dart';
import 'package:market/core/service/product_service.dart';
import 'package:market/feature/market/model/product_model.dart';

class MarketProvider extends BaseProvider {
  late List<ProductModel> _products = [];
  List get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  MarketProvider() {
    fetchProductsData();
  }

  Future<void> fetchProductsData() async {
    try {
      _isLoading = true;
      notifyListeners();
      _products = await ProductService().getDatas();
    } catch (e) {
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void navigateDetailPage(ProductModel data) {
    navigation.navigateToPage(path: NavigationConstants.PRODUCT_DETAIL, data: data);
  }
}
