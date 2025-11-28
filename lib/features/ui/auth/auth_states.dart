import 'package:ecommerce/domain/entities/response/auth_response.dart';

abstract class AuthStates{}
//or sealed y3ny locked
class AuthLoadingState extends AuthStates{}
class AuthErrorState extends AuthStates{
  String errorMessage;
  AuthErrorState({required this.errorMessage});
}
class AuthSuccessState extends AuthStates{
  AuthResponse authResponse;
  AuthSuccessState({required this.authResponse});

}
