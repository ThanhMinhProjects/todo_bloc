//success
// {
//   "status_code": 200,
//   "success": true,
//   "message": "success",
//   "body": {
//     "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NzdmNjMyNjhiMjdhNWYzNDI1MGIwN2EiLCJpYXQiOjE3MzY0MDIzNDgsImV4cCI6MTczODk5NDM0OH0.Pep74ERYqhKs9ubRCTNIpMs7x0D6IWbMwaC5zykhWXI"
//   }
// }
// USER_NOT_EXIST
// {
//   "status_code": 400,
//   "success": false,
//   "message": "USER_NOT_EXIST"
// }
// WRONG_PASSWORD
// {
//   "status_code": 400,
//   "success": false,
//   "message": "WRONG_PASSWORD"
// }
class LoginEntity {
  final String message;
  final String? token;

  LoginEntity({required this.message, required this.token});
}
