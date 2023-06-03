

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'complaints_bloc.dart';
import 'complaints_event.dart';
import 'complaints_state.dart';

class ComplaintsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaints Page'),
      ),
      body: BlocBuilder<ComplaintsBloc, ComplaintsState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                buildComplaintItem(
                  context,
                  'Food Issue',
                  'Food Sample',
                  'assets/food.jpg',
                  () {
                    BlocProvider.of<ComplaintsBloc>(context).add(
                      SelectComplaintEvent(ComplaintTypes.foodIssue),
                    );
                  },
                ),
                SizedBox(height: 16.0),
                buildComplaintItem(
                  context,
                  'Gender Issue',
                  'Gender Sample',
                  'assets/gender.jpg',
                  () {
                    BlocProvider.of<ComplaintsBloc>(context).add(
                      SelectComplaintEvent(ComplaintTypes.genderIssue),
                    );
                  },
                ),
                SizedBox(height: 16.0),
                buildComplaintItem(
                  context,
                  'Exam Issue',
                  'Exam Sample',
                  'assets/exam.jpg',
                  () {
                    BlocProvider.of<ComplaintsBloc>(context).add(
                      SelectComplaintEvent(ComplaintTypes.examIssue),
                    );
                  },
                ),
                SizedBox(height: 16.0),
                buildComplaintItem(
                  context,
                  'Staff Issue',
                  'Staff Sample',
                  'assets/staff.jpg',
                  () {
                    BlocProvider.of<ComplaintsBloc>(context).add(
                      SelectComplaintEvent(ComplaintTypes.staffIssue),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }

  Widget buildComplaintItem(BuildContext context, String title, String subtitle,
      String imagePath, VoidCallback onTap) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(imagePath),
          ),
          SizedBox(width: 16.0),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: onTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(subtitle),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press
                    },
                    child: Text('View More'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Navigate to home screen
              },
            ),
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                // Navigate to chat screen
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Navigate to profile screen
              },
            ),
          ],
        ),
      ),
    );
  }
}














// // import 'package:flutter/material.dart';
// // import '../common/bottom_navigation_bar.dart';
// import 'announcement_form.dart';
// import 'package:flutter/material.dart';



// class ComplaintsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Complaints Page'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.all(8.0),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: Image.asset('assets/food.jpg'),
//                   ),
//                   SizedBox(width: 16.0),
//                   Expanded(
//                     flex: 2,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => FoodIssuePage()),
//                         );
//                       },
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Food Issue',
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 8.0),
//                           Text('Food Sample'),
//                           SizedBox(height: 16.0),
//                           ElevatedButton(
//                             onPressed: () {
//                               // Handle button press
//                             },
//                             child: Text('View More'),
//                             style: ButtonStyle(
//                               backgroundColor:
//                                   MaterialStateProperty.all<Color>(Colors.red),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Container(
//               padding: EdgeInsets.all(8.0),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: Image.asset('assets/gender.jpg'),
//                   ),
//                   SizedBox(width: 16.0),
//                   Expanded(
//                     flex: 2,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => GenderIssuePage()),
//                         );
//                       },
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Gender Issue',
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 8.0),
//                           Text('Gender Sample'),
//                           SizedBox(height: 16.0),
//                           ElevatedButton(
//                             onPressed: () {
//                               // Handle button press
//                             },
//                             child: Text('View More'),
//                             style: ButtonStyle(
//                               backgroundColor:
//                                   MaterialStateProperty.all<Color>(Colors.red),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Container(
//               padding: EdgeInsets.all(8.0),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: Image.asset('assets/exam.jpg'),
//                   ),
//                   SizedBox(width: 16.0),
//                   Expanded(
//                     flex: 2,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ExamIssuePage()),
//                         );
//                       },
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Exam Issue',
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 8.0),
//                           Text('Exam Sample'),
//                           SizedBox(height: 16.0),
//                           ElevatedButton(
//                             onPressed: () {
//                               // Handle button press
//                             },
//                             child: Text('View More'),
//                             style: ButtonStyle(
//                               backgroundColor:
//                                   MaterialStateProperty.all<Color>(Colors.red),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Container(
//               padding: EdgeInsets.all(8.0),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: Image.asset('assets/staff.jpg'),
//                   ),
//                   SizedBox(width: 16.0),
//                   Expanded(
//                     flex: 2,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => StaffIssuePage()),
//                         );
//                       },
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Staff Issue',
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 8.0),
//                           Text('Staff Sample'),
//                           SizedBox(height: 16.0),
//                           ElevatedButton(
//                             onPressed: () {
//                               // Handle button press
//                             },
//                             child: Text('View More'),
//                             style: ButtonStyle(
//                               backgroundColor:
//                                   MaterialStateProperty.all<Color>(Colors.red),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: MyBottomNavigationBar(),
//     );
//   }
// }

// class FoodIssuePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Food Issue Page'),
//       ),
//       body: Center(
//         child: Text('Food Issue Details'),
//       ),
//     );
//   }
// }

// class GenderIssuePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Gender Issue Page'),
//       ),
//       body: Center(
//         child: Text('Gender Issue Details'),
//       ),
//     );
//   }
// }

// class ExamIssuePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Exam Issue Page'),
//       ),
//       body: Center(
//         child: Text('Exam Issue Details'),
//       ),
//     );
//   }
// }

