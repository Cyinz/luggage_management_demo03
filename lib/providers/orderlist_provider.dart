import 'package:flutter/cupertino.dart';

class OrderlistProvider with ChangeNotifier{
  //查找方式
  int searchType;

  changeSearchType(value){
    searchType = value;
    notifyListeners();
  }
}