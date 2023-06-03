import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/announcement_model/announcement.dart';
import '../../models/complaint_model/complaint_report.dart';

class managerDataProvider {
  String baseUrl = 'http://localhost:3000';

  Future<dynamic> getOngoingComplaint(user) async {
    var response = await http.get(
      Uri.parse(baseUrl + '/manager/reportedComplaint/$user/ongoing'),
    );
    if (response.statusCode == 200) {
      var complaintList = response;
      return complaintList;
    } else {
      throw Exception("Failed to get complaint");
    }
  }

  Future<dynamic> getSolvedcomplaints(user) async {
    var response = await http.get(
      Uri.parse(baseUrl + '/manager/reportedComplaint/$user/solved'),
    );
    if (response.statusCode == 200) {
      var complaintList = response;
      return complaintList;
    } else {
      throw Exception("Failed to getcomplaint");
    }
  }

  dynamic getReportedComplaint(String jeson) {
    dynamic json = jsonDecode(jeson);
    dynamic reportedcomplaint = Report.fromJson(json);
    return reportedcomplaint;
  }

  Future<dynamic> deletecomplaint(id) async {
    var response = await http.get(
      Uri.parse(baseUrl + '/manage/complaint/delete/$id'),
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to getcomplaint");
    }
  }

  Future<dynamic> moveToOngoing(id) async {
    var response = await http.patch(
      Uri.parse(baseUrl + '/manager/ongoing/$id'),
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to movecomplaint");
    }
  }

  Future<dynamic> moveToSolved(id) async {
    var response = await http.patch(
      Uri.parse(baseUrl + '/manager/solved/$id'),
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to movecomplaint");
    }
  }

  Future<List<Announcement>> getAnnouncements() async {
    var response = await http.get(Uri.parse(baseUrl + '/announcements'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List<dynamic>;
      var announcements =
          data.map((item) => Announcement.fromJson(item)).toList();
      return announcements;
    } else {
      throw Exception('Failed to get announcements');
    }
  }

  Future<Announcement> createAnnouncement(Announcement announcement) async {
    var body = jsonEncode(announcement.toJson());
    var response = await http.post(
      Uri.parse(baseUrl + '/announcements'),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      var createdAnnouncement = Announcement.fromJson(data);
      return createdAnnouncement;
    } else {
      throw Exception('Failed to create announcement');
    }
  }

  Future<Announcement> updateAnnouncement(Announcement announcement) async {
    var body = jsonEncode(announcement.toJson());
    var response = await http.put(
      Uri.parse(baseUrl + '/announcements/${announcement.id}'),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var updatedAnnouncement = Announcement.fromJson(data);
      return updatedAnnouncement;
    } else {
      throw Exception('Failed to update announcement');
    }
  }

  Future<void> deleteAnnouncement(String id) async {
    var response = await http.delete(Uri.parse(baseUrl + '/announcements/$id'));
    if (response.statusCode != 204) {
      throw Exception('Failed to delete announcement');
    }
  }
}
