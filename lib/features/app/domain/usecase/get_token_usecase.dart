import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/services/share_pref_service.dart';
import 'package:todo_bloc/features/app/domain/repositories/app_repository.dart';

@Injectable()
class GetTokenUsecase {
  final AppRepository repository;

  GetTokenUsecase(this.repository);

  Future<String?> call() async {
    return await repository.getToken();
  }
}
