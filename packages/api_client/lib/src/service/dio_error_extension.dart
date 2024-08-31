import 'package:dio/dio.dart';

extension DioErrorExtension on DioException {
String handleDioError() {
  switch (type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return "Timeout occurred while sending or receiving";
    case DioExceptionType.badResponse:
      final statusCode = response?.statusCode;
      if (statusCode != null) {
        switch (statusCode) {
          case 400:
            return "Bad Request";
          case 401:
          case 403:
            return "Unauthorized";
          case 404:
            return "Not Found";
          case 409:
            return 'Conflict';
          case 500:
            return "Internal Server Error";
        }
      }
      break;
    case DioExceptionType.cancel:
      break;
    case DioExceptionType.unknown:
      return "No Internet Connection";
    case DioExceptionType.badCertificate:
      return "Internal Server Error";
    case DioExceptionType.connectionError:
      return "Connection Error";
    default:
      return "Unknown Error";
  }
  return "Unknown Error";
}

}