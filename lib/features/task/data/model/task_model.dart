import 'package:todo_bloc/features/task/domain/entities/task_entity.dart';

// {
//     "name": "Task2",
//     "description": "lkaslkvaskvmsakvmkasvlasmvlks",
//     "start_time": null,
//     "end_time": null,
//     "status": "PROCESSING",
//     "created_by": "677f8dd88b27a5f34250b0b6",
//     "deletedAt": null,
//     "_id": "677f96a88b27a5f34250b0d4",
//     "createdAt": "2025-01-09T09:28:08.772Z",
//     "updatedAt": "2025-01-09T09:28:08.772Z",
//     "__v": 0
//   }
class TaskModel extends TaskEntity {
  final String? startTime;
  final String? endTime;
  final Map<String, dynamic> createdBy;
  final String? deletedAt;
  final int v;

  TaskModel({
    required super.id,
    required super.name,
    required super.description,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
    this.startTime,
    this.endTime,
    required this.createdBy,
    this.deletedAt,
    required this.v,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      startTime: json['start_time'],
      endTime: json['end_time'],
      createdBy: json['created_by'],
      deletedAt: json['deletedAt'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'start_time': startTime,
      'end_time': endTime,
      'created_by': createdBy,
      'deletedAt': deletedAt,
      '__v': v,
    };
  }
}
