import 'package:ecommerce/api/mapper/cart_product_mapper.dart';
import 'package:ecommerce/api/mapper/get_cart_data_mapper.dart';
import 'package:ecommerce/api/model/response/cart/get_cart/get_cart_response_dto.dart';
import '../../domain/entities/response/cart/addcart/add_cart.dart';
import '../../domain/entities/response/cart/getcart/get_cart_response.dart';
import '../model/response/cart/addcart/add_cart_dto.dart';

extension GetCartMapper on GetCartResponseDto{
  GetCartResponse toGetCartResponse(){
    return GetCartResponse(
      status: status,
      numOfCartItems: numOfCartItems,
      cartId: cartId,
      data: data!.toGetCart(),
    );
  }
}