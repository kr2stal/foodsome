class NetworkException implements Exception {
  String message;
  int statusCode;

  NetworkException({required this.message, required this.statusCode});
}

// class AuthException extends NetworkException {
//   AuthException({message, statusCode}) : super(message: message as String, statusCode: statusCode as int);
// }
