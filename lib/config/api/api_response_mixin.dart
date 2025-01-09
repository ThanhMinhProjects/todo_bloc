// {
//   "status_code": 200,
//   "success": true,
//   "message": "success",
//   "body": {
//     "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NzdmNjMyNjhiMjdhNWYzNDI1MGIwN2EiLCJpYXQiOjE3MzY0MDI4ODAsImV4cCI6MTczODk5NDg4MH0.nqn5oAJ9aX48pKNquWruo2WnxSJQ-9jtyk1rGx_Wa3Q"
//   }
// }
mixin ApiResponseMixin {
  late int statusCode;
  late bool success;
  late String message;
}
