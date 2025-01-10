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

  Future<Either<Failure, List<TaskModel>>> getListTask() async {
    try {
      final response = await _apiService.fetchData(ApiUrl.getListTask);
      final data = jsonDecode(response.body);
      List<dynamic> result = data['body']['docs'];
      print(result);
      return right(result
          .map(
            (e) => TaskModel.fromJson(e as Map<String, dynamic>),
          )
          .toList());
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
