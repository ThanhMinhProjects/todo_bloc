part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final String? otpMessage;

  const AuthState({
    this.isLoading = false,
    this.errorMessage,
    this.otpMessage,
  });

  AuthState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? otpMessage,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      otpMessage: otpMessage ?? this.otpMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, otpMessage];
}
