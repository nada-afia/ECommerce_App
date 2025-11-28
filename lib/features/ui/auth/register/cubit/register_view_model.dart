import 'package:dio/dio.dart';
import 'package:ecommerce/core/exceptions/app_exception.dart';
import 'package:ecommerce/domain/entities/request/login_request.dart';
import 'package:ecommerce/domain/entities/request/register_request.dart';
import 'package:ecommerce/domain/use_case/login_use_case.dart';
import 'package:ecommerce/features/ui/auth/auth_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/use_case/register_use_case.dart';
@injectable
class RegisterViewModel extends Cubit<AuthStates>{
  RegisterUseCase registerUseCase;
  RegisterViewModel({required this.registerUseCase}):super(AuthLoadingState());
  var formKey = GlobalKey<FormState>();
    Future<void> register(
        {
   required String name,
   required String email,
   required String password,
   required String rePassword, required String phone,
  }) async {
      try{
        if(formKey.currentState?.validate()==true){
          emit(AuthLoadingState());
          RegisterRequest registerRequest = RegisterRequest(
            password: password,
            email:email ,
            name: name,
            phone: phone,
            rePassword: rePassword,
          );
          var authResponse =await registerUseCase.invoke(registerRequest);
          emit(AuthSuccessState(authResponse: authResponse));
        }
      }on AppException catch(e){
        emit(AuthErrorState(errorMessage: e.errorMessage));
      }on DioException catch(e){
        final message =(e.error is AppException)?
        (e.error as AppException).errorMessage:
            'unExpected Error';
        emit(AuthErrorState(errorMessage:message ));
      }
    }
}