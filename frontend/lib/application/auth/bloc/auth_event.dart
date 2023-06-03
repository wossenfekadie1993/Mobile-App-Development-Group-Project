import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'Auth_state.dart';
abstract class AuthEvent extends Equatable implements StateStreamable<AuthState> {
  const AuthEvent();
  @override
  Stream<AuthState> get stream;

  AuthState get initialState => throw UnimplementedError();
  // Your event implementation
// }

// abstract class AuthEvent extends Equatable {
//   const AuthEvent();

  @override
  List<Object> get props => [];
}

class Login extends AuthEvent {
  final String username;
  final String password;

  Login({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
  
  @override
  // TODO: implement state
  AuthState get state => throw UnimplementedError();
  
  @override
  // TODO: implement stream
  Stream<AuthState> get stream => throw UnimplementedError();
}

class SignUp extends AuthEvent {
  final String username;
  final String password;
  final String email;

  SignUp({required this.username, required this.password, required this.email, required Map<String, String> body});

  @override
  List<Object> get props => [username, password, email];
  
  @override
  // TODO: implement state
  AuthState get state => throw UnimplementedError();
  
  @override
  // TODO: implement stream
  Stream<AuthState> get stream => throw UnimplementedError();
}

class Logout extends AuthEvent {
  @override
  // TODO: implement state
  AuthState get state => throw UnimplementedError();

  @override
  // TODO: implement stream
  Stream<AuthState> get stream => throw UnimplementedError();
}
