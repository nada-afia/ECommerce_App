import 'package:ecommerce/domain/entities/response/user_response.dart';
class AuthResponse {
  final String? message;
  final User? user;
  final String? token;

  AuthResponse({
    this.message,
    this.user,
    this.token,
  });
}
