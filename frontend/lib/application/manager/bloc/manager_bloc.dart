// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:students_voice/infrastructure/repository/manager_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:students_voice/models/announcement_model/announcement.dart';
// import 'package:students_voice/application/manager/bloc/manager_bloc_event.dart';

part  'manager_bloc_state.dart';

part 'manager_bloc_event.dart';



class managerblocBloc extends Bloc<managerblocEvent, managerblocState> {
  final managerRepository = ManagerRepository();

  managerblocBloc() : super(managerblocInitial()) {
    on<GetOngoing>(_onOngoing);
    on<GetSolved>(_onSolved);
    on<GetReported>(_onReported);
    on<Deletecomplaint>(_onDeletecomplaint);
    on<MoveToOngoing>(_onMoveToOngoing);
    on<MoveToSolved>(_onMoveToSolved);
  }
  
  // Event handler for the GetOngoing event
  void _onOngoing(GetOngoing event, Emitter<managerblocState> emit) async {
    emit(managerblocInitial());
    final ongoingcomplaints = await managerRepository.getOngoingcomplaints(event.user);
    try {
      emit(GetOngoingSucessful(complaintList: ongoingcomplaints));
    } catch (e) {}
  }

  // Event handler for the GetSolved event
  void _onSolved(GetSolved event, Emitter<managerblocState> emit) async {
    emit(managerblocInitial());
    final solvedcomplaints = await managerRepository.getSolvedcomplaints(event.user);
    try {
      emit(GetSolvedSucessful(complaintList: solvedcomplaints));
    } catch (e) {}
  }

  // Event handler for the GetReported event
  void _onReported(GetReported event, Emitter<managerblocState> emit) async {
    emit(managerblocInitial());
    final reportedcomplaints = await managerRepository.getReportedcomplaints(event.msg);
    try {
      emit(GetReportedSucessful(complaintList: reportedcomplaints));
    } catch (e) {}
  }

  // Event handler for the Deletecomplaint event
  void _onDeletecomplaint(Deletecomplaint event, Emitter<managerblocState> emit) async {
    emit(managerblocInitial());
    final response = await managerRepository.deletecomplaint(event.id);
    if (response.statusCode == 200) {
      emit(DeleteSucessfull());
    } else {
      emit(DeleteFailed());
    }
  }

  // Event handler for the MoveToOngoing event
  void _onMoveToOngoing(MoveToOngoing event, Emitter<managerblocState> emit) async {
    emit(managerblocInitial());
    final response = await managerRepository.moveToOngoing(event.id);
    if (response.statusCode == 200) {
      emit(MoveSuccessfull());
    } else {
      emit(MoveFailed());
    }
  }

  // Event handler for the MoveToSolved event
  void _onMoveToSolved(MoveToSolved event, Emitter<managerblocState> emit) async {
    emit(managerblocInitial());
    final response = await managerRepository.moveToSolved(event.id);
    if (response.statusCode == 200) {
      emit(MoveSuccessfull());
    } else {
      emit(MoveFailed());
    }
  }
}

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {
  AnnouncementBloc() : super(AnnouncementInitial());

  @override
  Stream<AnnouncementState> mapEventToState(AnnouncementEvent event) async* {
    if (event is AddAnnouncement) {
      // Perform any necessary logic here, such as making API calls or updating a database
      // Once the action is completed, emit a new state
      yield AnnouncementAdded();
    }
  }
}