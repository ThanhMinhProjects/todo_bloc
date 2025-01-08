class TaskBody {
  final String name;
  final String description;
  final String status;

  TaskBody(
      {required this.name, required this.description, required this.status});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'status': status,
    };
  }
}
