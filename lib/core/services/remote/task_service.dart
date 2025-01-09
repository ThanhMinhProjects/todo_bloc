import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/config/api/api_endpoints.dart';
import 'package:todo_bloc/config/api/api_response_mixin.dart';
import 'package:todo_bloc/config/api/api_service.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/core/services/body/task_body.dart';

@LazySingleton()
class TaskService {
  final ApiService _apiService;

  TaskService(this._apiService);

  Future<Either<Failure, Map<String, dynamic>>> createTask(
      TaskBody body) async {
    try {
      final response = await _apiService.postData(
          ApiEndpoints.endPointTaskCreate, body.toJson());
      return right(jsonDecode(response.body));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
