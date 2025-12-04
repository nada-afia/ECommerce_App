import 'package:ecommerce/api/mapper/category_mapper.dart';
import 'package:ecommerce/api/mapper/sub_category_mapper.dart';
import 'package:ecommerce/api/model/response/common/products_dto.dart';
import 'package:ecommerce/domain/entities/response/products/product.dart';
extension ProductMapper on ProductDto{
  Product toProducts(){
    return Product(
       slug: slug,
      id: id,
     description: description,
      category: category!.toCategory(),
      updatedAt: updatedAt,
      subcategory: subcategory?.map((s) => s.toSubCategory()).toList() ?? [],
      sold: sold,
      ratingsQuantity: ratingsQuantity,
      ratingsAverage: ratingsAverage,
      quantity: quantity,
      price: price,
      images: images,
      imageCover: imageCover,
      createdAt: createdAt,
      brand:brand!.toCategory(),
      title: title

    );
  }
}