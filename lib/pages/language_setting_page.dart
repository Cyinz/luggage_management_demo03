import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luggage_management_demo03/main.dart';

class LanguageSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('语言设置'),
      ),
      body: Column(
        children: <Widget>[
          _zhCNBtn(context),
          _zhHKBtn(context),
          _enUSBtn(context),
        ],
      ),
    );
  }

  //简体中文按钮
  Widget _zhCNBtn(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(1020.0),
      margin: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(30.0),
        top: ScreenUtil.getInstance().setHeight(20.0),
      ),
      child: OutlineButton(
        onPressed: () {
          MyAppState.setting.changeLocale(Locale('zh', 'CN'));
          Navigator.of(context).pop();
        },
        child: Text('简体中文'),
      ),
    );
  }

  //繁体中文按钮
  Widget _zhHKBtn(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(1020.0),
      margin: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(30.0)),
      child: OutlineButton(
        onPressed: () {
          MyAppState.setting.changeLocale(Locale('zh', 'HK'));
          Navigator.of(context).pop();
        },
        child: Text('繁體中文'),
      ),
    );
  }

  //美式英语按钮
  Widget _enUSBtn(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(1020.0),
      margin: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(30.0)),
      child: OutlineButton(
        onPressed: () {
          MyAppState.setting.changeLocale(Locale('en', 'US'));
          Navigator.of(context).pop();
        },
        child: Text('English'),
      ),
    );
  }
}
