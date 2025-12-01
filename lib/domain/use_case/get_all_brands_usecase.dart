
import 'package:ecommerce/domain/repositories/brands/get_all_brands_repos.dart';
import 'package:injectable/injectable.dart';

import '../entities/response/common/category_or_brands.dart';

@injectable
class GetAllBrandsUseCase{
  BrandsRepository  brandsRepository;
  GetAllBrandsUseCase({required this.brandsRepository});
  Future<List<CategoryOrBrands>?>invoke(){
    return brandsRepository.getAllBrands();
  }

}