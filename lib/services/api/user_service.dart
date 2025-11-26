// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/user_request.dart';
//
// class UserService {
//   static const String baseUrl = 'http://10.0.2.2:6969/moblie/users';
//
//   /// Tạo user mới (đăng ký)
//   static Future<Map<String, dynamic>> createUser(UserRequest request) async {
//     final response = await http.post(
//       Uri.parse(baseUrl),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(request.toJson()),
//     );
//
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return json.decode(response.body);
//     } else {
//       throw Exception(
//         'Lỗi tạo người dùng: ${response.statusCode} - ${response.body}',
//       );
//     }
//   }
// }


import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  static const String baseUrl = "http://10.0.2.2:6969/moblie/users";

  static Future<bool> registerUser(Map<String, dynamic> userData) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(userData),
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print("Lỗi khi gọi API: $e");
      return false;
    }
  }
}
