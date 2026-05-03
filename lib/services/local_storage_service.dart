import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService{

  static const String isFirstTime = 'isFirstTime';

  Future<bool> getIsFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isFirstTime) ?? true;
  }

  Future<bool> setIsFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isFirstTime, false);
    return prefs.getBool(isFirstTime) ?? false;
  }
}