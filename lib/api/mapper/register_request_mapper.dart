import '../../domain/entities/request/register_request.dart';
import '../model/request/register_request_dto.dart';

extension RegisterRequestMapper on RegisterRequest{
  RegisterRequestDto toRegisterRequestDto(){
    return RegisterRequestDto(
        password: password,
        rePassword: rePassword,
        email: email,
        name:name,
        phone: phone
    );
  }
}