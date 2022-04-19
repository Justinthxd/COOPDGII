import 'package:flutter/cupertino.dart';

class MainProvider extends ChangeNotifier {
  bool isDark = false;

  bool get getIsDark => isDark;

  set setIsDark(bool isDark) {
    this.isDark = isDark;
    notifyListeners();
  }

  String token = '-';

  String get getToken => token;

  setToken(String token) {
    this.token = token;
    notifyListeners();
  }
}
