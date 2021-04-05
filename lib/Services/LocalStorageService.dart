import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  void setDeviceId(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('deviceId', id);
  }
}
