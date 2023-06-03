

import '../common/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_voice/application/manager/bloc/manager_bloc.dart';

class AnnouncementForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final announcementBloc = context.read<AnnouncementBloc>();
        announcementBloc.add(AddAnnouncement(
          'Title',
          'Description',
        ));
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        onPrimary: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 20.0, top: 8.0, bottom: 8.0),
        child: Text(
          'Add new',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class NewAnnouncementForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementBloc, AnnouncementState>(
      builder: (context, state) {
        if (state is AnnouncementsInitial) {
          // Render the initial state
        } else if (state is AnnouncementAdded) {
          // Render the state when the announcement is added successfully
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('New Announcement'),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('ring.jpg'),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                    child: Row(
                      children: [
                        Text(
                          'Title:',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter title',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                    child: Row(
                      children: [
                        Text(
                          'Description:',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Enter description',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 12.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final announcementBloc = context.read<AnnouncementBloc>();
                      announcementBloc.add(AddAnnouncement(
                        'Title',
                        'Description',
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 8.0, bottom: 8.0),
                      child: Text(
                        'Post',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: MyBottomNavigationBar(),
        );
      },
    );
  }
}



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => AnnouncementBloc(),
        child: NewAnnouncementForm(),
      ),
    );
  }
}







// import 'package:flutter/material.dart';
// import '../common/bottom_navigation_bar.dart';


// class AnnouncementForm extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => NewAnnouncementForm()),
//         );
//       },
//       style: ElevatedButton.styleFrom(
//         primary: Colors.red,
//         onPrimary: Colors.white,
//       ),
//       child: Padding(
//         padding: EdgeInsets.only(right: 20.0, top: 8.0, bottom: 8.0),
//         child: Text(
//           'Add new',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NewAnnouncementForm extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('New Announcement'),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset('ring.jpg'),

//    Padding(
//   padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
//   child: Row(
//     children: [
//       Text(
//         'Title:',
//         style: TextStyle(fontSize: 18),
//       ),
//     ],
//   ),
// ),           
// Padding(
//   padding: EdgeInsets.symmetric(horizontal: 20.0),
//   child: TextField(
//     decoration: InputDecoration(
//       hintText: 'Enter title',
//       border: OutlineInputBorder(),
//       contentPadding: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
//     ),
//   ),
// ),

// SizedBox(height: 16),
// Padding(
//   padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
//   child: Row(
//     children: [
//       Text(
//         'Description:',
//         style: TextStyle(fontSize: 18),
//       ),
//     ],
//   ),
// ),
// Padding(
//   padding: EdgeInsets.symmetric(horizontal: 20.0),
//   child: TextField(
//     maxLines: null,
//     keyboardType: TextInputType.multiline,
//     decoration: InputDecoration(
//       hintText: 'Enter description',
//       border: OutlineInputBorder(),
//       contentPadding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 12.0),
//       // contentPadding: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
//     ),
//   ),
// ),








//               SizedBox(height: 16),
//            ElevatedButton(
//   onPressed: () {
//     // Perform action when the button is pressed
//   },
//   style: ElevatedButton.styleFrom(
//     primary: Colors.red,
//     onPrimary: Colors.white,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(8.0),
//     ),
//   ),
//   child: Padding(
//     padding: EdgeInsets.only(left:30.0,right:30.0,top:8.0,bottom:8.0),
//     child: Text(
//       'Post',
//       style: TextStyle(fontSize: 16.0),
//     ),
//   ),
// ),

//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: MyBottomNavigationBar(),
//     );
//   }
// }
