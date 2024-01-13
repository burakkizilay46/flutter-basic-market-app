import 'package:dio/dio.dart';
import 'package:market/core/constants/service/service_constants.dart';
import 'package:market/feature/market/model/product_model.dart';

class ProductService {
  Dio dio = Dio();

  Future<List<ProductModel>> getDatas() async {
    final response = await dio.get(ServiceConstants.productBaseUrl);

    if (response.statusCode == 200) {
      final responseBody = (response.data as List).map((productData) => ProductModel.fromJson(productData)).toList();
      return responseBody;
    }
    throw Exception();
  }
}
