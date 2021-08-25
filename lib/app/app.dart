import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/api/api_service_impl.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service_impl.dart';
import 'package:bagzz/core/service/snack_bar_service/snack_bar_service.dart';
import 'package:bagzz/core/service/snack_bar_service/snack_bar_service_impl.dart';
import 'package:bagzz/ui/views/bag_item_details/bag_item_details_page.dart';
import 'package:bagzz/ui/views/home/home_screen.dart';
import 'package:bagzz/ui/views/main/main_screen_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  MaterialRoute(page: MainScreen, initial: true),
  CustomRoute(
      page: HomeScreen,
      name: 'MainPage',
      durationInMilliseconds: 200,
      transitionsBuilder: TransitionsBuilders.slideLeft),
  CustomRoute(
      page: BagItemDetailsPage,
      name: 'BagItemDetailsPage',
      durationInMilliseconds: 200,
      transitionsBuilder: TransitionsBuilders.fadeIn),
], dependencies: [
  Singleton(classType: NavigationServiceImpl, asType: NavigationService),
  LazySingleton(classType: SnackBarServiceImpl, asType: SnackBarService),
  LazySingleton(classType: ApiServiceImp, asType: ApiService),
])
class App {}
