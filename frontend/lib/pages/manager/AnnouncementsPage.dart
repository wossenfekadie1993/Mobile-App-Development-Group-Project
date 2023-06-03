import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_voice/application/manager/bloc/manager_bloc.dart';
import 'announcements_bloc.dart';

class AnnouncementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnnouncementsBloc()..add(LoadAnnouncements()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Announcements Page'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Column(
              children: [
                BlocBuilder<AnnouncementsBloc, AnnouncementsState>(
                  builder: (context, state) {
                    if (state is AnnouncementsLoading) {
                      return CircularProgressIndicator();
                    } else if (state is AnnouncementsLoaded) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.announcements.length,
                        itemBuilder: (context, index) {
                          final announcement = state.announcements[index];
                          return Card(
                            margin: EdgeInsets.all(8.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'ring.jpg',
                                    width: 150.0,
                                    height: 150.0,
                                  ),
                                ),
                                Text(
                                  announcement.title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  announcement.description,
                                  textAlign: TextAlign.center,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 15),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  child: Text(
                                    'View More',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else if (state is AnnouncementsError) {
                      return Text(state.message);
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar(),
      ),
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [],
      // Customize your bottom navigation bar
    );
  }
}
