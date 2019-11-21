import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  final loginFormKey = GlobalKey<FormState>();

  //登陆账号
  String userLoginName;

  //登陆密码
  String password;

  //是否隐藏密码
  bool isObscure = true;

  //隐藏显示密码小眼睛颜色
  Color eyeColor;

  saveUserLoginName(username) {
    userLoginName = username;
    notifyListeners();
  }

  savePassword(password) {
    password = password;
    notifyListeners();
  }

  isObscureChange() {
    isObscure = !isObscure;
    eyeColor = isObscure ? Colors.grey : Colors.blue;
    notifyListeners();
  }
}
