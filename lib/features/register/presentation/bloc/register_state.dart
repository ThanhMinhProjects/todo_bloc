part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final String? otpMessage;

  const RegisterState({
    this.isLoading = false,
    this.errorMessage,
    this.otpMessage,
  });

  RegisterState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? otpMessage,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      otpMessage: otpMessage ?? this.otpMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, otpMessage];
}
