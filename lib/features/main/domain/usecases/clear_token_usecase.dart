import 'package:injectable/injectable.dart';
import 'package:todo_bloc/features/app/domain/repositories/app_repository.dart';
import 'package:todo_bloc/features/main/domain/repositoies/main_repository.dart';

@Injectable()
class ClearTokenUsecase {
  final MainRepository _repository;

  ClearTokenUsecase(this._repository);

  Future<bool> call() async {
    return await _repository.clearToken();
  }
}
