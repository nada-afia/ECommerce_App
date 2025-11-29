import 'package:ecommerce/api/model/response/category/category_dto.dart';
import 'package:ecommerce/domain/entities/response/category/category_.dart';

extension CategoryMapper on CategoryDto{
  Category toCategory(){
    return Category(
      image: image,
      id: id,
      slug: slug,
      name: name
    );
  }
}