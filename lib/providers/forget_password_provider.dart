import 'package:flutter/cupertino.dart';

class ForgetPasswordProvider with ChangeNotifier {
  final forgetFormKey = GlobalKey<FormState>();

  //联系方式
  String phoneNumber;

  //验证码
  String verificationCode;

  //新密码
  String newPassword;

  //确认密码
  String confirmPassword;

  savePhoneNumber(value){
    phoneNumber = value;
    notifyListeners();
  }

  saveVerificationCode(value){
    verificationCode = value;
    notifyListeners();
  }

  saveNewPassword(value){
    newPassword = value;
    notifyListeners();
  }

  saveConfirmPassword(value){
    confirmPassword = value;
    notifyListeners();
  }
}
