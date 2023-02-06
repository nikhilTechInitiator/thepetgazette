import 'package:dio/dio.dart';

class ApiErrors {
  static String fromStatusCode(DioError dioError) {
    switch (dioError.response?.statusCode) {
      case 400:
        return 'Bad request.';
      case 401:
        return 'Authentication failed.';
      case 403:
        return 'The authenticated user is not allowed to access the specified API endpoint.';
      case 404:
        return 'The requested resource does not exist.';
      case 405:
        return 'Method not allowed. Please check the Allow header for the allowed HTTP methods.';
      case 415:
        return 'Unsupported media type. The requested content type or version number is invalid.';
      case 422:
        return dioError.response?.data?.toString() ?? "Data validation failed.";
      case 429:
        return 'Too many requests.';
      case 500:
        return dioError.response?.data?.toString() ?? 'Internal server error.';
      default:
        return 'Oops something went wrong!';
    }
  }
}
