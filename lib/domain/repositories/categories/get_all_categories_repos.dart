import 'package:ecommerce/domain/entities/response/category/category_.dart';

abstract class GetAllCategoriesRepository{
  Future<List<Category>?> getAllCategories();
}