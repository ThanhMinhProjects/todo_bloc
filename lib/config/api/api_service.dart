import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:todo_bloc/config/api/api_endpoints.dart';
import 'package:todo_bloc/config/api/api_response_mixin.dart';
import 'package:todo_bloc/core/services/share_pref_service.dart';

@Injectable()
class ApiService {
  final String baseUrl = ApiEndpoints.baseUrl;
  final SharePrefService _sharePrefService;
  static final httpLog = HttpWithMiddleware.build(middlewares: [
    HttpLogger(logLevel: LogLevel.BODY),
  ]);
  ApiService(this._sharePrefService);

  // GET
  Future<http.Response> fetchData(String endpoint) async {
    try {
      final response = await httpLog.get(Uri.parse(baseUrl + endpoint));

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // POST
  Future<http.Response> postData(
      String endpoint, Map<String, dynamic> body) async {
    try {
      final String? token = await _sharePrefService.getToken();
      final response = await httpLog.post(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(body),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // PUT
  Future<http.Response> putData(
      String endpoint, Map<String, dynamic> body) async {
    try {
      final String? token = await _sharePrefService.getToken();
      final response = await httpLog.put(
        Uri.parse(baseUrl + endpoint),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(body),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // DELETE
  Future<http.Response> deleteData(String endpoint) async {
    try {
      final response = await httpLog.delete(Uri.parse(baseUrl + endpoint));

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // PATCH
  Future<http.Response> patchData(
      String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await httpLog.patch(
        Uri.parse(baseUrl + endpoint),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 6. Upload File (POST)
  Future<void> uploadFile(String endpoint, File file) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse(baseUrl + endpoint));
      request.headers.addAll({'Content-Type': 'multipart/form-data'});

      // Tạo một phần để upload file
      var multipartFile = await http.MultipartFile.fromPath(
        'file', // Tên trường trong API
        file.path,
        contentType: MediaType('application', 'octet-stream'),
      );

      request.files.add(multipartFile);

      var response = await request.send();

      if (response.statusCode == 200) {
        print('File uploaded successfully');
      } else {
        throw Exception('Failed to upload file');
      }
    } catch (e) {
      rethrow;
    }
  }
}
