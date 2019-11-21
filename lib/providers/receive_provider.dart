import 'package:flutter/cupertino.dart';

class ReceiveProvider with ChangeNotifier {
  final receiveFormKey = GlobalKey<FormState>();

  //取行李码
  String code;

  //设置取行李码
  setCode(value){
    code = value;
    notifyListeners();
  }
}