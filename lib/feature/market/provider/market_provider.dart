import 'package:dio/dio.dart';
import 'package:market/core/base/provider/base_provider.dart';
import 'package:market/core/constants/navigation/navigation_constants.dart';
import 'package:market/feature/market/model/product_model.dart';

class MarketProvider extends BaseProvider {
  late List<ProductModel> _products = [];
  List get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  MarketProvider() {
    getDatas();
  }

  Future<void> getDatas() async {
    _isLoading = true;
    notifyListeners();

    try {
      final dio = Dio();
      final response = await dio.get('https://fakestoreapi.com/products');

      if (response.statusCode == 200) {
        _products = (response.data as List).map((productData) => ProductModel.fromJson(productData)).toList();
        notifyListeners();
      } else {
        print('Failed to fetch products. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching products: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void navigateDetailPage(ProductModel data) {
    navigation.navigateToPage(path: NavigationConstants.PRODUCT_DETAIL, data: data);
  }
}
