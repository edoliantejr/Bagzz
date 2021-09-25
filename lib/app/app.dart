import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/api/api_service_impl.dart';
import 'package:bagzz/core/service/dialog_service/dialog_service.dart';
import 'package:bagzz/core/service/dialog_service/dialog_service_impl.dart';
import 'package:bagzz/core/service/firebase_auth/firebase_auth_service.dart';
import 'package:bagzz/core/service/firebase_auth/firebase_auth_service_impl.dart';
import 'package:bagzz/core/service/firebase_cloud_storage/cloud_storage_service.dart';
import 'package:bagzz/core/service/firebase_cloud_storage/cloud_storage_service_impl.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service_impl.dart';
import 'package:bagzz/core/service/shared_preference_service/shared_preference_service.dart';
import 'package:bagzz/core/service/shared_preference_service/shared_preference_service_impl.dart';
import 'package:bagzz/core/service/snack_bar_service/snack_bar_service.dart';
import 'package:bagzz/core/service/snack_bar_service/snack_bar_service_impl.dart';
import 'package:bagzz/core/utility/connectivity_state.dart';
import 'package:bagzz/core/utility/image_selector.dart';
import 'package:bagzz/ui/views/bag_item_details/bag_item_details_page.dart';
import 'package:bagzz/ui/views/cart/cart_page_view.dart';
import 'package:bagzz/ui/views/choose_category/choose_category_page.dart';
import 'package:bagzz/ui/views/home/home_screen.dart';
import 'package:bagzz/ui/views/login/login.dart';
import 'package:bagzz/ui/views/main/main_screen_view.dart';
import 'package:bagzz/ui/views/pre_loader_screen/pre_loader_screen.dart';
import 'package:bagzz/ui/views/publish_bag/bag_upload.dart';
import 'package:bagzz/ui/views/register/register_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  MaterialRoute(page: PreLoaderScreen, name: 'PreLoaderScreen', initial: true),
  CustomRoute(
      page: Login,
      name: 'LogIn',
      durationInMilliseconds: 300,
      transitionsBuilder: TransitionsBuilders.fadeIn),
  CustomRoute(
      page: MainScreen,
      name: 'MainScreen',
      durationInMilliseconds: 400,
      transitionsBuilder: TransitionsBuilders.slideLeft),
  CustomRoute(
      page: HomeScreen,
      name: 'HomeScreen',
      durationInMilliseconds: 300,
      transitionsBuilder: TransitionsBuilders.slideLeft),
  CustomRoute(
      page: BagItemDetailsPage,
      name: 'BagItemDetailsPage',
      durationInMilliseconds: 300,
      transitionsBuilder: TransitionsBuilders.fadeIn),
  CustomRoute(
      page: CartPage,
      name: 'CartPage',
      durationInMilliseconds: 300,
      transitionsBuilder: TransitionsBuilders.slideTop),
  CustomRoute(
      page: BagUpload,
      name: 'BagUpload',
      durationInMilliseconds: 200,
      transitionsBuilder: TransitionsBuilders.fadeIn),
  CustomRoute(
      page: ChooseCategory,
      name: 'ChooseCategory',
      durationInMilliseconds: 200,
      transitionsBuilder: TransitionsBuilders.slideLeft),
  CustomRoute(
      page: Register,
      name: 'Register',
      durationInMilliseconds: 300,
      transitionsBuilder: TransitionsBuilders.fadeIn),
], dependencies: [
  Singleton(classType: NavigationServiceImpl, asType: NavigationService),
  LazySingleton(classType: ApiServiceImpl, asType: ApiService),
  LazySingleton(classType: SnackBarServiceImpl, asType: SnackBarService),
  LazySingleton(
      classType: FireBaseAuthServiceImpl, asType: FireBaseAuthService),
  LazySingleton(
      classType: CloudStorageServiceImpl, asType: CloudStorageService),
  LazySingleton(classType: ImageSelector),
  LazySingleton(classType: DialogServiceImpl, asType: DialogService),
  LazySingleton(
      classType: SharedPreferenceServiceImpl, asType: SharedPreferenceService),
  LazySingleton(classType: ConnectivityStateCheck),
])
class App {}
