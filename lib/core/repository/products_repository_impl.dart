import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../model/product_model.dart';
import 'products_repository.dart';

@LazySingleton(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  final Dio _dio = Dio();

  @override
  Future<List<Product>> fetchProducts() async {
    final response = await _dio.get('https://fakestoreapi.com/products');
    return (response.data as List)
        .map((json) => Product.fromJson(json))
        .toList();
  }
}
