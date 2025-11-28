import 'package:ecommerce/domain/repositories/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';
import '../entities/request/register_request.dart';
import '../entities/response/auth_response.dart';
@injectable
class RegisterUseCase{
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});
  
 Future<AuthResponse> invoke(RegisterRequest registerRequest){
   return authRepository.register(registerRequest);
  }
}