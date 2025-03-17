import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  final SharedPreferences? preferences;
  LocalService({this.preferences});

  static const String TOKEN = "token";
  static const String WAREHOUSE_ID = 'warehouse_id';
  static const String CUSTOMER_ID = 'customer_id';

  saveToken(token) async {
    return await preferences!.setString(TOKEN, token);
  }

  Future<String> getToken() async {
    return preferences!.getString(TOKEN)!;
  }

  saveWareHouseId(int id) async {
    return await preferences!.setInt(WAREHOUSE_ID, id);
  }

  getWareHouseId() async {
    return await preferences!.getInt(WAREHOUSE_ID);
  }

  saveCustomerId(int id) async {
    return await preferences!.setInt(CUSTOMER_ID, id);
  }

  getCustomerId() async {
    return await preferences!.getInt(CUSTOMER_ID);
  }
}
