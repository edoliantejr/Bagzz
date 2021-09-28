import 'package:firebase_auth/firebase_auth.dart';

abstract class SharedPreferenceService {
  Future<void> saveLoginDetails({required UserCredential user});

  Future<bool> checkSavedLoginDetails();

  Future<void> deleteSavedLoginDetails();
}
