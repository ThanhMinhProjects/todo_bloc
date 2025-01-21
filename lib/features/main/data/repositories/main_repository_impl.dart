import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/services/share_pref_service.dart';
import 'package:todo_bloc/features/main/domain/repositoies/main_repository.dart';

@Injectable(as:  MainRepository)
class MainRepositoryImpl implements MainRepository {
  final SharePrefService _sharePref;

  MainRepositoryImpl(this._sharePref);
  @override
  Future<bool> clearToken() {
    return _sharePref.clearToken();
  }
}
