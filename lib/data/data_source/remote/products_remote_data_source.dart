import '../../../domain/entities/response/products/product.dart';

abstract class ProductsRemoteDataSource {
  Future<List<Product>?> getAllProducts();
}
