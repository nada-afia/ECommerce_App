import 'package:ecommerce/domain/entities/response/common/category_or_brands.dart';

abstract class BrandsRepository{
  Future<List<CategoryOrBrands>?> getAllBrands();
}