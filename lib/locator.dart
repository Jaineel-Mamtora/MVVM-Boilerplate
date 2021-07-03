import 'package:get_it/get_it.dart';

import './services/navigation_service.dart';
import './services/connectivity_service.dart';

import './viewmodels/home_viewmodel.dart';
import './viewmodels/startup_viewmodel.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ConnectivityService());

  locator.registerFactory(() => StartUpViewModel());
  locator.registerFactory(() => HomeViewModel());
}
