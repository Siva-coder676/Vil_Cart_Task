// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:vil_cart_task/core/router_constants.dart';

import 'package:vil_cart_task/views/login/login_view.dart' as view0;
import 'package:vil_cart_task/views/product_list/product_list_view.dart' as view1;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginViewRoute:
        return MaterialPageRoute(builder: (_) => view0.LoginView());
      case productListViewRoute:
        return MaterialPageRoute(builder: (_) => view1.ProductListView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}