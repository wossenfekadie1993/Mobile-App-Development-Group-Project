import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LogingIn extends AuthState {}

class LoginSuccessful extends AuthState {
  final dynamic response;
  final dynamic announcement;
  LoginSuccessful(this.response, this.announcement);

  @override
  List<Object> get props => [response, announcement];
}

class LoginFailed extends AuthState {}

class SignUpInitial extends AuthState {}

class SigningIn extends AuthState {}

class SignUpSuccessful extends AuthState {}

class SignUpFailed extends AuthState {}

class LoggingOut extends AuthState {}

class LogedOut extends AuthState {}
