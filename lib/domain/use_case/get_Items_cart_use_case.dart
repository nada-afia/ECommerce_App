import 'package:ecommerce/domain/entities/response/cart/getcart/get_cart_response.dart';
import 'package:ecommerce/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';
 @injectable
class GetItemsCartUseCase{
  CartRepository cartRepository;
  GetItemsCartUseCase({required this.cartRepository});
  Future<GetCartResponse> invoke(){
    return cartRepository.getItemsCart();
  }
}