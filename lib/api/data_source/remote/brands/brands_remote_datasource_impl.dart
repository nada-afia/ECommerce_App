
import 'package:dio/dio.dart';
import 'package:ecommerce/api/mapper/category_mapper.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/app_exception.dart';
import '../../../../data/data_source/remote/brands_remote_data_source.dart';
import '../../../../domain/entities/response/common/category_or_brands.dart';
import '../../../api_services.dart';
@Injectable(as: BrandsRemoteDataSource)
class BrandsRemoteDatasourceImpl implements BrandsRemoteDataSource
{
ApiServices apiServices;
BrandsRemoteDatasourceImpl({required this.apiServices});
@override
  Future<List<CategoryOrBrands>?> getAllBrands() async {
    try{
      var brandsResponse =await apiServices.getAllBrands();
      return brandsResponse.data?.map((categoryDto) {
        return categoryDto.toCategory();
      }).toList();

    }on DioException catch(e){
      String message = (e.error as AppException).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}