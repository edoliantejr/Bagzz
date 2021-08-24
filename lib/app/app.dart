import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/api/api_service_impl.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service_impl.dart';
import 'package:bagzz/core/service/snack_bar_service/snack_bar_service.dart';
import 'package:bagzz/core/service/snack_bar_service/snack_bar_service_impl.dart';
import 'package:bagzz/ui/views/bag_item_details/bag_item_details_page.dart';
import 'package:bagzz/ui/views/cart/cart_screen.dart';
import 'package:bagzz/ui/views/home/home_screen.dart';
import 'package:bagzz/ui/views/main/main_screen.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  MaterialRoute(page: MainScreen, initial: true),
  CustomRoute(
      page: HomeScreen,
      name: 'MainPage',
      durationInMilliseconds: 800,
      transitionsBuilder: TransitionsBuilders.fadeIn),
  CustomRoute(
      page: BagItemDetailsPage,
      name: 'BagItemDetailsPage',
      durationInMilliseconds: 800,
      transitionsBuilder: TransitionsBuilders.zoomIn),
  CustomRoute(
      page: CartPage,
      name: 'CartPage',
      durationInMilliseconds: 300,
      transitionsBuilder: TransitionsBuilders.slideTop),
], dependencies: [
  Singleton(classType: NavigationServiceImpl, asType: NavigationService),
  LazySingleton(classType: SnackBarServiceImpl, asType: SnackBarService),
  LazySingleton(classType: ApiServiceImpl, asType: ApiService),
])
class App {}
