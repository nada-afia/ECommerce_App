import 'package:ecommerce/domain/entities/response/cart/addcart/cart_response.dart';
import '../../../domain/entities/response/cart/getcart/get_cart_response.dart';

abstract class CartRemoteDataSource {
  Future<CartResponse> addCart(String productId);
  Future<GetCartResponse> getItemsCart();
}