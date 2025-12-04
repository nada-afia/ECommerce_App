import 'package:dio/dio.dart';
import 'package:ecommerce/api/api_services.dart';
import 'package:ecommerce/api/mapper/cart_mapper.dart';
import 'package:ecommerce/api/mapper/get_cart_mapper.dart';
import 'package:ecommerce/api/model/request/add_product_request_dto.dart';
import 'package:ecommerce/core/cach/shared_preferences.dart';
import 'package:ecommerce/domain/entities/response/cart/addcart/cart_response.dart';
import 'package:ecommerce/domain/entities/response/cart/getcart/get_cart_response.dart';
import 'package:injectable/injectable.dart';

import '../../../core/exceptions/app_exception.dart';
import '../../../data/data_source/remote/cart_remote_data_sourcw.dart';
@Injectable(as: CartRemoteDataSource )
class CartRemoteDataSourceImpl implements CartRemoteDataSource{
  ApiServices apiServices;
  CartRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<CartResponse> addCart(String productId) async {
    try{
      AddProductRequestDto productRequest=AddProductRequestDto(productId: productId??'');
      String ?token =SharedPreferencesUtils.getData(key: 'token') as String;
      var addCartResponse =await apiServices.addToCart(productRequest, token??'');
        return addCartResponse.toCartResponse();
    }on DioException catch(e){
      String message = (e.error as AppException).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }

  @override
  Future<GetCartResponse> getItemsCart() async {
    try{
      String ?token =SharedPreferencesUtils.getData(key: 'token') as String;
      var getCartResponse =await apiServices.getItemInCart( token ?? '');
      return getCartResponse.toGetCartResponse();
    }on DioException catch(e){
      String message = (e.error as AppException).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
  
}