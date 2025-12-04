import 'package:ecommerce/domain/entities/response/cart/addcart/cart_response.dart';

import '../../entities/response/cart/getcart/get_cart_response.dart';

abstract class CartRepository{
  Future<CartResponse> addCart(String productId);
  Future<GetCartResponse> getItemsCart();
}