part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class IsLoading extends RegisterState {
  final bool isLoading;

  IsLoading(this.isLoading);
}