// class StaffIssuePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Staff Issue Page'),
//       ),
//       body: Center(
//         child: Text('Staff Issue Details'),
//       ),
//     );
//   }
// }


// class AnnouncementsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Announcements Page'),
//       ),
//       body: SingleChildScrollView( // Added 'body' property here
//         child: Padding(
//           padding: EdgeInsets.only(top: 40.0),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: Card(
//                       color: Colors.white,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           AnnouncementForm(),
//                           Padding(
//                             padding: EdgeInsets.only(
//                               right: 20.0,
//                               top: 8.0,
//                               bottom: 8.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Card(
//                       margin: EdgeInsets.all(8.0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       child: Stack(
//                         alignment: Alignment.topRight,
//                         children: [
//                           Column(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: Image.asset(
//                                   'ring.jpg',
//                                   width: 150.0,
//                                   height: 150.0,
//                                 ),
//                               ),
//                               Text(
//                                 'Final Exam Schedule',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                               Text(
//                                 'This is the final exam',
//                                 textAlign: TextAlign.center,
//                               ),
//                               Text(
//                                 'Relax, everybody!',
//                                 textAlign: TextAlign.center,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 15),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {},
//                                 style: ElevatedButton.styleFrom(
//                                   primary: Colors.red,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(5.0),
//                                   ),
//                                 ),
//                                 child: Text(
//                                   'View More',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(left: 8.0),
//                             child: GestureDetector(
//                               onTap: () {
//                                 // Handle the on tap action here
//                               },
//                               child: Icon(
//                                 Icons.more_vert,
//                                 size: 24.0,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10.0),
//                   Expanded(
//                     child: Card(
//                       margin: EdgeInsets.all(20.0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       child: Stack(
//                         alignment: Alignment.topRight,
//                         children: [
//                           Column(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: Image.asset(
//                                   'ring.jpg',
//                                   width: 150.0,
//                                   height: 150.0,
//                                 ),
//                               ),
//                               Text(
//                                 'Final Exam Schedule',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                               Text(
//                                 'This is the final exam',
//                                 textAlign: TextAlign.center,
//                               ),
//                               Text(
//                                 'Relax, everybody!',
//                                 textAlign: TextAlign.center,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 15),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {},
//                                 style: ElevatedButton.styleFrom(
//                                   primary: Colors.red,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(5.0),
//                                   ),
//                                 ),
//                                 child: Text(
//                                   'View More',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: GestureDetector(
//                               onTap: () {
//                                 // Handle the on tap action here
//                               },
//                               child: Icon(
//                                 Icons.more_vert,
//                                 size: 24.0,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10.0),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Card(
//                       margin: EdgeInsets.all(20.0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       child: Stack(
//                         alignment: Alignment.topRight,
//                         children: [
//                           Column(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: Image.asset(
//                                   'ring.jpg',
//                                   width: 150.0,
//                                   height: 150.0,
//                                 ),
//                               ),
//                               Text(
//                                 'Final Exam Schedule',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                               Text(
//                                 'This is the final exam',
//                                 textAlign: TextAlign.center,
//                               ),
//                               Text(
//                                 'Relax, everybody!',
//                                 textAlign: TextAlign.center,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 15),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {},
//                                 style: ElevatedButton.styleFrom(
//                                   primary: Colors.red,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(5.0),
//                                   ),
//                                 ),
//                                 child: Text(
//                                   'View More',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: GestureDetector(
//                               onTap: () {
//                                 // Handle the on tap action here
//                               },
//                               child: Icon(
//                                 Icons.more_vert,
//                                 size: 24.0,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10.0),
//                   Expanded(
//                     child: Card(
//                       margin: EdgeInsets.all(20.0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       child: Stack(
//                         alignment: Alignment.topRight,
//                         children: [
//                           Column(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: Image.asset(
//                                   'ring.jpg',
//                                   width: 150.0,
//                                   height: 150.0,
//                                 ),
//                               ),
//                               Text(
//                                 'Final Exam Schedule',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.center,
//                               ),
//                               Text(
//                                 'This is the final exam',
//                                 textAlign: TextAlign.center,
//                               ),
//                               Text(
//                                 'Relax, everybody!',
//                                 textAlign: TextAlign.center,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 15),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {},
//                                 style: ElevatedButton.styleFrom(
//                                   primary: Colors.red,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(5.0),
//                                   ),
//                                 ),
//                                 child: Text(
//                                   'View More',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: GestureDetector(
//                               onTap: () {
//                                 // Handle the on tap action here
//                               },
//                               child: Icon(
//                                 Icons.more_vert,
//                                 size: 24.0,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: MyBottomNavigationBar(),
//     );
//   }
// }


// class ReportedPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Reported'),
//       ),
//       body: Center(
//         child: Text('Reported Page'),
//       ),
//     );
//   }
// }

// class OngoingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Ongoing'),
//       
// ),
//       body: Center(
//         child: Text('Ongoing Page'),
//       ),
//     );
//   }
// }

// class PendingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pending'),
//       ),
//       body: Center(
//         child: Text('Pending Page'),
//       ),
//     );
//   }
// }

// class SolvedPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Solved'),
//       ),
//       body: Center(
//         child: Text('Solved Page'),
//       ),
//     );
//   }
// }