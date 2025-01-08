class AddTaskResponse {
  final String id;
  final String name;
  final String description;
  final String status;
  final String createdAt;
  final String updatedAt;

  AddTaskResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AddTaskResponse.fromJson(Map<String, dynamic> json) {
    return AddTaskResponse(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
