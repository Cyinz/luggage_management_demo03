import 'package:flutter/cupertino.dart';

class MyLocalizations {
  final Locale locale;

  MyLocalizations(this.locale);

  static Map<String, Map<String, String>> localizedValuesMap = {
    'en_US': {
      'DemoName': 'Luggage Management',
      'userLoginName': 'UserLoginName',
      'usernameisNull': "userLoginname can't be null",
      'password': 'Password',
      'passwordisNull': "password can't be null",
      'forgetPassword': 'Forget Password',
      'success': 'Succeed',
      'fail': 'Failed',
      'welcome': 'Welcome',
      'ok': 'OK',
      'loginError': 'UserLoginName or Password error, please try again',
      'deposit': 'Deposit',
      'receive': 'Receive',
      'personal': 'Personal',
    },
    'zh_CN': {
      'DemoName': '智能酒店行李管理',
      'userLoginName': '用户名',
      'usernameisNull': '用户名不能为空',
      'password': '密码',
      'passwordisNull': '密码不能为空',
      'forgetPassword': '忘记密码',
      'success': '登陆成功',
      'fail': '登陆失败',
      'welcome': '欢迎您',
      'ok': '确定',
      'loginError': '用户名或密码错误，请重试',
      'deposit': '寄存',
      'receive': '领取',
      'personal': '我的',
    },
    'zh_HK': {
      'DemoName': '智能酒店行李管理',
      'userLoginName': '用戶名',
      'usernameisNull': '用戶名不能為空',
      'password': '密碼',
      'passwordisNull': '密碼不能為空',
      'forgetPassword': '忘記密碼',
      'success': '登陸成功',
      'fail': '登陸失敗',
      'welcome': '歡迎您',
      'ok': '確定',
      'loginError': '用戶名或密碼錯誤，請重試',
      'deposit': '寄存',
      'receive': '領取',
      'personal': '我的',
    }
  };

  get DemoName {
    return localizedValuesMap[locale.toString()]['DemoName'];
  }

  get userLoginName {
    return localizedValuesMap[locale.toString()]['userLoginName'];
  }

  get usernameisNull {
    return localizedValuesMap[locale.toString()]['usernameisNull'];
  }

  get password {
    return localizedValuesMap[locale.toString()]['password'];
  }

  get passwordisNull {
    return localizedValuesMap[locale.toString()]['passwordisNull'];
  }

  get forgetPassword {
    return localizedValuesMap[locale.toString()]['forgetPassword'];
  }

  get success {
    return localizedValuesMap[locale.toString()]['success'];
  }

  get fail {
    return localizedValuesMap[locale.toString()]['fail'];
  }

  get welcome {
    return localizedValuesMap[locale.toString()]['welcome'];
  }

  get ok {
    return localizedValuesMap[locale.toString()]['ok'];
  }

  get loginError {
    return localizedValuesMap[locale.toString()]['loginError'];
  }

  get deposit {
    return localizedValuesMap[locale.toString()]['deposit'];
  }

  get receive {
    return localizedValuesMap[locale.toString()]['receive'];
  }

  get personal {
    return localizedValuesMap[locale.toString()]['personal'];
  }

  static MyLocalizations of(BuildContext context) {
    return Localizations.of(context, MyLocalizations);
  }
}
