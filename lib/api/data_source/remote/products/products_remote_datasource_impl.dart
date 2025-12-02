
import 'package:dio/dio.dart';
import 'package:ecommerce/api/mapper/product_mapper.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/exceptions/app_exception.dart';
import '../../../../data/data_source/remote/products_remote_data_source.dart';
import '../../../../domain/entities/response/products/product.dart';
import '../../../api_services.dart';

@Injectable(as: ProductsRemoteDataSource)
class ProductsRemoteDatasourceImpl implements ProductsRemoteDataSource
{
ApiServices apiServices;
ProductsRemoteDatasourceImpl({required this.apiServices});
@override
Future<List<Product>?> getAllProducts() async {
    try{
      var productsResponse =await apiServices.getAllProducts();
      return productsResponse.data?.map((productDto){
        return productDto.toProducts();
      }).toList() ?? [];




    }on DioException catch(e){
      String message = (e.error as AppException).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}