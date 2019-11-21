import 'package:flutter/cupertino.dart';

class DepositProvider with ChangeNotifier {
  final depositFormKey = GlobalKey<FormState>();

  //客户姓名
  String saverName;

  //客户手机号
  String phoneNumber;

  //行李标签号
  String tag;

  //性别
  int gender = 1;

  //接待行李员姓名
  String recieveName;

  //行李员所属酒店
  String hotel;

  //行李描述
  String luggageDescribe;

  //行李寄存的时间
  String saveTime;

  //行李预计存放的时间
  String saveForeTime =
      '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';

  //行李件数
  int number;

  //选择性别
  selectGender(value) {
    gender = value;
    notifyListeners();
  }

  //选择行李预计存放的时间
  changeSaveForeTime(date){
    saveForeTime = '${date.year}-${date.month}-${date.day}';
    notifyListeners();
  }

  //选择行李件数
  selectNumber(value){
    number = value;
    notifyListeners();
  }
}
