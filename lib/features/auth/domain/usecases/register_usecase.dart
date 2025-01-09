import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/config/api/api_response.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/register_body.dart';
import 'package:todo_bloc/features/auth/domain/entities/register_entity.dart';
import 'package:todo_bloc/features/auth/domain/repositories/auth_repository.dart';

@Injectable()
class RegisterUsecase {
  final AuthRepository _repository;

  RegisterUsecase(this._repository);

  Future<Either<Failure, Map<String, dynamic>>> call(
      RegisterEntity body) async {
    return await _repository.register(body);
  }
}
