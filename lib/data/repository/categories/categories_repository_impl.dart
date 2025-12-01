import 'package:ecommerce/data/data_source/remote/categories_remote_data_source.dart';
import 'package:ecommerce/domain/entities/response/common/category_or_brands.dart';
import 'package:ecommerce/domain/repositories/categories/get_all_categories_repos.dart';import 'package:injectable/injectable.dart';
@Injectable(as: GetAllCategoriesRepository)
class CategoriesRepositoryImpl implements GetAllCategoriesRepository{
  CategoriesRemoteDataSource remoteDataSource;
  CategoriesRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<CategoryOrBrands>?> getAllCategories() {
    return  remoteDataSource.getAllCategories();
  }

}