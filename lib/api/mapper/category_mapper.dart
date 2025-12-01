import 'package:ecommerce/domain/entities/response/common/category_or_brands.dart';
import '../model/response/common/category_or_brand_dto.dart';

extension CategoryMapper on CategoryOrBrandDto{
  CategoryOrBrands toCategory(){
    return CategoryOrBrands(
      image: image,
      id: id,
      slug: slug,
      name: name
    );
  }
}