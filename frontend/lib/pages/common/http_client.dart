// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ApiClient {
//   final String baseUrl;

//   ApiClient({required this.baseUrl});

//   Future<ApiResponse> login(String email, String password) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/api/login'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'email': email, 'password': password}),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return ApiResponse(success: true, data: data);
//     } else {
//       final error = 'An error occurred';
//       return ApiResponse(success: false, error: error);
//     }
//   }

//   Future<ApiResponse> signup(String email, String password) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/api/signup'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'email': email, 'password': password}),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return ApiResponse(success: true, data: data);
//     } else {
//       final error = 'An error occurred';
//       return ApiResponse(success: false, error: error);
//     }
//   }
// }

// class ApiResponse {
//   final bool success;
//   final dynamic data;
//   final String? error;

//   ApiResponse({required this.success, this.data, this.error});
// }



import 'package:http/http.dart' as http;

class ApiClient {
  Future<http.Response> post(String url, {dynamic body}) async {
    final response = await http.post(Uri.parse('http://localhost:3000$url'),
        body: body);
    return response;
  }
}
