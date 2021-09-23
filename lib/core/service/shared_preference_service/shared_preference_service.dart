import 'package:firebase_auth/firebase_auth.dart';

abstract class SharedPreferenceService {
  Future saveLoginDetails({required UserCredential user});

  Future checkSavedLoginDetails();

  Future deleteSavedLoginDetails();
}
