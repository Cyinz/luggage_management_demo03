import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人信息'),
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: ScreenUtil.getInstance().setHeight(100.0),
        ),
        child: Column(
          children: <Widget>[
            _personImg(),
            _personName(),
            _personHotel(),
            _personPhone(),
            _personAge(),
            _personGender(),
            _buttonBar(),
          ],
        ),
      ),
    );
  }

  //照片
  Widget _personImg() {
    return Container(
      alignment: Alignment.center,
      child: ClipOval(
        child: Image.network(
          'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=430089504,3674027973&fm=26&gp=0.jpg',
          fit: BoxFit.cover,
          height: ScreenUtil.getInstance().setWidth(500.0),
          width: ScreenUtil.getInstance().setWidth(500.0),
        ),
      ),
    );
  }

  //姓名
  Widget _personName() {
    return Container(
      alignment: Alignment.center,
      width: ScreenUtil.getInstance().setWidth(700.0),
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(100.0),
      ),
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: ScreenUtil.getInstance().setWidth(200.0),
            child: Text('姓名：'),
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(500.0),
            height: ScreenUtil.getInstance().setHeight(80.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '行李员甲',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }

  //所属酒店
  Widget _personHotel() {
    return Container(
      alignment: Alignment.center,
      width: ScreenUtil.getInstance().setWidth(700.0),
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(40.0),
      ),
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: ScreenUtil.getInstance().setWidth(200.0),
            child: Text('所属酒店：'),
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(500.0),
            height: ScreenUtil.getInstance().setHeight(80.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '国际交流中心',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }

  //联系电话
  Widget _personPhone() {
    return Container(
      alignment: Alignment.center,
      width: ScreenUtil.getInstance().setWidth(700.0),
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(40.0),
      ),
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: ScreenUtil.getInstance().setWidth(200.0),
            child: Text('联系电话：'),
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(500.0),
            height: ScreenUtil.getInstance().setHeight(80.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '12345678910',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }

  //年龄
  Widget _personAge() {
    return Container(
      alignment: Alignment.center,
      width: ScreenUtil.getInstance().setWidth(700.0),
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(40.0),
      ),
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: ScreenUtil.getInstance().setWidth(200.0),
            child: Text('年龄：'),
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(500.0),
            height: ScreenUtil.getInstance().setHeight(80.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '24',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }

  //性别
  Widget _personGender() {
    return Container(
      alignment: Alignment.center,
      width: ScreenUtil.getInstance().setWidth(700.0),
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(40.0),
      ),
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: ScreenUtil.getInstance().setWidth(200.0),
            child: Text('性别：'),
          ),
          Container(
              width: ScreenUtil.getInstance().setWidth(500.0),
              height: ScreenUtil.getInstance().setHeight(80.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Foundation.getIconData('male'),
                    color: Colors.blue,
                    size: ScreenUtil.getInstance().setSp(70.0),
                  ),
                  Text('男'),
                ],
              ))
        ],
      ),
    );
  }

  //修改、删除按钮栏
  Widget _buttonBar() {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(350.0),
      ),
      width: ScreenUtil.getInstance().setWidth(800.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: ScreenUtil.getInstance().setWidth(300.0),
            child: RaisedButton(
              color: Colors.red,
              onPressed: () {},
              child: Text(
                '修改',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(300.0),
            child: RaisedButton(
              color: Colors.teal,
              onPressed: () {},
              child: Text(
                '保存',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
