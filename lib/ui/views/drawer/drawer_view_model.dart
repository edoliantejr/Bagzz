import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/app/app.router.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/firebase_auth/firebase_auth_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:stacked/stacked.dart';

class DrawerViewModel extends BaseViewModel {
  final firebaseAuthService = locator<FireBaseAuthService>();
  final navigationService = locator<NavigationService>();
  final apiService = locator<ApiService>();

  void goToPublishBag() async {
    navigationService.pushNamedAndRemoveUntil(Routes.BagUpload,
        predicate: (dynamic) => true);
  }

  void logout() async {
    await firebaseAuthService.logOut();
    navigationService.pushReplacementNamed(Routes.LogIn);
  }
}
