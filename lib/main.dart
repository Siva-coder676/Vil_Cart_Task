import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vil_cart_task/core/locator.dart';
import 'package:vil_cart_task/core/router_constants.dart';
import 'core/router.dart' as route;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocatorInjector.setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
}
