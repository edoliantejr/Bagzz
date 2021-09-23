import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/app/app.router.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/firebase_auth/firebase_auth_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/core/service/shared_preference_service/shared_preference_service.dart';
import 'package:stacked/stacked.dart';

class DrawerViewModel extends BaseViewModel {
  final firebaseAuthService = locator<FireBaseAuthService>();
  final navigationService = locator<NavigationService>();
  final apiService = locator<ApiService>();
  final sharedPrefService = locator<SharedPreferenceService>();

  void goToPublishBag() async {
    navigationService.pushNamedAndRemoveUntil(Routes.BagUpload,
        predicate: (dynamic) => true);
  }

  void logout() async {
    await firebaseAuthService.logOut();
    await sharedPrefService.deleteSavedLoginDetails();
    navigationService.pushReplacementNamed(Routes.LogIn);
  }
}
