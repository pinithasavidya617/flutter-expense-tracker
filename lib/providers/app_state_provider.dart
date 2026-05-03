import 'package:flutter/cupertino.dart';
import 'package:money_manage/services/local_storage_service.dart';

class AppStateProvider extends ChangeNotifier{
  final LocalStorageService _localStorageService = LocalStorageService();

  bool _isFirstTime = true;

  bool get isFirstTime => _isFirstTime;

  Future<void> init() async{
    _isFirstTime = await _localStorageService.getIsFirstTime();
    notifyListeners();
  }

  Future<void> setFirstTime() async{
    await _localStorageService.setIsFirstTime();
    _isFirstTime = false;
    notifyListeners();
  }


}