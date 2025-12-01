import 'package:dio/dio.dart';
import 'package:ecommerce/api/api_services.dart';
import 'package:ecommerce/api/mapper/category_mapper.dart';
import 'package:ecommerce/core/exceptions/app_exception.dart';
import 'package:ecommerce/data/data_source/remote/categories_remote_data_source.dart';
import 'package:ecommerce/domain/entities/response/common/category_or_brands.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:CategoriesRemoteDataSource)
class CategoriesRemoteDatasourceImpl implements CategoriesRemoteDataSource
{
ApiServices apiServices;
CategoriesRemoteDatasourceImpl({required this.apiServices});
  @override
  Future<List<CategoryOrBrands>?> getAllCategories()async {
   try{
    var categoriesResponse =await apiServices.getAllCategories();
    return categoriesResponse.data?.map((categoryDto) {
      return categoryDto.toCategory();
    }).toList();

   }on DioException catch(e){
     String message = (e.error as AppException).errorMessage;
throw ServerError(errorMessage: message);
   }
  }
}