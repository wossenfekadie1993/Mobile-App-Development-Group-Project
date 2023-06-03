part of 'manager_bloc.dart';

abstract class managerblocState extends Equatable {
  const managerblocState();
  @override
  List<Object> get props => [];
}

class managerblocInitial extends managerblocState {}

class GetOngoingSucessful extends managerblocState {
  final ComplaintList;
  GetOngoingSucessful({this.ComplaintList, required complaintList});
}

class GetOngoingFailed extends managerblocState {}

class GetReportedSucessful extends managerblocState {
  final ComplaintList;
  GetReportedSucessful({this.ComplaintList, required complaintList});
}

class GetReportedFailed extends managerblocState {}

class GetSolvedSucessful extends managerblocState {
  final ComplaintList;
  GetSolvedSucessful({this.ComplaintList, required complaintList});
}

class GetSolvedFailed extends managerblocState {}

class DeleteSucessfull extends managerblocState {}

class DeleteFailed extends managerblocState {}

class MoveSuccessfull extends managerblocState {}

class MoveFailed extends managerblocState {}

class GetAnnouncementFailed extends managerblocState{}
class GetAnnouncementSucessful extends managerblocState {
  final List<Announcement> announcementList;

  GetAnnouncementSucessful({required this.announcementList});

  @override
  List<Object> get props => [announcementList];
}


class PostAnnouncementSucessful extends managerblocState{}

class PostAnnouncementFailed extends managerblocState{}

class updateAnnouncementSucessful extends managerblocState{}

class updateAnnouncementFailed extends managerblocState{}

class deleteAnnouncementSucessful extends managerblocState{}

class deleteAnnouncementFailed extends managerblocState{}
class AnnouncementEvent {}

class AddAnnouncement extends AnnouncementEvent {
  final String title;
  final String description;

  AddAnnouncement(this.title, this.description);
}

class AnnouncementState {}

class AnnouncementAdded extends AnnouncementState {}


abstract class AnnouncementsState extends Equatable {
  const AnnouncementsState();

  @override
  List<Object?> get props => [];
}

class AnnouncementsInitial extends AnnouncementsState {}

class AnnouncementsLoading extends AnnouncementsState {}

class AnnouncementsLoaded extends AnnouncementsState {
  final List<Announcement> announcements;

  const AnnouncementsLoaded({required this.announcements});

  @override
  List<Object?> get props => [announcements];
}

class AnnouncementsError extends AnnouncementsState {
  final String message;

  const AnnouncementsError({required this.message});

  @override
  List<Object?> get props => [message];
}
