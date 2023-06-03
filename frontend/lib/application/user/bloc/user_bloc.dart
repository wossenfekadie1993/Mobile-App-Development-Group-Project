import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../infrastructure/repository/user_repo.dart';
part 'user_bloc_event.dart';
part 'user_bloc_state.dart';

class UserblocBloc extends Bloc<UserblocEvent, UserblocState> {
  final userRepository = UserRepository();

  UserblocBloc() : super(UserblocInitial()) {
    
    on<GetMyReport>(_onGetMyReport);
    on<DeleteReported>(_onDeleteReported);
    on<UpdateProfile>(_onUpdateProfile);
    on<ReportNows>(_onReport);
  }

  void _onGetMyReport(GetMyReport event, Emitter emit) async {
    dynamic myreport = await userRepository.getMyReport(event.id);
    if (myreport == null) {
      emit(ReportFoundFailed);
    } else {
      emit(ReportFound(myreports: myreport));
    }
  }

  void _onUpdateProfile(UpdateProfile event, Emitter emit) async {
    emit(UserblocInitial());
    final response = await userRepository.updateProfile(
        event.email,event.password, event.fullname);
    if (response == null) {
      emit(EditProfileFailed());
    } else {
      emit(EditProfileSucessfull());
    }
  }

  void _onReport(ReportNows event, Emitter emit) async {
    emit(SucessfullyReported());
  }

  void _onDeleteReported(DeleteReported event, Emitter emit) async {
    emit(UserblocInitial());
    final response = await userRepository.deleteReported(event.id);
    if (response.statusCode == 200) {
      emit(DeleteSucessfull());
    } else {
      emit(DeleteFailed());
    }
  }
}