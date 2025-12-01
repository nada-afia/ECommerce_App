import 'package:ecommerce/domain/entities/response/common/category_or_brands.dart';
import 'package:injectable/injectable.dart';

import '../repositories/categories/get_all_categories_repos.dart';
@injectable
class GetAllCategoriesUseCase{
  GetAllCategoriesRepository categoriesRepository;
  GetAllCategoriesUseCase({required this.categoriesRepository});
  Future<List<CategoryOrBrands>?>invoke(){
    return categoriesRepository.getAllCategories();
  }

}