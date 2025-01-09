// {
//   "status_code": 200,
//   "success": true,
//   "message": "success",
//   "body": {
//     "name": "test601@gmail.com",
//     "email": "test601@gmail.com",
//     "password": "$2b$10$5m/j59z62TquS2iEtcBYOuZuDE4zwN6NKth6H5lx.9CG2MkXT/0wS",
//     "age": 0,
//     "avatar": null,
//     "_id": "677f63268b27a5f34250b07a",
//     "createdAt": "2025-01-09T05:48:22.431Z",
//     "updatedAt": "2025-01-09T05:48:22.431Z",
//     "__v": 0
//   }
// }
import 'package:todo_bloc/features/auth/domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity {
  RegisterModel({required super.message});
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(message: json['message']);
  }
}
