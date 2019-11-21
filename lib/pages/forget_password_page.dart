import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luggage_management_demo03/local/my_localizations.dart';
import 'package:luggage_management_demo03/providers/forget_password_provider.dart';
import 'package:provide/provide.dart';

class ForgetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('忘记密码'),
      ),
      body: Provide<ForgetPasswordProvider>(
        builder: (context, child, forgetPasswordProvider) {
          return GestureDetector(
            child: Stack(
              children: <Widget>[
                _forgetForm(context),
                _submitBtn(context),
              ],
            ),
            //点击空白处收回键盘
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
          );
        },
      ),
    );
  }

  //忘记密码表单
  Widget _forgetForm(BuildContext context) {
    return Form(
      key: Provide.value<ForgetPasswordProvider>(context).forgetFormKey,
      child: ListView(
        children: <Widget>[
          _phoneField(context),
          _verificationArea(context),
          _newPasswordField(context),
          _confirmPasswordField(context),
        ],
      ),
    );
  }

  //联系方式输入框
  Widget _phoneField(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: ScreenUtil.getInstance().setHeight(50.0),
          left: ScreenUtil.getInstance().setWidth(40.0),
          right: ScreenUtil.getInstance().setWidth(40.0)),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: '请输入预留的手机号',
          helperText: '',
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return '联系方式不能为空';
          }
        },
        onSaved: (String value) {
          Provide.value<ForgetPasswordProvider>(context).savePhoneNumber(value);
        },
      ),
    );
  }

  //验证码
  Widget _verificationArea(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          _verificationCode(context),
          _verificationBtn(),
        ],
      ),
    );
  }

  //验证码输入框
  Widget _verificationCode(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(40.0),
        right: ScreenUtil.getInstance().setWidth(30.0),
      ),
      height: ScreenUtil.getInstance().setHeight(100.0),
      width: ScreenUtil.getInstance().setWidth(600.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: '请输入验证码',
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return '验证码不能为空';
          }
        },
        onSaved: (String value) {
          Provide.value<ForgetPasswordProvider>(context)
              .saveVerificationCode(value);
        },
      ),
    );
  }

  //发送验证码按钮
  Widget _verificationBtn() {
    return Container(
      height: ScreenUtil.getInstance().setHeight(100.0),
      width: ScreenUtil.getInstance().setWidth(350.0),
      child: RaisedButton(
        onPressed: () {},
        child: Text('发送验证码'),
      ),
    );
  }

  //新密码输入框
  Widget _newPasswordField(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: ScreenUtil.getInstance().setHeight(50.0),
          left: ScreenUtil.getInstance().setWidth(40.0),
          right: ScreenUtil.getInstance().setWidth(40.0)),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: '请输入新的密码',
          helperText: '',
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return '新密码不能为空';
          }
        },
        onSaved: (String value) {
          Provide.value<ForgetPasswordProvider>(context).saveNewPassword(value);
        },
      ),
    );
  }

  //确认密码输入框
  Widget _confirmPasswordField(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: ScreenUtil.getInstance().setWidth(40.0),
          right: ScreenUtil.getInstance().setWidth(40.0)),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: '请重复输入密码',
          helperText: '',
        ),
        validator: (String value) {
          if (value !=
              Provide.value<ForgetPasswordProvider>(context).newPassword) {
            return '密码不匹配';
          }
        },
        onSaved: (String value) {
          Provide.value<ForgetPasswordProvider>(context)
              .saveConfirmPassword(value);
        },
      ),
    );
  }

  //确认按钮
  Widget _submitBtn(BuildContext context) {
    return Positioned(
      width: ScreenUtil.getInstance().setWidth(800.0),
      height: ScreenUtil.getInstance().setHeight(120.0),
      top: ScreenUtil.getInstance().setHeight(1500.0),
      left: ScreenUtil.getInstance().setWidth(140.0),
      child: RaisedButton(
        color: Colors.teal,
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return _successDialog(context);
            },
          );
        },
        child: Text(
          '提交',
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(50.0),
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }

  //修改成功弹窗
  Widget _successDialog(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: Text('修改成功'),
        content: Text('修改密码成功，返回重新登陆'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Text(MyLocalizations.of(context).ok),
          )
        ],
      ),
    );
  }
}
