import 'package:ecommerce/domain/entities/response/cart/getcart/get_cart.dart';
import '../model/response/cart/get_cart/get_cart_dto.dart';
import 'package:ecommerce/api/mapper/get_product_mapper.dart';
extension GetCartDataMapper on GetCartDto{
  GetCart toGetCart(){
    return GetCart(
      v: v,
      totalCartPrice: totalCartPrice,
      products: products?.map((products)=> products.toGetProduct()).toList() ??[],
      cartOwner: cartOwner,
      id: id,
    );
  }
}