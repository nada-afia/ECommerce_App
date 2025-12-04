import 'package:ecommerce/domain/entities/response/products/sub_category.dart';

import '../model/response/common/sub_category_dto.dart';
extension SubCategoryMapper on SubCategoryDto{
  SubCategory toSubCategory(){
    return SubCategory(
       slug: slug,
      id: id,
      category: category,
      name: name
    );
  }
}