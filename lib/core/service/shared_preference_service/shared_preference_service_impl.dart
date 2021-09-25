import 'package:bagzz/core/service/shared_preference_service/shared_preference_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceServiceImpl extends SharedPreferenceService {
  Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();

  @override
  Future saveLoginDetails({required UserCredential user}) async {
    final sharedPref = await _sharedPreferences;

    sharedPref.setString('uid', user.user!.uid);
    sharedPref.setString('token', await user.user!.getIdToken());
    sharedPref.setString('credential', user.credential.toString());
  }

  @override
  Future checkSavedLoginDetails() async {
    bool doesExist = false;
    final sharedPref = await _sharedPreferences;
    try {
      final uid = sharedPref.getString('uid');
      final token = sharedPref.getString('token');
      final credential = sharedPref.getString('credential');
      if (uid != null || token != null || credential != null) {
        doesExist = true;
      }
    } catch (e) {
      print(e);
    }
    return doesExist;
  }

  @override
  Future deleteSavedLoginDetails() async {
    final sharedPref = await _sharedPreferences;
    sharedPref.remove('uid');
    sharedPref.remove('token');
    sharedPref.remove('credentials');
    sharedPref.clear();
  }
}
