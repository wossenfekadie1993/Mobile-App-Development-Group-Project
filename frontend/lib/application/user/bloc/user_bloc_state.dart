part of 'user_bloc.dart';

abstract class UserblocState extends Equatable {
  const UserblocState();

  @override
  List<Object> get props => [];
}

class UserblocInitial extends UserblocState {}

class AnnouncementFound extends UserblocState {}

class AnnouncementFoundFailed extends UserblocState {}

// ignore: must_be_immutable
class ReportFound extends UserblocState {
  dynamic myreports;
  ReportFound({required this.myreports});
}

class ReportFoundFailed extends UserblocState {}

class SucessfullyReported extends UserblocState {}

class EditProfileFailed extends UserblocState {}

class EditProfileSucessfull extends UserblocState {}

class DeleteSucessfull extends UserblocState {}

class DeleteFailed extends UserblocState {}
