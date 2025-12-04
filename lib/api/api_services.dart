import 'package:dio/dio.dart';
import 'package:ecommerce/api/model/request/add_product_request_dto.dart';
import 'package:ecommerce/api/model/request/login_request_dto.dart';
import 'package:ecommerce/api/model/request/register_request_dto.dart';
import 'package:ecommerce/api/model/response/auth_response_dto.dart';
import 'package:ecommerce/api/model/response/brands/brands_response_dto.dart';
import 'package:ecommerce/api/model/response/cart/get_cart/get_cart_response_dto.dart';
import 'package:ecommerce/api/model/response/category/category_response_dto.dart';
import 'package:ecommerce/api/model/response/products/products_response_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'end_points.dart';
import 'model/response/cart/addcart/cart_response_dto.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(EndPoints.login)
  Future<AuthResponseDto> login(@Body() LoginRequestDto loginRequest);
  @POST(EndPoints.register)
  Future<AuthResponseDto> register(@Body() RegisterRequestDto registerRequest);
  @GET(EndPoints.getCategories)
  Future<CategoryResponseDto> getAllCategories();
  @GET(EndPoints.getBrands)
  Future<BrandsResponseDto> getAllBrands();
  @GET(EndPoints.getProducts)
  Future<ProductsResponseDto> getAllProducts();
  @POST(EndPoints.addCart)
  Future<CartResponseDto> addToCart(
      @Body() AddProductRequestDto productRequest,
      @Header('token') String token
      );
  @GET(EndPoints.addCart)
  Future<GetCartResponseDto> getItemInCart(
      @Header('token') String token
      );
}
