import 'package:bagzz/core/service/shared_preference_service/shared_preference_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceServiceImpl extends SharedPreferenceService {
  @override
  Future saveLoginDetails({required UserCredential user}) async {
    final sharedPref = await SharedPreferences.getInstance();

    sharedPref.setString('uid', user.user!.uid);
    sharedPref.setString('token', await user.user!.getIdToken());
    sharedPref.setString('credential', user.credential.toString());
  }

  @override
  Future checkSavedLoginDetails() async {
    bool doesExist = false;
    final sharedPref = await SharedPreferences.getInstance();
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
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove('uid');
    sharedPref.remove('token');
    sharedPref.remove('credentials');
    sharedPref.clear();
  }
}
