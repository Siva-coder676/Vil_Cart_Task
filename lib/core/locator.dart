import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vil_cart_task/core/logger.dart';
import 'package:vil_cart_task/core/service/local_service.dart';
import 'package:vil_cart_task/core/service/login_service.dart';
import 'package:vil_cart_task/core/service/product_service.dart';

final GetIt locator = GetIt.instance;

class LocatorInjector {
  static Future<void> setUpLocator() async {
    Logger log = getLogger('Locator Injector');
    log.d('Registering Navigation Service');
    locator.registerLazySingleton(() => NavigationService());
    // log.d('Registering Snackbar Service');
    // locator.registerLazySingleton(() => SnackbarService());
    log.d("Registering Local service");
    locator.registerLazySingleton(() => LocalService(preferences: locator()));
    log.d('Registering shared preferences  Service');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    locator.registerLazySingleton(() => prefs);
    log.d('Registering Login service');
    locator.registerLazySingleton(() => LoginService());
    log.d('Product Service');
    locator.registerLazySingleton(() => ProductService());
  }
}
