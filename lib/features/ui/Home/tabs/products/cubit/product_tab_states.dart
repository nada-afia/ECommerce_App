import '../../../../../../domain/entities/response/products/product.dart';
abstract class ProductTabStates {}
class ProductTabInitialState extends ProductTabStates{}
class ProductTabLoadingState extends ProductTabStates{}
class ProductSuccessState extends ProductTabStates{
  List<Product>? productList;
  ProductSuccessState({required this.productList});
}
class ProductErrorState extends ProductTabStates{
  String message;
  ProductErrorState({required this.message});
}
