
import 'package:flutter_bloc/flutter_bloc.dart';
import 'complaints_event.dart';
import 'complaints_state.dart';

class ComplaintsBloc extends Bloc<ComplaintsEvent, ComplaintsState> {
  ComplaintsBloc() : super(ComplaintsInitial());

  @override
  Stream<ComplaintsState> mapEventToState(ComplaintsEvent event) async* {
    if (event is SelectComplaintEvent) {
      yield _mapComplaintEventToState(event.complaintType);
    }
  }

  ComplaintsState _mapComplaintEventToState(ComplaintTypes complaintType) {
    switch (complaintType) {
      case ComplaintTypes.foodIssue:
        return FoodIssueState();
      case ComplaintTypes.genderIssue:
        return GenderIssueState();
      case ComplaintTypes.examIssue:
        return ExamIssueState();
      case ComplaintTypes.staffIssue:
        return StaffIssueState();
      default:
        return ComplaintsInitial();
    }
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'complaints_bloc.dart';
// import 'complaints_page.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Complaints App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: BlocProvider(
//         create: (_) => ComplaintsBloc(),
//         child: ComplaintsPage(),
//       ),
//     );
//   }
// }
