import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:students_voice/models/models.dart';

class UserDataProvider {
  String baseUrl = 'http://10.0.2.2:3000';
  final storage = const FlutterSecureStorage();

  Future<dynamic> getUser(dynamic username, dynamic password) async {
    var response = await http.post(
      Uri.parse(baseUrl + '/login'),
      headers: {"Content.type": "application/json"},
      body: {'username': username, 'password': password},
    );
    if (response.statusCode == 200) {
      const storage = FlutterSecureStorage();
      await storage.write(
          key: "token", value: "${jsonDecode(response.body)["user"]['token']}");
      dynamic json = jsonDecode(response.body);
      dynamic user = User.fromJson(json['user']);
      return user;
    } else {
      return response.statusCode;
    }
  }

  Future<dynamic> signUpUser(Map<String, dynamic> body) async {
    var response = await http.post(
      Uri.parse(baseUrl + '/user/signup'),
      headers: {"Content.type": "application/json"},
      body: body,
    );
    return response;
  }

  // Future<dynamic> getSamplecomplaint() async {
  //   var response = await http.get(Uri.parse(baseUrl + '/user/complaintSample'));
  //   if (response.statusCode == 200) {
  //     List<dynamic> djson = jsonDecode(response.body);
  //     List<Samplecomplaint> samplecomplaint =
  //         djson.map((json) => Samplecomplaint.fromJson(json)).toList();
  //     return samplecomplaint;
  //   } else {
  //     throw Exception("Failed to get complaint samples ");
  //   }
  // }

 

Future<dynamic> reportComplaint(dynamic complaint) async {
  final response = await http.post(
    Uri.parse(baseUrl + '/user/reportComplaint'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(complaint.toJson()),
  );

  if (response.statusCode == 200) {
    dynamic jsonData = jsonDecode(response.body);
    return jsonData;
  } else {
    throw Exception("Failed to report complaint");
  }
}


  Future<dynamic> getMyReport(String user) async {
    var response = await http.get(
      Uri.parse(baseUrl + '/user/myreports/$user'),
      headers: {"Content.type": "application/json"},
    );
    return response;
  }

  Future<dynamic> updateProfile(dynamic email,
      dynamic password, dynamic fullname) async {
    var response = await http
        .patch(Uri.parse(baseUrl + '/profile/update/profile'), headers: {
      "Content.type": "application/json"
    }, body: {
      "email": email,
      "password": password,
      "fullname": fullname
    });

    return response;
  }

  Future<dynamic> deleteReported(id) async {
    var response = await http.get(
      Uri.parse(baseUrl + '/manager/complaint/delete/$id'),
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to get complaint");
    }
  }
}
