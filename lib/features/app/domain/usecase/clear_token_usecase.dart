import 'package:injectable/injectable.dart';
import 'package:todo_bloc/features/app/domain/repositories/app_repository.dart';

@Injectable()
class ClearTokenUsecase {
  final AppRepository _repository;

  ClearTokenUsecase(this._repository);

  Future<bool> call() async {
    return await _repository.clearToken();
  }
}
