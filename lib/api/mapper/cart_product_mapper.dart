import '../../domain/entities/response/cart/addcart/add_product.dart';
import '../model/response/cart/addcart/add_product_dto.dart';

extension CartProductMapper on AddProductDto{
  AddProduct toAddProduct(){
    return AddProduct(
        id:id,
      price: price,
      count: count,
      product: product
    );
  }
}