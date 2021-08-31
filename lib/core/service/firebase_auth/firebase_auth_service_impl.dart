import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/app/app.router.dart';
import 'package:bagzz/core/service/firebase_auth/firebase_auth_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/core/service/snack_bar_service/snack_bar_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthServiceImpl implements FireBaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final snackBarService = locator<SnackBarService>();
  final navigationService = locator<NavigationService>();
  late String errorMessage;

  @override
  Future loginWithEmail(
      {required String email, required String password}) async {
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      navigationService.pushReplacementNamed(Routes.MainScreen);
      return user!=null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "unknown":
          errorMessage = "Email and Password is empty.";
          break;
        case "invalid-email":
          errorMessage = "Invalid Email Account.";
          break;
        case "user-not-found":
          errorMessage = "No account associated with this email.";
          break;
        case "wrong-password":
          errorMessage = "Incorrect password";
          break;
        default:
          errorMessage = e.toString();
          break;
      }
      return snackBarService.showSnackBar(errorMessage);
    }
  }

  @override
  Future signUpWithEmail(
      {required String email, required String password}) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      //TODO: return something if sign up is successful
    } on FirebaseAuthException catch (e) {
      switch (e.code) {    
               
           
        case "unknown":
          errorMessage = "Email and Password is empty.";
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
      return snackBarService.showSnackBar(errorMessage);
    }
  }
}
