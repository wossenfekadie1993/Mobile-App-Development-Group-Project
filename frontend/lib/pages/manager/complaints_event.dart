

enum ComplaintTypes {
  foodIssue,
  genderIssue,
  examIssue,
  staffIssue,
}

abstract class ComplaintsEvent {}

class SelectComplaintEvent extends ComplaintsEvent {
  final ComplaintTypes complaintType;

  SelectComplaintEvent(this.complaintType);
}
