import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luggage_management_demo03/local/my_localizations.dart';
import 'package:luggage_management_demo03/pages/deposit_page.dart';
import 'package:luggage_management_demo03/pages/personal_page.dart';
import 'package:luggage_management_demo03/pages/receive_page.dart';
import 'package:luggage_management_demo03/service/android_back_desktop.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  //当前页面
  int currentIndex;

  //底部按钮栏
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.card_travel),
      title: Text('寄存'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.card_giftcard),
      title: Text('领取'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('我的'),
    ),
  ];

  //底部按钮对应页面
  final List<Widget> tabPages = [
    DepositPage(),
    ReceivePage(),
    PersonalPage(),
  ];

  //页面控制器,可以左右滑动切换页面
  PageController pageController = new PageController(initialPage: 0);

  //滑动切换页面
  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  DateTime lastPopTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1980)..init(context);
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(MyLocalizations.of(context).DemoName),
          centerTitle: true,
        ),
        body: PageView.builder(
          onPageChanged: onPageChanged,
          controller: pageController,
          itemCount: tabPages.length,
          itemBuilder: (BuildContext context, int index) {
            return tabPages[index];
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.teal,
            unselectedItemColor: Colors.black,
            onTap: (int index) {
              pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
            items: bottomTabs),
      ),
      onWillPop: AndroidBackDesktop.backToDesktop,
    );
  }
}
