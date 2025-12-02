import 'package:ecommerce/domain/entities/response/products/product.dart';
import 'package:ecommerce/domain/repositories/products/product_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetAllProductsUseCase{
  ProductRepository productRepository;
  GetAllProductsUseCase({required this.productRepository});
  Future<List<Product>?>invoke(){
    return productRepository.getAllProducts();
  }

}