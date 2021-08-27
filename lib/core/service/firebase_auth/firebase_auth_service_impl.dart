
import 'package:bagzz/core/service/firebase_auth/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthServiceImpl extends FireBaseAuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future loginWithEmail({required String email, required String password}) async{
   try {
     var user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
     return user != null;
   } on Exception catch (e) {
    return e.toString();
   }
  }

  @override
  Future signUpWithEmail({required String email, required String password}) async{
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return authResult !=null;
    } on Exception catch (e) {
      return e.toString();
    }
  }

}