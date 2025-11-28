import 'package:ecommerce/api/model/request/login_request_dto.dart';
import 'package:ecommerce/domain/entities/request/login_request.dart';

extension LoginRequestMapper on LoginRequest{
  LoginRequestDto  toLoginRequestDto(){
    return LoginRequestDto(
      email: email,
      password: password
    );
}
}

