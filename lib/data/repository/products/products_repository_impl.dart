import 'package:ecommerce/data/data_source/remote/products_remote_data_source.dart';
import 'package:ecommerce/domain/entities/response/products/product.dart';
import 'package:ecommerce/domain/repositories/products/product_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepository)
class ProductsRepositoryImpl implements ProductRepository{
  ProductsRemoteDataSource remoteDataSource;
  ProductsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<Product>?> getAllProducts() {
    return remoteDataSource.getAllProducts();
  }

}