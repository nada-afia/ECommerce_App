import 'package:ecommerce/api/mapper/add_cart_mapper.dart';
import 'package:ecommerce/api/model/response/cart/addcart/cart_response_dto.dart';
import 'package:ecommerce/domain/entities/response/cart/addcart/cart_response.dart';

extension CartMapper on CartResponseDto{
  CartResponse toCartResponse(){
    return CartResponse(
      data:data!.toAddCart(),
      cartId: cartId,
      message: message,
      numOfCartItems: numOfCartItems,
      status: status
    );
  }
}