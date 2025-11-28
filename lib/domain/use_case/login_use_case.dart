import 'package:ecommerce/domain/repositories/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';
import '../entities/request/login_request.dart';
import '../entities/response/auth_response.dart';
@injectable
class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});
  
 Future<AuthResponse> invoke(LoginRequest loginRequest){
   return authRepository.login(loginRequest);
  }
}