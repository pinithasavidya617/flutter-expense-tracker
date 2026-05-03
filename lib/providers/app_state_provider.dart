import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_manage/services/local_storage_service.dart';

class AppStateProvider extends ChangeNotifier{
  final LocalStorageService _localStorageService = LocalStorageService();

  bool _isFirstTime = true;
  bool _isDarkMode = false;

  bool get isFirstTime => _isFirstTime;
  bool get isDarkMode => _isDarkMode;
  
  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  Future<void> init() async{
    _isFirstTime = await _localStorageService.getIsFirstTime();
    _isDarkMode = await _localStorageService.getIsDarkMode();
    notifyListeners();
  }

  Future<void> setFirstTime() async{
    await _localStorageService.setIsFirstTime();
    _isFirstTime = false;
    notifyListeners();
  }

  Future<void> setDarkMode() async {
    _isDarkMode = !_isDarkMode;
    await _localStorageService.setIsDarkMode(_isDarkMode);
    notifyListeners();
  }


}