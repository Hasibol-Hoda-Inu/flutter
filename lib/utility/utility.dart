import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> writeUserData(Map<String, dynamic> userData) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', userData['token']);
  await prefs.setString('email', userData['data']['email']);
  await prefs.setString('firstName', userData['data']['firstName']);
  await prefs.setString('lastName', userData['data']['lastName']);
  await prefs.setString('mobile', userData['data']['mobile']);
  await prefs.setString('photo', userData['data']['photo']);
}

Future<void> writeEmailVerification(String email) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('email', email);
}

Future<void> writeOTPVerification(String OTP) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('OTP', OTP);
}

Future<String?> readUserData(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? myData = prefs.getString(key);
  return myData;
}

Future<bool> removeToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
  return true;
}

Uint8List showBase64Image(String base64String) {
  try {
    UriData data = Uri.parse(base64String).data!;
    Uint8List image = data.contentAsBytes();
    return image;
  } catch (e) {
    // Handle the error, for example, log it or return a default image.
    print('Error decoding base64 image: $e');
    return Uint8List(0);
  }
}
