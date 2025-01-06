import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/services/local/share_pref_service.dart';
import 'package:todo_bloc/features/app/domain/repositories/app_repository.dart';

@Injectable(as: AppRepository)
class AppRepositoriesImpl implements AppRepository {
  final SharePrefService sharePref;

  AppRepositoriesImpl(this.sharePref);
  @override
  Future<String?> getToken() {
    return sharePref.getToken();
  }
}
