class RegisterBody {
  final String name;
  final String email;
  final String password;
  final int age;
  final String code;

  RegisterBody({
    required this.name,
    required this.email,
    required this.password,
    required this.age,
    required this.code,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'age': age,
      'code': code,
    };
  }
}
