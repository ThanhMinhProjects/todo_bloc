import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/login_body.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/send_otp_body.dart';
import 'package:todo_bloc/features/auth/domain/entities/login_entity.dart';
import 'package:todo_bloc/features/auth/domain/entities/otp_entity.dart';
import 'package:todo_bloc/features/auth/domain/repositories/auth_repository.dart';
import 'package:todo_bloc/features/auth/domain/usecases/login_usecase.dart';
import 'package:todo_bloc/features/auth/domain/usecases/send_otp_usecase.dart';

import 'auth_generate_mock.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late LoginUsecase loginUsecase;
  late SendOtpUsecase sendOtpUsecase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUsecase = LoginUsecase(mockAuthRepository);
    sendOtpUsecase = SendOtpUsecase(mockAuthRepository);
  });

  group('LoginUsecase', () {
    test('return LoginEntity when login is successful', () async {
      const email = "test901@gmail.com";
      const password = "test901@gmail.com";
      final loginBody = LoginBody(email: email, password: password);
      final loginEntity = LoginEntity(
        message: 'success',
        token: 'fake_token',
      );

      when(mockAuthRepository.login(loginBody))
          .thenAnswer((_) async => Right(loginEntity));

      final result = await loginUsecase(loginBody);

      expect(result, Right(loginEntity));
      verify(mockAuthRepository.login(loginBody)).called(1);
    });

    test('return Failure when login fails', () async {
      const email = "test901@gmail.com";
      const password = "wrong_password";
      final loginBody = LoginBody(email: email, password: password);
      final failure = ServerFailure('Invalid credentials');

      when(mockAuthRepository.login(loginBody))
          .thenAnswer((_) async => Left(failure));

      final result = await loginUsecase(loginBody);

      expect(result, Left(failure));
      verify(mockAuthRepository.login(loginBody)).called(1);
    });
  });

  group('SendOtpUsecase', () {
    test('return code when send otp success', () async {
      const email = 'test901@gmail.com';
      final sendOtpBody = SendOtpBody(email: email);
      final otpEntity = OtpEntity(code: '1234', message: 'success');

      when(mockAuthRepository.sendOtp(sendOtpBody)).thenAnswer(
        (_) async => Right(otpEntity),
      );

      final result = await sendOtpUsecase(sendOtpBody);

      expect(result, Right(otpEntity));
      verify(mockAuthRepository.sendOtp(sendOtpBody)).called(1);
    });
  });
}
