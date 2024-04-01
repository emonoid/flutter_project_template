part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {}

final class AuthShowPassword extends AuthState {}

final class AuthHidePassword extends AuthState {}



final class AuthFailed extends AuthState {
  final String message;
  const AuthFailed({required this.message});
}
