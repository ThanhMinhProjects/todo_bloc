import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/config/api/api_endpoints.dart';
import 'package:todo_bloc/config/api/api_service.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/features/task/data/datasources/body/task_body.dart';
import 'package:todo_bloc/features/task/data/model/task_model.dart';

@LazySingleton()
class TaskDataSource {
  final ApiService _apiService;

  TaskDataSource(this._apiService);
  Future<Either<Failure, List<TaskModel>>> getListTask() async {
    try {
      final response = await _apiService.getData(ApiUrl.getListTask);
      final responseBody = jsonDecode(response.body);
      if (responseBody['body'] == null ||
          responseBody['body']['docs'] == null) {
        return left(ServerFailure('Invalid response structure'));
      }
      List<dynamic> docs = responseBody['body']['docs'];
      final result = docs
          .map(
            (task) => TaskModel.fromJson(task as Map<String, dynamic>),
          )
          .toList();
      return right(result);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, TaskModel>> createTask(TaskBody body) async {
    try {
      final response =
          await _apiService.postData(ApiUrl.createTask, body.toJson());
      final result = jsonDecode(response.body);
      return right(TaskModel.fromJson(result['body']));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, TaskModel>> updateTask(
      TaskBody body, String id) async {
    try {
      final response =
          await _apiService.putData('${ApiUrl.updateTask}/$id', body.toJson());
      final result = jsonDecode(response.body);
      return right(TaskModel.fromJson(result['body']));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, TaskModel>> getTaskDetail(String id) async {
    try {
      final response = await _apiService.getData('${ApiUrl.getTaskDetail}/$id');
      final result = jsonDecode(response.body);
      return right(TaskModel.fromJson(result['body']));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, String>> deleteTask(String id) async {
    try {
      final response = await _apiService.deleteData('${ApiUrl.deleteTask}/$id');
      final result = jsonDecode(response.body);
      return right(result['message']);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
