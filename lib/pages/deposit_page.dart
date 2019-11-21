import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luggage_management_demo03/local/my_localizations.dart';
import 'package:luggage_management_demo03/providers/deposit_provider.dart';
import 'package:provide/provide.dart';

class DepositPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DepositPageState();
  }
}

class DepositPageState extends State<DepositPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Provide<DepositProvider>(
        builder: (context, child, depositProvider) {
          return GestureDetector(
            child: Stack(
              children: <Widget>[
                _depositForm(context),
                _depositButton(),
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

  //寄存表单
  Widget _depositForm(BuildContext context) {
    return Form(
      child: ListView(
        key: Provide.value<DepositProvider>(context).depositFormKey,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: ScreenUtil.getInstance().setHeight(1310.0),
                width: ScreenUtil.getInstance().setWidth(990.0),
                margin: EdgeInsets.only(
                  top: ScreenUtil.getInstance().setHeight(60.0),
                  left: ScreenUtil.getInstance().setWidth(60.0),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              Container(
                height: ScreenUtil.getInstance().setHeight(1320.0),
                width: ScreenUtil.getInstance().setWidth(1000.0),
                margin: EdgeInsets.only(
                  top: ScreenUtil.getInstance().setHeight(38.0),
                  left: ScreenUtil.getInstance().setWidth(35.0),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(7.0, 7.0),
                      color: Colors.grey,
                      blurRadius: 1.0,
                      spreadRadius: -3.0,
                    ),
                  ],
                ),
                child: ListView(
                  children: <Widget>[
                    _formTitle(),
                    _underline(),
                    _saverNameField(context),
                    _phoneNumberField(context),
                    _tagField(context),
                    _genderRadio(context),
                    _storeToDay(context),
                    _numberDropdown(context),
                    _describeField(context),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  //寄存按钮
  Widget _depositButton() {
    return Positioned(
      width: ScreenUtil.getInstance().setWidth(800.0),
      height: ScreenUtil.getInstance().setHeight(120.0),
      top: ScreenUtil.getInstance().setHeight(1430.0),
      left: ScreenUtil.getInstance().setWidth(140.0),
      child: RaisedButton(
        color: Colors.teal,
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return _selectDialog(context);
            },
          );
        },
        child: Text(
          "寄存",
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

  //表单标题
  Widget _formTitle() {
    return Container(
        margin: EdgeInsets.only(
          top: ScreenUtil.getInstance().setHeight(20.0),
          left: ScreenUtil.getInstance().setWidth(50.0),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.format_list_bulleted,
              size: ScreenUtil.getInstance().setSp(80.0),
            ),
            Text(
              '行李寄存',
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(80.0),
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ));
  }

  //标题下划线
  Widget _underline() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.only(
          top: ScreenUtil.getInstance().setHeight(10.0),
          left: ScreenUtil.getInstance().setWidth(60.0),
        ),
        color: Colors.black,
        height: ScreenUtil.getInstance().setHeight(5.0),
        width: ScreenUtil.getInstance().setWidth(230),
      ),
    );
  }

  //客户姓名输入框
  Widget _saverNameField(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: ScreenUtil.getInstance().setWidth(250.0),
          margin: EdgeInsets.only(
            top: ScreenUtil.getInstance().setHeight(50.0),
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "姓名：",
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(40.0),
              ),
            ),
          ),
        ),
        Container(
          width: ScreenUtil.getInstance().setWidth(600.0),
          height: ScreenUtil.getInstance().setHeight(80.0),
          margin: EdgeInsets.only(
            top: ScreenUtil.getInstance().setHeight(50.0),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "请输入姓名",
            ),
            onSaved: (String value) {
              Provide.value<DepositProvider>(context).saverName = value;
            },
          ),
        ),
      ],
    );
  }

  //客户手机号输入框
  Widget _phoneNumberField(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: ScreenUtil.getInstance().setWidth(250.0),
          margin: EdgeInsets.only(
            top: ScreenUtil.getInstance().setHeight(50.0),
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              '手机号：',
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(40.0),
              ),
            ),
          ),
        ),
        Container(
          width: ScreenUtil.getInstance().setWidth(600.0),
          height: ScreenUtil.getInstance().setHeight(80.0),
          margin: EdgeInsets.only(
            top: ScreenUtil.getInstance().setHeight(50.0),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "请输入手机号",
            ),
            onSaved: (String value) {
              Provide.value<DepositProvider>(context).phoneNumber = value;
            },
          ),
        ),
      ],
    );
  }

  //行李标签号输入框
  Widget _tagField(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: ScreenUtil.getInstance().setWidth(250.0),
          margin: EdgeInsets.only(
            top: ScreenUtil.getInstance().setHeight(50.0),
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              '标签号：',
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(40.0),
              ),
            ),
          ),
        ),
        Container(
          width: ScreenUtil.getInstance().setWidth(600.0),
          height: ScreenUtil.getInstance().setHeight(80.0),
          margin: EdgeInsets.only(
            top: ScreenUtil.getInstance().setHeight(50.0),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "请输入行李标签号",
            ),
            onSaved: (String value) {
              Provide.value<DepositProvider>(context).tag = value;
            },
          ),
        ),
      ],
    );
  }

  //客户性别单选按钮
  Widget _genderRadio(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: ScreenUtil.getInstance().setWidth(250.0),
          margin: EdgeInsets.only(
            top: ScreenUtil.getInstance().setHeight(10.0),
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              '性别：',
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(40.0),
              ),
            ),
          ),
        ),
        Container(
          height: ScreenUtil.getInstance().setHeight(100.0),
          margin: EdgeInsets.only(
            top: ScreenUtil.getInstance().setHeight(10.0),
            left: ScreenUtil.getInstance().setWidth(20.0),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Foundation.getIconData('male'),
                color: Colors.blue,
                size: ScreenUtil.getInstance().setSp(70.0),
              ),
              Text(
                '先生',
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(40.0),
                  color: Colors.blue,
                ),
              ),
              Radio(
                value: 1,
                groupValue: Provide.value<DepositProvider>(context).gender,
                onChanged: (value) {
                  Provide.value<DepositProvider>(context).selectGender(value);
                },
              ),
              Icon(
                Foundation.getIconData('female'),
                color: Colors.pinkAccent,
                size: ScreenUtil.getInstance().setSp(70.0),
              ),
              Text(
                '女士',
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(40.0),
                  color: Colors.pinkAccent,
                ),
              ),
              Radio(
                value: 2,
                groupValue: Provide.value<DepositProvider>(context).gender,
                onChanged: (value) {
                  Provide.value<DepositProvider>(context).selectGender(value);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  //存放至日期选择框
  Widget _storeToDay(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: ScreenUtil.getInstance().setWidth(250.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "存放至：",
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(40.0),
              ),
            ),
          ),
        ),
        Container(
          height: ScreenUtil.getInstance().setHeight(60.0),
          margin: EdgeInsets.only(
            left: ScreenUtil.getInstance().setWidth(30.0),
          ),
          child: InkWell(
            onTap: _selectDate,
            child: Row(
              children: <Widget>[
                Text(Provide.value<DepositProvider>(context).saveForeTime),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        )
      ],
    );
  }

  //选择日期返回时间
  _selectDate() async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(new Duration(days: 1)),
      lastDate: DateTime(2100),
    );
    if (date == null) {
      return;
    } else {
      Provide.value<DepositProvider>(context).changeSaveForeTime(date);
    }
  }

  //件数下拉选择框
  Widget _numberDropdown(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: ScreenUtil.getInstance().setWidth(250.0),
          margin: EdgeInsets.only(
            top: ScreenUtil.getInstance().setHeight(20.0),
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "件数：",
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(40.0),
              ),
            ),
          ),
        ),
        Container(
          width: ScreenUtil.getInstance().setWidth(300.0),
          height: ScreenUtil.getInstance().setHeight(60.0),
          margin: EdgeInsets.only(
            left: ScreenUtil.getInstance().setWidth(30.0),
            top: ScreenUtil.getInstance().setHeight(20.0),
          ),
          child: DropdownButton(
            items: getListData(),
            hint: Text(
              "请选择行李件数",
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(30.0),
              ),
            ),
            onChanged: (value) {
              print(value);
              Provide.value<DepositProvider>(context).selectNumber(value);
            },
            value: Provide.value<DepositProvider>(context).number,
            isDense: true,
            isExpanded: true,
            underline: Container(),
          ),
        ),
      ],
    );
  }

  //件数下拉选择框返回组件构造方法
  List<DropdownMenuItem> getListData() {
    List<DropdownMenuItem> items = new List<DropdownMenuItem>.generate(
      10,
      (i) {
        return DropdownMenuItem(
          child: Text(
            "${i + 1} 件",
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(40.0),
            ),
          ),
          value: i + 1,
        );
      },
    );
    return items;
  }

  //行李描述输入框
  Widget _describeField(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: ScreenUtil.getInstance().setWidth(250.0),
          margin: EdgeInsets.only(
            top: ScreenUtil.getInstance().setHeight(50.0),
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              '行李描述：',
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(40.0),
              ),
            ),
          ),
        ),
        Container(
          height: ScreenUtil.getInstance().setHeight(500.0),
          width: ScreenUtil.getInstance().setWidth(600.0),
          margin: EdgeInsets.only(
            top: ScreenUtil.getInstance().setHeight(30.0),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '请输入行李描述',
              alignLabelWithHint: true,
            ),
            maxLines: 100,
            maxLength: 140,
            onSaved: (String value) {},
          ),
        ),
      ],
    );
  }

  //选择领取验证方式弹窗
  Widget _selectDialog(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: Text("选择领取的验证方式"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
//            FlatButton(
//              onPressed: () {
//                Navigator.pop(context);
//              },
//              child: Text(
//                "指纹识别",
//                style: TextStyle(color: Colors.green),
//              ),
//            ),
//            FlatButton(
//              onPressed: () {
//                Navigator.pop(context);
//              },
//              child: Text(
//                "声纹验证",
//                style: TextStyle(color: Colors.green),
//              ),
//            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "人脸识别",
                style: TextStyle(color: Colors.green),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "生成二维码",
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(MyLocalizations.of(context).ok),
          ),
        ],
      ),
    );
  }
}
