import 'package:ecommerce/domain/entities/response/products/product.dart';

abstract class ProductRepository{
  Future<List<Product>?> getAllProducts();
}