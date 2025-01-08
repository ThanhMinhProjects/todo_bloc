// class ApiResponse {
//   final int statusCode;
//   final bool success;
//   final String message;
//   final dynamic body;
//   ApiResponse({
//     required this.statusCode,
//     required this.success,
//     required this.message,
//     required this.body,
//   });

//   factory ApiResponse.fromJson(Map<String, dynamic> json) {
//     return ApiResponse(
//       statusCode: json['status_code'] ?? 0,
//       success: json['success'] ?? false,
//       message: json['message'] ?? '',
//       body: json['body'],
//     );
//   }
// }
