import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/core/service/firebase_auth/firebase_auth_service.dart';
import 'package:bagzz/core/service/shared_preference_service/shared_preference_service.dart';
import 'package:bagzz/models/login_response.dart';
import 'package:bagzz/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseAuthServiceImpl implements FireBaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String errorMessage = '';
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  GoogleSignInAccount? googleSignInAccount;
  GoogleSignInAuthentication? googleSignInAuthentication;
  AuthCredential? authCredential;
  UserCredential? authResult;

  final sharedPrefService = locator<SharedPreferenceService>();

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
          errorMessage = "Incorrect password";
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
      googleSignInAccount = await _googleSignIn.signIn().catchError((onError) {
        print(onError);
      });

      googleSignInAuthentication = await googleSignInAccount!.authentication;
      authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication!.accessToken,
          idToken: googleSignInAuthentication!.idToken);

      authResult = await _firebaseAuth
          .signInWithCredential(authCredential!)
          .catchError((onError) {
        print(onError);
      });

      if (authResult != null) {
        var token = await FirebaseMessaging.instance.getToken();
        createUserIfNotExist(
          User(
              id: authResult!.user!.uid,
              email: authResult!.user!.email!,
              name: authResult!.user!.displayName!,
              image: authResult!.user!.photoURL!,
              token: token ?? await authResult!.user!.getIdToken(),
              favoriteBags: []),
        );
      }

      sharedPrefService.saveLoginDetails(user: authResult!);
      return LoginResponse.success(authResult!.user!);
    } catch (e) {
      return LoginResponse.error('$e');
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

  @override
  Future<void> logOut() async {
    //not sure
    await _firebaseAuth.signOut();
    if (authCredential != null) {
      _googleSignIn.disconnect();
    }
  }

  @override
  Future<void> createUserIfNotExist(User user) async {
    final userRef = FirebaseFirestore.instance.collection('users').doc(user.id);
    final userDoc = await userRef.get();
    if (!userDoc.exists) {
      userRef.set(user.toJson());
    }
  }

  @override
  Future<void> saveTokenToDatabase({required String token}) async {
    String userId = _firebaseAuth.currentUser!.uid;

    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'token': token,
    });
  }
}
