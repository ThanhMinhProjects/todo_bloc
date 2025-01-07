import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/api/api_endpoints.dart';

@Injectable()
class ApiService {
  final String baseUrl = ApiEndpoints.baseUrl;

  // GET
  Future<Map<String, dynamic>> fetchData(String endpoint) async {
    try {
      final response = await http.get(Uri.parse(baseUrl + endpoint));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }

  // POST
  Future<Map<String, dynamic>> postData(
      String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        final data = json.decode(response.body);
        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  // PUT
  Future<Map<String, dynamic>> putData(
      String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await http.put(
        Uri.parse(baseUrl + endpoint),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body); // Trả về dữ liệu từ API
      } else {
        throw Exception('Failed to update data');
      }
    } catch (e) {
      rethrow;
    }
  }

  // DELETE
  Future<Map<String, dynamic>> deleteData(String endpoint) async {
    try {
      final response = await http.delete(Uri.parse(baseUrl + endpoint));

      if (response.statusCode == 200) {
        return json.decode(response.body); 
      } else {
        throw Exception('Failed to delete data');
      }
    } catch (e) {
      rethrow;
    }
  }

  // PATCH
  Future<Map<String, dynamic>> patchData(
      String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await http.patch(
        Uri.parse(baseUrl + endpoint),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body); // Trả về dữ liệu từ API
      } else {
        throw Exception('Failed to update data');
      }
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
