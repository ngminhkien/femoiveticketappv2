import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class GoogleSignInService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );

  static Future<Map<String, dynamic>?> signInWithGoogle() async {
    try {
      // Bước 1: Chọn tài khoản Google
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      // Bước 2: Lấy token Google
      final googleAuth = await googleUser.authentication;
      final idToken = googleAuth.idToken;

      // Bước 3: Gửi token lên backend Spring Boot
      final response = await http.post(
        Uri.parse("http://10.0.2.2:6969/auth/google"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"idToken": idToken}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("Google Login Error: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Google Sign-In exception: $e");
      return null;
    }
  }

  static Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
