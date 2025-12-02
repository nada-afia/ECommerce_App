import 'package:ecommerce/api/model/response/products/sub_category_dto.dart';
import 'package:ecommerce/domain/entities/response/products/sub_category.dart';
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