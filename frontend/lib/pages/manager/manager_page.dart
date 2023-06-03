
import 'package:flutter/material.dart';
import 'package:students_voice/pages/manager/repsolope/repsolope.dart';
import '../common/bottom_navigation_bar.dart';
import 'AnnouncementsPage.dart';
import 'announcement_form.dart';
import 'complaint_page.dart';
import 'issue/exam_issue_page.dart';
import 'issue/food_issue_page.dart';
import 'issue/gender_issue_page.dart';
import 'issue/staff_issue_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'complaints_bloc.dart';
import 'complaint_page.dart';
import 'package:students_voice/pages/common/bottom_navigation_bar.dart' as common;
import 'package:students_voice/pages/manager/AnnouncementsPage.dart' as announcements;
import 'package:students_voice/pages/manager/complaint_page.dart' as complaint;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComplaintsBloc>(
      create: (context) => ComplaintsBloc(),
      child: MaterialApp(
        title: 'Students Voice',
        home: ManagerPage(),
      ),
    );
  }
}

class ManagerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students Voice'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ComplaintsPage()),
                      );
                    },
                    child: Text(
                      'Complaints',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnnouncementsPage()),
                      );
                    },
                    child: Text(
                      'Announcements',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReportedPage()),
                      );
                    },
                    child: Text(
                      'Reported',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OngoingPage()),
                      );
                    },
                    child: Text(
                      'Ongoing',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PendingPage()),
                      );
                    },
                    child: Text(
                      'Pending',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SolvedPage()),
                      );
                    },
                    child: Text(
                      'Solved',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset('assets/food.jpg'),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodIssuePage()),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Food Issue',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text('Food Sample'),
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
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset('assets/gender.jpg'),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GenderIssuePage()),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gender Issue',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text('Gender Sample'),
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
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset('assets/exam.jpg'),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExamIssuePage()),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Exam Issue',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text('Exam Sample'),
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
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset('assets/staff.jpg'),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StaffIssuePage()),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Staff Issue',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text('Staff Sample'),
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: common.MyBottomNavigationBar(),
    );
  }
}