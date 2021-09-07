// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../core/service/api/api_service.dart';
import '../core/service/api/api_service_impl.dart';
import '../core/service/dialog_service/dialog_service.dart';
import '../core/service/dialog_service/dialog_service_impl.dart';
import '../core/service/firebase_auth/firebase_auth_service.dart';
import '../core/service/firebase_auth/firebase_auth_service_impl.dart';
import '../core/service/firebase_cloud_storage/cloud_storage_service.dart';
import '../core/service/firebase_cloud_storage/cloud_storage_service_impl.dart';
import '../core/service/navigation/navigator_service.dart';
import '../core/service/navigation/navigator_service_impl.dart';
import '../core/service/snack_bar_service/snack_bar_service.dart';
import '../core/service/snack_bar_service/snack_bar_service_impl.dart';
import '../core/utility/image_selector.dart';

final locator = StackedLocator.instance;

void setupLocator({String? environment, EnvironmentFilter? environmentFilter}) {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerSingleton<NavigationService>(NavigationServiceImpl());
  locator.registerLazySingleton<ApiService>(() => ApiServiceImpl());
  locator.registerLazySingleton<SnackBarService>(() => SnackBarServiceImpl());
  locator.registerLazySingleton<FireBaseAuthService>(
      () => FireBaseAuthServiceImpl());
  locator.registerLazySingleton<CloudStorageService>(
      () => CloudStorageServiceImpl());
  locator.registerLazySingleton(() => ImageSelector());
  locator.registerLazySingleton<DialogService>(() => DialogServiceImpl());
}
