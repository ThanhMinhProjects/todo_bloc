import 'package:todo_bloc/core/services/body/register_body.dart';
import 'package:todo_bloc/features/register/domain/repositories/register_repository.dart';

class RegisterUsecase {
  final RegisterRepository _registerRepository;

  RegisterUsecase(this._registerRepository);

  Future<String> call(RegisterBody body) async {
    return await _registerRepository.register(body);
  }
}
