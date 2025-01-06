import 'package:injectable/injectable.dart';
import 'package:todo_bloc/features/auth/domain/repositories/auth_repository.dart';
@Injectable()
class SetTokenUsecase {
  final AuthRepository _repository;

  SetTokenUsecase(this._repository);

  Future<bool> call(String token) async {
    return await _repository.setToken(token);
  }
}
