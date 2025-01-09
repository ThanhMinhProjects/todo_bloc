class TaskEntity {
  final String id;
  final String name;
  final String description;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  TaskEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
}
