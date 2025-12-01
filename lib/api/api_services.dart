import 'package:dio/dio.dart';
import 'package:ecommerce/api/model/request/login_request_dto.dart';
import 'package:ecommerce/api/model/request/register_request_dto.dart';
import 'package:ecommerce/api/model/response/auth_response_dto.dart';
import 'package:ecommerce/api/model/response/brands/brands_response_dto.dart';
import 'package:ecommerce/api/model/response/category/category_response_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'end_points.dart';

part 'api_services.g.dart';

@RestApi(baseUrl:EndPoints.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(EndPoints.login)
  Future<AuthResponseDto> login(@Body() LoginRequestDto  loginRequest );
  @POST(EndPoints.register)
  Future<AuthResponseDto> register(@Body() RegisterRequestDto  registerRequest );
   @GET(EndPoints.getCategories)
  Future<CategoryResponseDto>getAllCategories();
  @GET(EndPoints.getBrands)
  Future<BrandsResponseDto>getAllBrands();
}
