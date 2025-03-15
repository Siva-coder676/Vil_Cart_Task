import 'package:logger/logger.dart';
import 'package:vil_cart_task/core/models/login_payload.dart';
import 'package:vil_cart_task/core/models/login_response.dart';
import 'package:vil_cart_task/core/repository/network.dart';

class LoginService {
  Future<LoginResponse?>? getLoginViewData(LoginPayload loginPayload) async {
    try {
      LoginResponse? loginResponse =
          await MyApi().getClient()!.getRegisterUser(loginPayload);
      return loginResponse;
    } catch (e) {
      Logger().e(e.toString());
    }
    return null;
  }
}
