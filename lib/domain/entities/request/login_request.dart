import 'package:ecommerce/api/model/request/login_request_dto.dart';

class LoginRequest{
  final String? email;
  final String? password;

  LoginRequest ({
    this.email,
    this.password,
  });


}


