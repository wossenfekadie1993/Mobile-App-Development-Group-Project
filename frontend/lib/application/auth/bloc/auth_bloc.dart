import '../../../infrastructure/repository/manager_repo.dart';
import '../../../infrastructure/repository/user_repo.dart';
import 'package:bloc/bloc.dart';
import '../../../application/auth/bloc/auth_event.dart';
import '../../../application/auth/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final userRepository = UserRepository();
  final managerRepository = ManagerRepository();

  AuthBloc() : super(AuthInitial()) {
    on<Login>(_onLogin);
    on<SignUp>(_onSignUp);
    on<Logout>(_onLogOut);
  }

  void _onLogin(Login event, Emitter emit) async {
    emit(LogingIn());
    final response =
        await userRepository.getUser(event.username, event.password);
    final sampleComplaint = 'login successfully';
    if (response == 401) {
      emit(LoginFailed());
    } else {
      emit(LoginSuccessful(response, sampleComplaint));
    }
  }
void _onSignUp(SignUp event, Emitter emit) async {
  emit(SigningIn());
  final response = await userRepository.getUser(event.username, event.password);
  
  if (response == 400 || response == 401) {
    dynamic body = {}; // Assign an empty Map to the 'body' variable
    await userRepository.signUpUser(body);
    emit(SignUpSuccessful());
  } else {
    emit(SignUpFailed());
  }
}


  void _onLogOut(Logout event, Emitter emit) async {
    emit(LoggingOut());
    await userRepository.deleteToken();
    emit(LogedOut());
  }
}
