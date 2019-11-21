import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:luggage_management_demo03/local/my_localizations_delegate.dart';
import 'package:luggage_management_demo03/providers/deposit_provider.dart';
import 'package:luggage_management_demo03/providers/forget_password_provider.dart';
import 'package:luggage_management_demo03/providers/login_provider.dart';
import 'package:luggage_management_demo03/providers/orderlist_provider.dart';
import 'package:luggage_management_demo03/providers/personal_provider.dart';
import 'package:luggage_management_demo03/providers/receive_provider.dart';
import 'package:luggage_management_demo03/routers/application.dart';
import 'package:luggage_management_demo03/routers/routers.dart';
import 'package:provide/provide.dart';

void main() {
  var providers = Providers();
  var loginProvider = LoginProvider();
  var depositProvider = DepositProvider();
  var receiveProvider = ReceiveProvider();
  var personalProvider = PersonalProvider();
  var forgetPasswordProvider = ForgetPasswordProvider();
  var orderListProvider = OrderlistProvider();
  providers
    ..provide(Provider<LoginProvider>.value(loginProvider))
    ..provide(Provider<DepositProvider>.value(depositProvider))
    ..provide(Provider<ReceiveProvider>.value(receiveProvider))
    ..provide(Provider<PersonalProvider>.value(personalProvider))
    ..provide(Provider<ForgetPasswordProvider>.value(forgetPasswordProvider))
    ..provide(Provider<OrderlistProvider>.value(orderListProvider));
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class AppSetting {
  AppSetting();

  Null Function(Locale locale) changeLocale;
  Locale locale;
  List<Locale> supportedLocales = [
    Locale('zh', 'CN'), //简体中文
    Locale('zh', 'HK'), //繁体中文
    Locale('en', "US"), //美国英语
  ];
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  static AppSetting setting = AppSetting();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setting.changeLocale = (Locale locale) {
      if (setting.supportedLocales
          .map((locale) {
            return locale.toString();
          })
          .toSet()
          .contains(locale?.toString())) {
        setState(() {
          setting.locale = locale;
        });
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    //初始化路由
    final router = Router();
    Routers.configureRouters(router);
    Application.router = router;

    return MaterialApp(
//      locale: setting.locale,
      locale: Locale('zh', 'CN'),
      //本地化
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        MyLocalizationsDelegate(),
      ],
      //本地化支持的语言
      supportedLocales: setting.supportedLocales,

      title: '智能酒店行李管理',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      onGenerateRoute: Application.router.generator,
    );
  }
}
