import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/core/service/navigation/navigator_service_impl.dart';
import 'package:bagzz/core/service/snack_bar_service/snack_bar_service.dart';
import 'package:bagzz/core/service/snack_bar_service/snack_bar_service_impl.dart';
import 'package:bagzz/ui/views/home/home_screen.dart';
import 'package:bagzz/ui/views/main/main_screen.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: MainScreen, initial: true),
    CustomRoute(
        page: HomeScreen,
        name: 'MainPage',
        durationInMilliseconds: 800,
        transitionsBuilder: TransitionsBuilders.fadeIn),
  ], dependencies: [

  Singleton(classType: NavigationServiceImpl, asType: NavigationService),
  LazySingleton(classType: SnackBarServiceImpl, asType: SnackBarService),
]
)
class App {}
