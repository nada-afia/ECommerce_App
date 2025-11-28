import 'package:dio/dio.dart';
import 'package:ecommerce/api/api_services.dart';
import 'package:ecommerce/api/dio/dio_interceptors.dart';
import 'package:ecommerce/api/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class GitItModule{
 @singleton
 @injectable
 BaseOptions providerBaseOptions(){
   return BaseOptions(
     baseUrl: EndPoints.baseUrl,
     receiveDataWhenStatusError: true,
     connectTimeout: Duration(seconds: 20),
     receiveTimeout: Duration(seconds: 20)
   );
 }
 @singleton
 @injectable
 PrettyDioLogger providePrettyDioLogger(){
 return PrettyDioLogger(
   request: true,
   requestBody: true,
   responseBody: true,
   requestHeader: true,
   responseHeader: true,
   error: true
 );
 }
 Dio provideDio(BaseOptions baseOptions, PrettyDioLogger prettyDioLogger){
   var dio=Dio(baseOptions);
   dio.interceptors.add(DioInterceptor());
   dio.interceptors.add(prettyDioLogger);
   return dio;
 }
 @singleton
 @injectable
 ApiServices provideApiServices(Dio dio)=>ApiServices(dio);
}