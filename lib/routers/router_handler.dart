import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:luggage_management_demo03/pages/forget_password_page.dart';
import 'package:luggage_management_demo03/pages/index_page.dart';
import 'package:luggage_management_demo03/pages/language_setting_page.dart';
import 'package:luggage_management_demo03/pages/login_page.dart';
import 'package:luggage_management_demo03/pages/orderlist_page.dart';
import 'package:luggage_management_demo03/pages/person_info_page.dart';

Handler rootHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return LoginPage();
  },
);

Handler indexHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return IndexPage();
  },
);

Handler languageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return LanguageSettingPage();
  },
);

Handler forgetHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return ForgetPasswordPage();
  },
);

Handler orderListHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return OrderListPage();
  },
);

Handler personHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return PersonInfoPage();
  },
);