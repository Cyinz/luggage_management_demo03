import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luggage_management_demo03/Model/clerk.dart';
import 'package:luggage_management_demo03/local/my_localizations.dart';
import 'package:luggage_management_demo03/pages/index_page.dart';
import 'package:luggage_management_demo03/providers/login_provider.dart';
import 'package:luggage_management_demo03/service/service_method.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    return Scaffold(
      body: Provide<LoginProvider>(
        builder: (context, child, loginProvider) {
          return SafeArea(
            child: GestureDetector(
              child: _loginForm(context),
              //点击空白处收回键盘
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
            ),
          );
        },
      ),
    );
  }

  //注册表单
  Widget _loginForm(BuildContext context) {
    return Form(
      key: Provide.value<LoginProvider>(context).loginFormKey,
      child: ListView(
        padding: EdgeInsets.fromLTRB(30, 10, 40, 0),
        children: <Widget>[
          _formTitle(),
          _underline(),
          _userLoginName(context),
          _password(context),
          _forgetPassword(context),
          _loginButton(context),
        ],
      ),
    );
  }

  //表单标题
  Widget _formTitle() {
    return Container(
      margin: EdgeInsets.only(
          top: ScreenUtil.getInstance().setHeight(200.0), left: 10),
      child: Text(
        "Login",
        style: TextStyle(
          fontSize: ScreenUtil.getInstance().setSp(120.0),
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  //标题下划线
  Widget _underline() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.only(top: 5, left: 10),
        color: Colors.black,
        height: 3,
        width: ScreenUtil.getInstance().setWidth(280),
      ),
    );
  }

  //登陆名
  Widget _userLoginName(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(200.0)),
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.person),
          labelText: MyLocalizations.of(context).userLoginName,
          helperText: '',
        ),
        keyboardType: TextInputType.number,
        validator: (String value) {
          if (value.isEmpty) {
            return MyLocalizations.of(context).usernameisNull;
          }
        },
        onSaved: (String value) {
          Provide.value<LoginProvider>(context).saveUserLoginName(value);
        },
      ),
    );
  }

  //密码
  Widget _password(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: TextFormField(
        obscureText: Provide.value<LoginProvider>(context).isObscure,
        decoration: InputDecoration(
          icon: Icon(Icons.keyboard),
          labelText: MyLocalizations.of(context).password,
          helperText: '',
          suffixIcon: IconButton(
            icon: Icon(Icons.remove_red_eye),
            color: Provide.value<LoginProvider>(context).eyeColor,
            onPressed: () {
              Provide.value<LoginProvider>(context).isObscureChange();
            },
          ),
        ),
        keyboardType: TextInputType.text,
        validator: (String value) {
          if (value.isEmpty) {
            return MyLocalizations.of(context).passwordisNull;
          }
        },
        onSaved: (String value) {
          Provide.value<LoginProvider>(context).savePassword(value);
        },
      ),
    );
  }

  //忘记密码
  Widget _forgetPassword(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        child: FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/forget');
          },
          child: Text(
            MyLocalizations.of(context).forgetPassword,
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(40.0),
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  //登陆按钮
  Widget _loginButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(100.0),
      ),
      height: ScreenUtil.getInstance().setHeight(100.0),
      child: RaisedButton(
        color: Colors.black,
        shape: StadiumBorder(),
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil.getInstance().setSp(70.0),
          ),
        ),
        onPressed: () {
          //所有输入验证通过后
          if (Provide.value<LoginProvider>(context)
              .loginFormKey
              .currentState
              .validate()) {
            Provide.value<LoginProvider>(context)
                .loginFormKey
                .currentState
                .save();
            //登陆
            login(Provide.value<LoginProvider>(context).userLoginName,
                Provide.value<LoginProvider>(context).password, context);
          }
        },
      ),
    );
  }

  //登陆成功弹窗
  Widget _successDialog(var value, BuildContext context) {
    return Container(
      child: AlertDialog(
        title: Text(MyLocalizations.of(context).success),
        content: Text(
            "${MyLocalizations.of(context).welcome}，${value['data']['username']}"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              //跳转并销毁当前页面
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => new IndexPage()),
                (Route<dynamic> route) => false,
              );
            },
            child: Text(MyLocalizations.of(context).ok),
          ),
        ],
      ),
    );
  }

  //登陆失败弹窗
  Widget _failureDialog(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: Text(MyLocalizations.of(context).fail),
        content: Text(MyLocalizations.of(context).loginError),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              //清空表单当前内容
              Provide.value<LoginProvider>(context)
                  .loginFormKey
                  .currentState
                  .reset();
              Navigator.pop(context);
            },
            child: Text(MyLocalizations.of(context).ok),
          ),
        ],
      ),
    );
  }

  //登陆方法
  login(String userLoginName, String password, BuildContext context) async {
    FormData formData = FormData.fromMap({
      'userloginname': userLoginName,
      'password': password,
    });
    request('login', formData: formData).then(
      (value) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            //登陆成功
            if (value['status'] == 200) {
              //使用SharedPreferences保存行李员信息
              ClerkModel clerkModel = ClerkModel.fromJson(value['data']);
              save(clerkModel);
              return _successDialog(value, context);
            }
            //登陆失败
            else {
              return _failureDialog(context);
            }
          },
        );
      },
    );
  }

  //保存登陆行李员信息
  save(ClerkModel clerkModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('clerkName', clerkModel.username);
    sharedPreferences.setString('clerkImg', clerkModel.img);
    sharedPreferences.setString('clerkHotel', clerkModel.hotel);
  }
}
