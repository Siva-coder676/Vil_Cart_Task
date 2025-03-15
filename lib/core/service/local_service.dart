import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  final SharedPreferences? preferences;
  LocalService({this.preferences});

  static const String TOKEN = "token";
  static const String WAREHOUSE_ID = 'warehouse_id';

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
}
