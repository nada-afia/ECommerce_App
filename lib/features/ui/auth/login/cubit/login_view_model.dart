import 'package:dio/dio.dart';
import 'package:ecommerce/core/exceptions/app_exception.dart';
import 'package:ecommerce/domain/entities/request/login_request.dart';
import 'package:ecommerce/domain/use_case/login_use_case.dart';
import 'package:ecommerce/features/ui/auth/auth_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginViewModel extends Cubit<AuthStates>{
  LoginUseCase loginUseCase;
  LoginViewModel({required this.loginUseCase}):super(AuthLoadingState());
  var formKey = GlobalKey<FormState>();
    Future<void> login(String password,String email) async {
      try{
        if(formKey.currentState?.validate()==true){
          emit(AuthLoadingState());
          LoginRequest loginRequest = LoginRequest(
            password: password,
            email:email ,
          );
          var authResponse =await loginUseCase.invoke(loginRequest);
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