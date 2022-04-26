import 'package:flutter/cupertino.dart';

class MainProvider extends ChangeNotifier {
  bool isDark = false;

  bool get getIsDark => isDark;

  set setIsDark(bool isDark) {
    this.isDark = isDark;
    notifyListeners();
  }

  bool isLogged = false;

  bool get getIsLogged => isLogged;

  set setIsLogged(bool isLogged) {
    this.isLogged = isLogged;
    notifyListeners();
  }

  String token = '-';

  String get getToken => token;

  setToken(String token) {
    this.token = token;
    notifyListeners();
  }

  String name = '';

  String get getName => name;

  set setName(String name) {
    this.name = name;
    notifyListeners();
  }

  String email = '';

  String get getEmail => email;

  set setEmail(String email) {
    this.email = email;
    notifyListeners();
  }
}
