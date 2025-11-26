// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class AuthService {
//   final String baseUrl = "http://10.0.2.2:6969/moblie/auth";
//
//   Future<String?> login(String email, String password) async {
//     final url = Uri.parse("$baseUrl/token");
//
//     final response = await http.post(
//       url,
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode({
//         "email": email,
//         "password": password,
//       }),
//     );
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return data["token"]; // backend trả token JSON
//     } else {
//       return null; // trả null nếu sai tài khoản
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = "http://10.0.2.2:6969/moblie/auth/token";

  static Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": email,
          "matKhau": password,
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Lỗi khi gọi API: $e");
      return false;
    }

    // final response = await http.post(
    //   url,
    //   headers: {"Content-Type": "application/json"},
    //   body: jsonEncode({
    //     "email": email,
    //     "password": password,
    //   }),
    // );
    //
    // if (response.statusCode == 200) {
    //   return true;
    // } else {
    //   return false;
    // }
  }
}
