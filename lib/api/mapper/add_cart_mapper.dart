import 'package:ecommerce/api/mapper/cart_product_mapper.dart';
import '../../domain/entities/response/cart/addcart/add_cart.dart';
import '../model/response/cart/addcart/add_cart_dto.dart';

extension AddCartMapper on AddCartDto{
  AddCart toAddCart(){
    return AddCart(
   createdAt: createdAt,
      updatedAt: updatedAt,
        id: id,
      cartOwner: cartOwner,
      products: products?.map((product)=>product.toAddProduct()).toList()??[],
      totalCartPrice: totalCartPrice,
      v: v
    );
  }
}