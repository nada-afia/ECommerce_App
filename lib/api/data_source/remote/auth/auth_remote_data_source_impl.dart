import 'package:ecommerce/api/api_services.dart';
import 'package:ecommerce/api/mapper/auth_response_mapper.dart';
import 'package:ecommerce/api/mapper/login_request_mapper.dart';
import 'package:ecommerce/api/mapper/register_request_mapper.dart';
import 'package:ecommerce/domain/entities/request/login_request.dart';

import 'package:ecommerce/domain/entities/request/register_request.dart';

import 'package:ecommerce/domain/entities/response/auth_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/data_source/remote/auth_remote_data_source.dart';
@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  ApiServices apiServices;
  AuthRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async {
     var authResponse= await apiServices.login(loginRequest.toLoginRequestDto());
  return authResponse.toAuthResponse();
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async {
    var authResponse= await apiServices.register(registerRequest.toRegisterRequestDto());
    return authResponse.toAuthResponse();
  }

}