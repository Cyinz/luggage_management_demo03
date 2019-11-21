import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luggage_management_demo03/providers/receive_provider.dart';
import 'package:provide/provide.dart';

class ReceivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Provide<ReceiveProvider>(
        builder: (context, child, receiveProvider) {
          return GestureDetector(
            child: Stack(
              children: <Widget>[
                _receiveForm(context),
                _receiveButton(context),
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

  //领取行李表单
  Widget _receiveForm(BuildContext context) {
    return Form(
      key: Provide.value<ReceiveProvider>(context).receiveFormKey,
      child: ListView(
        padding: EdgeInsets.only(
          left: ScreenUtil.getInstance().setWidth(100.0),
          right: ScreenUtil.getInstance().setWidth(100.0),
        ),
        children: <Widget>[
          _codeField(context),
          _loseCode(),
        ],
      ),
    );
  }

  //领取按钮
  Widget _receiveButton(BuildContext context) {
    return Positioned(
      width: ScreenUtil.getInstance().setWidth(800.0),
      height: ScreenUtil.getInstance().setHeight(120.0),
      top: ScreenUtil.getInstance().setHeight(1430.0),
      left: ScreenUtil.getInstance().setWidth(140.0),
      child: RaisedButton(
        color: Colors.teal,
        onPressed: () {},
        child: Text(
          "领取",
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

  //取行李码输入框
  Widget _codeField(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(600.0),
      ),
      width: ScreenUtil.getInstance().setWidth(600.0),
      height: ScreenUtil.getInstance().setHeight(100.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: '请输入取行李码',
          suffixIcon: IconButton(
            icon: Icon(
              MaterialCommunityIcons.getIconData("qrcode-scan"),
            ),
            onPressed: () {
              scan(context);
            },
          ),
        ),
        onSaved: (String value) {
          Provide.value<ReceiveProvider>(context).code = value;
        },
      ),
    );
  }

  //领取凭证丢失
  Widget _loseCode() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        child: FlatButton(
          onPressed: () {},
          child: Text(
            '领取凭证丢失',
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(40.0),
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  //扫描二维码方法
  Future scan(BuildContext context) async {
    try {
      String qrcode = await BarcodeScanner.scan();
      print('扫码结果：${qrcode}');
      //设置扫码内容
      Provide.value<ReceiveProvider>(context).setCode(qrcode);
    } on PlatformException catch (e) {
      if(e.code == BarcodeScanner.CameraAccessDenied){
        print('未授予APP相机权限');
      }
      else
        {
          print('扫码错误：$e');
        }
    }
    on FormatException{
      print('进入扫码页面后未扫码就返回');
    }
    catch(e){
      print('扫码错误：$e');
    }
  }
}
