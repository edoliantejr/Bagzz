import 'package:bagzz/core/service/firebase_auth/firebase_auth_service.dart';
import 'package:bagzz/models/login_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseAuthServiceImpl implements FireBaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late final String errorMessage;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly']);
  late final GoogleSignInAccount? googleSignInAccount;
  late final GoogleSignInAuthentication googleSignInAuthentication;
  late final AuthCredential authCredential;
  late final UserCredential authResult;

  @override
  Future<LoginResponse> loginWithEmail(
      {required String email, required String password}) async {
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return LoginResponse.success(user.user!);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "unknown":
          errorMessage = e.toString();
          break;
        case "invalid-email":
          errorMessage = "Invalid Email Account.";
          break;
        case "user-not-found":
          errorMessage = "No account associated with this email.";
          break;
        case "wrong-password":
          errorMessage = "Incorrect pa3ssword";
          break;
        default:
          errorMessage = e.toString();
          break;
      }
      return LoginResponse.error(errorMessage);
    }
  }

  @override
  Future<LoginResponse> signUpWithEmail(
      {required String email, required String password}) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return LoginResponse.success(authResult.user!);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "unknown":
          errorMessage = e.toString();
          break;
        case "invalid-email":
          errorMessage = "Not A Valid Email Acct.";
          break;
        case "weak-password":
          errorMessage = "Password should be minimum of 8 characters.";
          break;
        case "email-already-in-use":
          errorMessage = "Email is already in use. Try logging in.";
          break;
        default:
          errorMessage = e.toString();
          break;
      }
      return LoginResponse.error(errorMessage);
    }
  }

  @override
  Future<LoginResponse> loginWithGoogle() async {
    try {
      googleSignInAccount = await _googleSignIn.signIn().catchError((onError){});

        googleSignInAuthentication = await googleSignInAccount!.authentication;
        authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);

      if (authCredential!=null) {
        authResult = await _firebaseAuth
            .signInWithCredential(authCredential)
            .catchError((onError) {
          print(onError);
        });
      }
      return LoginResponse.success(authResult.user!);
    } catch (e) {
      return LoginResponse.error(e.toString());
    }
  }

  @override
  Future? loginWithFacebook() {
    // TODO: implement loginWithFacebook
    throw UnimplementedError();
  }

  @override
  Future? loginWithTwitter() {
    // TODO: implement loginWithTwitter
    throw UnimplementedError();
  }
}
