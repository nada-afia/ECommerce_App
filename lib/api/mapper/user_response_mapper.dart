import '../../domain/entities/response/user_response.dart';
import '../model/response/user_response_dto.dart';

extension UserDtoMapper on UserResponseDto{
  User toUserResponse(){
    return User(
        email: email,
        name: name,
        role: role
    );
  }
}