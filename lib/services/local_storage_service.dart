import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService{

  static const String isFirstTime = 'isFirstTime';
  static const String isDarkMode = 'isDarkMode';


  Future<bool> getIsFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isFirstTime) ?? true;
  }

  Future<void> setIsFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isFirstTime, false);
  }

  Future<bool> getIsDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isDarkMode) ?? false;
  }

  Future<void> setIsDarkMode(bool darkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isDarkMode, darkMode);
  }
}