import '../../entities/request/login_request.dart';
import '../../entities/request/register_request.dart';
import '../../entities/response/auth_response.dart';

abstract class  AuthRepository{
  Future<AuthResponse>login(LoginRequest loginRequest);
  Future<AuthResponse>register(RegisterRequest registerRequest);
}