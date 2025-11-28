class AppException implements Exception{
  String errorMessage;
  int? statusCode;
  AppException({required this.errorMessage,this.statusCode});
}
class ServerError extends AppException{
  ServerError({required super.errorMessage,super.statusCode});
}
class NetworkError extends AppException{
  NetworkError({required super.errorMessage,super.statusCode});
}
class UnExpectedError extends AppException{
  UnExpectedError({required super.errorMessage,super.statusCode});
}