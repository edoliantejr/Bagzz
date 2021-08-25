// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../core/service/api/api_service.dart';
import '../core/service/api/api_service_impl.dart';
import '../core/service/navigation/navigator_service.dart';
import '../core/service/navigation/navigator_service_impl.dart';
import '../core/service/snack_bar_service/snack_bar_service.dart';
import '../core/service/snack_bar_service/snack_bar_service_impl.dart';

final locator = StackedLocator.instance;

void setupLocator({String? environment, EnvironmentFilter? environmentFilter}) {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerSingleton<NavigationService>(NavigationServiceImpl());
  locator.registerLazySingleton<SnackBarService>(() => SnackBarServiceImpl());
  locator.registerLazySingleton<ApiService>(() => ApiServiceImp());
}
