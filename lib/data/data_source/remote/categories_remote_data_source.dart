import 'package:ecommerce/domain/entities/response/category/category_.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<Category>?> getAllCategories();
}
