import 'package:ecommerce/domain/entities/response/category/category_.dart';
import 'package:injectable/injectable.dart';

import '../repositories/categories/get_all_categories_repos.dart';
@injectable
class GetAllCategoriesUseCase{
  GetAllCategoriesRepository categoriesRepository;
  GetAllCategoriesUseCase({required this.categoriesRepository});
  Future<List<Category>?>invoke(){
    return categoriesRepository.getAllCategories();
  }

}