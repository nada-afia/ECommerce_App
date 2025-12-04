import 'package:ecommerce/domain/entities/response/cart/getcart/get_cart.dart';

abstract class CartTabStates {}
class CartTabInitialState extends CartTabStates{}
class AddCartTabLoadingState extends CartTabStates{}
class AddCartSuccessState extends CartTabStates{
  int numOfCartItems;
  AddCartSuccessState ({required this.numOfCartItems});
}
class AddCartErrorState extends CartTabStates{
  String message;
  AddCartErrorState({required this.message});
}
class GetCartTabLoadingState extends CartTabStates{}
class GetCartSuccessState extends CartTabStates{
  GetCart getCart;
  GetCartSuccessState ({required this.getCart});
}
class GetCartErrorState extends CartTabStates{
  String message;
  GetCartErrorState({required this.message});
}
