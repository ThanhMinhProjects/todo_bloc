import 'package:dio/dio.dart';
import 'package:todo_bloc/core/api/dio_client.dart';

class ApiService {
  final DioClient _dioClient;

  ApiService(this._dioClient);

  // GET request
  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dioClient.dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // POST request
  Future<Response> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dioClient.dio.post(
        endpoint,
        data: data,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // PUT request
  Future<Response> put(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dioClient.dio.put(
        endpoint,
        data: data,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // DELETE request
  Future<Response> delete(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dioClient.dio.delete(
        endpoint,
        data: data,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Handle errors globally
  dynamic _handleError(DioException error) {
    // You can customize error handling as needed
    if (error.type == DioExceptionType.connectionTimeout) {
      return 'Connection Timeout';
    } else if (error.type == DioExceptionType.receiveTimeout) {
      return 'Receive Timeout';
    } else if (error.type == DioExceptionType.badResponse) {
      return 'Received Invalid Status Code: ${error.response?.statusCode}';
    } else if (error.type == DioExceptionType.cancel) {
      return 'Request Cancelled';
    } else {
      return 'Unexpected Error: ${error.message}';
    }
  }
}
