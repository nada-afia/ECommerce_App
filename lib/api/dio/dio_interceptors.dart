import 'package:dio/dio.dart';
import 'package:ecommerce/core/exceptions/app_exception.dart';

class DioInterceptor extends Interceptor{
  void onError(DioException err,ErrorInterceptorHandler handler) {
    AppException exception;
    final responseData = err.response?.data;
    String message = 'something went wrong';
    if(responseData is Map){
      message =(responseData['errors']?['msg'] as String?)??
          (responseData['message']as String?)??
    message;
    }
    if(err.type ==DioExceptionType.connectionError||
        err.type == DioExceptionType.connectionTimeout){
      exception = NetworkError(errorMessage: 'No Internet connection');

    }
    else if(err.response?.statusCode!= null){
      exception =ServerError(errorMessage:message,statusCode: err.response?.statusCode);
    }
    else{
      exception = UnExpectedError(errorMessage: message);
    }
    handler.next(DioException(
        requestOptions: err.requestOptions,error: exception
    )
    );
  }
}