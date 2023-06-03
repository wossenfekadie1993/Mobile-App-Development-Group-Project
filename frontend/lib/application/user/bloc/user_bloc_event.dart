part of 'user_bloc.dart';

abstract class UserblocEvent extends Equatable {
  const UserblocEvent();

  @override
  List<Object> get props => [];
}

class GetMyReports extends UserblocEvent {
  dynamic msg;
  GetMyReports(this.msg);
}

class Sendcomplaint extends UserblocEvent {
  dynamic msg;
  Sendcomplaint(this.msg);
}

class ViewReported extends UserblocEvent {
  dynamic msg;
  ViewReported(this.msg);
}


class GetMyReport extends UserblocEvent {
  dynamic id;
  GetMyReport(this.id);
}

class EditProfiles extends UserblocEvent {
  dynamic path;
  dynamic email;
  EditProfiles(this.path, this.email);
}

class UpdateProfile extends UserblocEvent {
  dynamic password;
  dynamic email;
  dynamic fullname;
  UpdateProfile(this.password, this.email,  this.fullname);
}

class DeleteReported extends UserblocEvent {
  dynamic id;
  DeleteReported(this.id);
}

class Getannouncement extends UserblocEvent{
  dynamic msg;
  Getannouncement(this.msg);
}
class ReportNows extends UserblocEvent {}