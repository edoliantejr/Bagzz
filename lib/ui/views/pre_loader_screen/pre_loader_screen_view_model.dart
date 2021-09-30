import 'dart:io';

import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/app/app.router.dart';
import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/dialog_service/dialog_service.dart';
import 'package:bagzz/core/service/firebase_auth/firebase_auth_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/core/service/shared_preference_service/shared_preference_service.dart';
import 'package:bagzz/core/utility/connectivity_state.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class PreLoaderScreenViewModel extends BaseViewModel {
  final apiService = locator<ApiService>();
  final connectivityService = locator<ConnectivityStateCheck>();
  final dialogService = locator<DialogService>();
  final sharedPrefService = locator<SharedPreferenceService>();
  final navigatorService = locator<NavigationService>();
  final fireBaseAuthService = locator<FireBaseAuthService>();

  bool userExist = false;
  bool isConnected = false;

  Future<void> init() async {
    setBusy(true);
    await checkNetworkState();
    await Future.delayed(Duration(milliseconds: 500));
    await checkLoginState();
    verifyData();
    setBusy(false);
  }

  Future<void> checkNetworkState() async {
    isConnected = await connectivityService.checkConnectivity();
    notifyListeners();
  }

  checkLoginState() async {
    userExist = await sharedPrefService.checkSavedLoginDetails();
    notifyListeners();
  }

  void verifyData() {
    if (!isConnected && userExist) {
      dialogService.showConfirmationDialog(
        title: 'No Internet Connection',
        middleText:
            'Check your Internet Connection \n or Continue without Internet',
        onCancel: () {
          Get.back(canPop: false);
          exit(0);
        },
        onContinue: () {
          navigatorService.pushNamedAndRemoveUntil(Routes.MainScreen,
              predicate: (route) => false);
        },
        textConfirm: 'Continue offline?',
        willPop: false,
      );
    } else if (!isConnected && !userExist) {
      dialogService.showConfirmationDialog(
          title: 'No Internet Connection',
          middleText: 'Connect to internet to continue',
          onCancel: () => exit(0),
          onContinue: () async {
            Get.back(canPop: false);
            init();
          },
          willPop: false,
          textConfirm: 'Retry');
    } else if (isConnected && !userExist) {
      navigatorService.pushNamedAndRemoveUntil(Routes.LogIn,
          predicate: (route) => false);
    } else if (isConnected && userExist) {
      navigatorService.pushNamedAndRemoveUntil(Routes.MainScreen,
          predicate: (route) => false);
    }
  }
}
