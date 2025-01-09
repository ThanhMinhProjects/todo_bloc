import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/config/api/api_response.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/send_otp_body.dart';
import 'package:todo_bloc/features/auth/data/model/otp_model.dart';
import 'package:todo_bloc/features/auth/domain/entities/otp_entity.dart';
import 'package:todo_bloc/features/auth/domain/repositories/auth_repository.dart';

@Injectable()
class SendOtpUsecase {
  final AuthRepository _repository;

  SendOtpUsecase(this._repository);

  Future<Either<Failure, OtpEntity>> call(SendOtpBody body) async {
    return await _repository.sendOtp(body);
  }
}
