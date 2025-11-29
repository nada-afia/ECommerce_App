import 'package:ecommerce/data/data_source/remote/categories_remote_data_source.dart';
import 'package:ecommerce/domain/entities/response/category/category_.dart';
import 'package:ecommerce/domain/repositories/categories/get_all_categories_repos.dart';import 'package:injectable/injectable.dart';
@Injectable(as: GetAllCategoriesRepository)
class CategoriesRepositoryImpl implements GetAllCategoriesRepository{
  CategoriesRemoteDataSource remoteDataSource;
  CategoriesRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<Category>?> getAllCategories() {
    return  remoteDataSource.getAllCategories();
  }

}