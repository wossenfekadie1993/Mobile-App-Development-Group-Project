
// ignore_for_file: must_be_immutable

part of  'manager_bloc.dart';

abstract class managerblocEvent extends Equatable {
  const managerblocEvent();

  @override
  List<Object> get props => [];
}

class GetReported extends managerblocEvent {
  final dynamic msg;
  GetReported(this.msg);
  @override
  List<Object> get props => [msg];
}

class GetOngoing extends managerblocEvent {
  final dynamic user;

  GetOngoing(this.user);

  @override
  List<Object> get props => [user];
}

class GetSolved extends managerblocEvent {
  final dynamic user;

  GetSolved(this.user);

  @override
  List<Object> get props => [user];
}

class Deletecomplaint extends managerblocEvent {
  final dynamic id;

  Deletecomplaint(this.id);

  @override
  List<Object> get props => [id];
}

class MoveToOngoing extends managerblocEvent {
  final dynamic id;

  MoveToOngoing(this.id);

  @override
  List<Object> get props => [id];
}

class MoveToSolved extends managerblocEvent {
  final dynamic id;

  MoveToSolved(this.id);

  @override
  List<Object> get props => [id];
}

class GetAnnouncement extends managerblocEvent {
  dynamic msg;
  GetAnnouncement(this.msg);
}

// ignore: must_be_immutable
class PostAnnouncement extends managerblocEvent {
  dynamic msg;
  PostAnnouncement(this.msg);
}

class UpdateAnnouncement extends managerblocEvent {
  dynamic msg;
  UpdateAnnouncement(this.msg);
}


class DeleteAnnouncement extends managerblocEvent {
  dynamic id;
  DeleteAnnouncement(this.id);
}


abstract class AnnouncementsEvent extends Equatable {
  const AnnouncementsEvent();

  @override
  List<Object?> get props => [];
}

class LoadAnnouncements extends AnnouncementsEvent {}
