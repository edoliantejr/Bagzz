import 'package:bagzz/models/login_response.dart';
import 'package:bagzz/models/user.dart';

abstract class FireBaseAuthService {
  Future<LoginResponse> loginWithEmail({required String email, required String password});

  Future<LoginResponse> signUpWithEmail({required String email, required String password});

  Future loginWithGoogle();

  Future? loginWithFacebook();

  Future? loginWithTwitter();

  Future<void> logOut();

  Future<void> createUserIfNotExist(User user);
}
