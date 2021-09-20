import 'package:firebase_auth/firebase_auth.dart';

class LoginResponse {
  final User? user;
  final bool success;
  final String? errorMessage;

  LoginResponse._({this.user, required this.success, this.errorMessage});

  factory LoginResponse.success(User user) =>
      LoginResponse._(success: true, user: user);

  factory LoginResponse.error(String message) =>
      LoginResponse._(success: false, errorMessage: message);
}
