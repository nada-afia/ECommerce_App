import 'package:ecommerce/data/data_source/remote/cart_remote_data_sourcw.dart';
import 'package:ecommerce/domain/entities/response/cart/addcart/cart_response.dart';
import 'package:ecommerce/domain/entities/response/cart/getcart/get_cart_response.dart';
import 'package:ecommerce/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository{
  CartRemoteDataSource remoteDataSource;
  CartRepositoryImpl({required this.remoteDataSource});
  @override
  Future<CartResponse> addCart(String productId) {
    return remoteDataSource.addCart(productId);
  }

  @override
  Future<GetCartResponse> getItemsCart() {
    return remoteDataSource.getItemsCart();
  }

}