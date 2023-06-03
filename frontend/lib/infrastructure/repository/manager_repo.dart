import 'package:students_voice/infrastructure/data_provider/manager_data_provider.dart';

class ManagerRepository {
  final managerDataProvider dataProvider = managerDataProvider();

  Future<dynamic> getAnnouncements() async {
    return dataProvider.getAnnouncements();
  }

  Future<dynamic> getReportedcomplaints(user) async {
    return dataProvider.getReportedComplaint(user);
  }

  Future<dynamic> getOngoingcomplaints(user) async {
    return dataProvider.getOngoingComplaint(user);
  }

  Future<dynamic> getSolvedcomplaints(user) async {
    return dataProvider.getSolvedcomplaints(user);
  }

  Future<dynamic> deletecomplaint(id) async {
    return dataProvider.deletecomplaint(id);
  }

  Future<dynamic> moveToOngoing(id) async {
    return dataProvider.moveToOngoing(id);
  }

  Future<dynamic> moveToSolved(id) async {
    return dataProvider.moveToSolved(id);
  }
   Future<dynamic> getAnnouncement(id) async {
    return dataProvider.moveToSolved(id);
  }

  Future<dynamic> updateAnnouncement(id) async {
    return dataProvider.moveToSolved(id);
  }
  Future<dynamic> deleteAnnouncement(id) async {
    return dataProvider.moveToSolved(id);
  }
}

