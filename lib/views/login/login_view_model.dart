import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vil_cart_task/core/locator.dart';
import 'package:vil_cart_task/core/models/login_payload.dart';
import 'package:vil_cart_task/core/models/login_response.dart';
import 'package:vil_cart_task/core/router_constants.dart';
import 'package:vil_cart_task/core/service/local_service.dart';
import 'package:vil_cart_task/core/service/login_service.dart';
import 'package:vil_cart_task/views/product_list/product_list_view.dart';

class LoginViewModel extends BaseViewModel {
  bool isPasswordVisible = false;
  bool rememberMe = false;
  final _loginService = locator<LoginService>();
  final _localService = locator<LocalService>();
  final _navigationService = locator<NavigationService>();

  TextEditingController phoneNumController = TextEditingController();
  late TextEditingController passWordController = TextEditingController();
  LoginViewModel() {}

  getLoginView(BuildContext context) async {
    LoginPayload loginPayload = LoginPayload(
        mobileNo: phoneNumController.text,
        password: passWordController.text,
        userGroup: "warehouse",
        client: "web");
    LoginResponse? loginResponse =
        await _loginService.getLoginViewData(loginPayload);
    if (loginResponse != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(loginResponse.message!.toUpperCase()),
        backgroundColor: const Color(0xFF005D71),
      ));
      storetheToken(loginResponse.token!);
      _navigationService.navigateWithTransition(ProductListView(),
          transition: "fade");
    }
  }

  storetheToken(String token) {
    _localService.saveToken(token);
  }
}
