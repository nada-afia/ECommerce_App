import 'package:ecommerce/domain/entities/response/cart/addcart/cart_response.dart';
import 'package:ecommerce/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';
 @injectable
class AddToCartUseCase{
  CartRepository cartRepository;
  AddToCartUseCase({required this.cartRepository});
  Future<CartResponse> invoke(String productId){
    return cartRepository.addCart(productId);
  }
}