import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luggage_management_demo03/pages/login_page.dart';
import 'package:luggage_management_demo03/providers/personal_provider.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getClerk(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Provide<PersonalProvider>(
        builder: (context, child, personalProvider) {
          return Stack(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    _personImg(),
                    _personInfo(context),
                    _menuBar(context),
                  ],
                ),
              ),
              _logoutButton(context),
            ],
          );
        },
      ),
    );
  }

  //行李员图片
  Widget _personImg() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: ScreenUtil.getInstance().setHeight(40.0),
          ),
          color: Colors.black26,
          height: ScreenUtil.getInstance().setHeight(2.0),
        ),
        Container(
          margin: EdgeInsets.only(
            top: ScreenUtil.getInstance().setHeight(40.0),
          ),
          child: ClipOval(
            child: Image.network(
              "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=430089504,3674027973&fm=26&gp=0.jpg",
              fit: BoxFit.cover,
              height: ScreenUtil.getInstance().setWidth(300.0),
              width: ScreenUtil.getInstance().setWidth(300.0),
            ),
          ),
        ),
      ],
    );
  }

  //行李员信息  姓名、所属酒店
  Widget _personInfo(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          Provide.value<PersonalProvider>(context).clerkName,
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(40.0),
          ),
        ),
        Text(
          Provide.value<PersonalProvider>(context).clerkHotel,
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(40.0),
          ),
        ),
      ],
    );
  }

  //菜单栏按钮
  Widget _menuBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(20.0)),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/person');
            },
            leading: Icon(
              Icons.person_outline,
              color: Colors.teal,
            ),
            title: Text('个人信息'),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[350],
            ),
          ),
          Divider(
            height: 1.0,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/orderlist');
            },
            leading: Icon(
              Icons.list,
              color: Colors.teal,
            ),
            title: Text('订单列表'),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[350],
            ),
          ),
          Divider(
            height: 1.0,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/language');
            },
            leading: Icon(
              Icons.settings,
              color: Colors.teal,
            ),
            title: Text('语言设置'),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[350],
            ),
          ),
          Divider(
            height: 1.0,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.update,
              color: Colors.teal,
            ),
            title: Text('检查更新'),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[350],
            ),
          ),
        ],
      ),
    );
  }

  //退出登陆按钮
  Widget _logoutButton(BuildContext context) {
    return Positioned(
      width: ScreenUtil.getInstance().setWidth(800.0),
      height: ScreenUtil.getInstance().setHeight(120.0),
      top: ScreenUtil.getInstance().setHeight(1440),
      left: ScreenUtil.getInstance().setWidth(140.0),
      child: RaisedButton(
        color: Colors.red,
        onPressed: () {
          //跳转并销毁当前页面
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => new LoginPage()),
                (Route<dynamic> route) => false,
          );
        },
        child: Text(
          "退出登陆",
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

  //获取行李员信息
  getClerk(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String name = sharedPreferences.getString('clerkName');
    String img = sharedPreferences.getString('clerkImg');
    String hotel = sharedPreferences.getString('clerkHotel');
    Provide.value<PersonalProvider>(context).setName(name);
    Provide.value<PersonalProvider>(context).setImg(img);
    Provide.value<PersonalProvider>(context).setHotel(hotel);
  }
}
