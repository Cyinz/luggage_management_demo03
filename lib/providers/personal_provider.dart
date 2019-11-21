import 'package:flutter/cupertino.dart';

class PersonalProvider with ChangeNotifier{
  String clerkName = "";
  String clerkImg = "";
  String clerkHotel = "";

  setName(String name){
    clerkName = name;
    notifyListeners();
  }

  setImg(String img){
    clerkImg = img;
    notifyListeners();
  }

  setHotel(String hotel){
    clerkHotel = hotel;
    notifyListeners();
  }
}