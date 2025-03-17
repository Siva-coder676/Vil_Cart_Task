import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vil_cart_task/core/locator.dart';
import 'package:vil_cart_task/core/router_constants.dart';
import 'package:vil_cart_task/core/service/local_service.dart';
import 'package:vil_cart_task/views/product_list/product_list_view.dart';
import 'core/router.dart' as route;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocatorInjector.setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getTokenValid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: route.Router.generateRoute,
      initialRoute: loginViewRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }

  getTokenValid() async {
    final _localService = locator<LocalService>();
    final _navigationService = locator<NavigationService>();

    String token = await _localService.getToken();
    if (token.isNotEmpty) {
      _navigationService.navigateWithTransition(ProductListView(),
          transition: "fade");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Login Failed!!!"),
        backgroundColor: const Color(0xFF005D71),
      ));
    }
  }
}
