import 'package:ecommerce/api/mapper/user_response_mapper.dart';

import '../../core/exceptions/app_exception.dart';
import '../../domain/entities/response/auth_response.dart';
import '../model/response/auth_response_dto.dart';

extension AuthResponseMapper on AuthResponseDto{
  AuthResponse toAuthResponse(){
    if(token!=null||token!.isNotEmpty||user!=null){
      return AuthResponse(
        message:message,
        user:user?.toUserResponse(),
        token: token,
      );
    }
    else{
      throw ServerError(errorMessage: 'Failed Authentication');
    }
  }
}