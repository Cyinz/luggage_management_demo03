import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:luggage_management_demo03/routers/router_handler.dart';

class Routers {
  static String root = "/";
  static String index = "/index";
  static String language = '/language';
  static String forget = '/forget';
  static String orderlist = '/orderlist';
  static String person = '/person';

  static void configureRouters(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print("ERROR===>：ROUTE WAS NOT FOUND!!!");
      },
    );

    router.define(root, handler: rootHandler);
    router.define(index, handler: indexHandler);
    router.define(language, handler: languageHandler);
    router.define(forget, handler: forgetHandler);
    router.define(orderlist, handler: orderListHandler);
    router.define(person, handler: personHandler);
  }
}
