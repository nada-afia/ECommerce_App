import 'package:ecommerce/api/mapper/product_mapper.dart';
import 'package:ecommerce/api/model/response/cart/get_cart/get_product_dto.dart';
import 'package:ecommerce/domain/entities/response/cart/getcart/get_product.dart';

extension GetProductMapper on GetProductDto{
  GetProduct toGetProduct(){
    return GetProduct(
      price: price,
      count: count,
      product: product!.toProducts(),
      Id: Id
    );
  }
}