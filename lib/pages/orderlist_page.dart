import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luggage_management_demo03/providers/orderlist_provider.dart';
import 'package:luggage_management_demo03/service/service_method.dart';
import 'package:provide/provide.dart';

class OrderListPage extends StatelessWidget {
  PostDataSource _postDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('订单列表'),
      ),
      body: Provide<OrderlistProvider>(
        builder: (context, child, orderListProvider) {
          return _orderList(context);
        },
      ),
    );
  }

  //订单列表
  Widget _orderList(BuildContext context) {
    return ListView(
      children: <Widget>[
        PaginatedDataTable(
          header: _tableHeader(context),
          columnSpacing: ScreenUtil.getInstance().setWidth(0),
          headingRowHeight: ScreenUtil.getInstance().setHeight(100.0),
          dataRowHeight: ScreenUtil.getInstance().setHeight(130.0),
          columns: <DataColumn>[
            DataColumn(
              label: Container(
                alignment: Alignment.center,
                width: ScreenUtil.getInstance().setWidth(150.0),
                child: Text('客户姓名'),
              ),
            ),
            DataColumn(
              label: Container(
                alignment: Alignment.center,
                width: ScreenUtil.getInstance().setWidth(250.0),
                child: Text('手机号'),
              ),
            ),
            DataColumn(
              label: Container(
                alignment: Alignment.center,
                width: ScreenUtil.getInstance().setWidth(150.0),
                child: Text('领取状态'),
              ),
            ),
            DataColumn(label: Container(
              alignment: Alignment.center,
              width: ScreenUtil.getInstance().setWidth(230.0),
              child: Text('修改订单'),
            )),
          ],
          source: _postDataSource,
        ),
      ],
    );
  }

  //订单表头
  Widget _tableHeader(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          _getListBtn(context),
          _searchField(),
          _serachBtn(),
        ],
      ),
    );
  }

  //下拉筛选按钮
  Widget _getListBtn(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(350.0),
      child: DropdownButton(
        items: _getListData(),
        hint: Text(
          '请选择查找方式',
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(35.0),
          ),
        ),
        onChanged: (value) {
          print(value);
          Provide.value<OrderlistProvider>(context).changeSearchType(value);
        },
        value: Provide.value<OrderlistProvider>(context).searchType,
        isDense: true,
        isExpanded: true,
        underline: Container(),
      ),
    );
  }

  //下拉筛选框返回组件构造方法
  List<DropdownMenuItem> _getListData() {
    List<DropdownMenuItem> items = new List();
    DropdownMenuItem dropdownMenuItem1 = new DropdownMenuItem(
      child: Text(
        '全部',
        style: TextStyle(
          fontSize: ScreenUtil.getInstance().setSp(35.0),
        ),
      ),
      value: 1,
    );
    items.add(dropdownMenuItem1);
    DropdownMenuItem dropdownMenuItem2 = new DropdownMenuItem(
      child: Text(
        '按客户姓名查找',
        style: TextStyle(
          fontSize: ScreenUtil.getInstance().setSp(35.0),
        ),
      ),
      value: 2,
    );
    items.add(dropdownMenuItem2);
    DropdownMenuItem dropdownMenuItem3 = new DropdownMenuItem(
      child: Text(
        '按客户手机号查找',
        style: TextStyle(
          fontSize: ScreenUtil.getInstance().setSp(35.0),
        ),
      ),
      value: 3,
    );
    items.add(dropdownMenuItem3);
    DropdownMenuItem dropdownMenuItem4 = new DropdownMenuItem(
      child: Text(
        '按行李员姓名查找',
        style: TextStyle(
          fontSize: ScreenUtil.getInstance().setSp(35.0),
        ),
      ),
      value: 4,
    );
    items.add(dropdownMenuItem4);
    return items;
  }

  //查找输入框
  Widget _searchField() {
    return Container(
      height: ScreenUtil.getInstance().setHeight(80.0),
      width: ScreenUtil.getInstance().setWidth(350.0),
      margin: EdgeInsets.only(
        left: ScreenUtil.getInstance().setWidth(30.0),
        right: ScreenUtil.getInstance().setWidth(30.0),
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: '请输入搜索内容',
            labelStyle: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(35.0),
            )),
      ),
    );
  }

  //搜索按钮
  Widget _serachBtn() {
    return Container(
      width: ScreenUtil.getInstance().setWidth(190.0),
      child: RaisedButton(
        color: Colors.grey,
        onPressed: () {},
        child: Text(
          'Search',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class PostDataSource extends DataTableSource {
  @override
  DataRow getRow(int index) {
    // TODO: implement getRow
    request('orderlist').then((value) {
      return;
    });

    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          Container(
            alignment: Alignment.center,
            width: ScreenUtil.getInstance().setWidth(150.0),
            child: Text('陈奕迅'),
          ),
        ),
        DataCell(
          Container(
            alignment: Alignment.center,
            width: ScreenUtil.getInstance().setWidth(250.0),
            child: Text('12345678910'),
          ),
        ),
        DataCell(
          Container(
            alignment: Alignment.center,
            width: ScreenUtil.getInstance().setWidth(150.0),
            child: Text('未领取'),
          ),
        ),
        DataCell(Container(
          alignment: Alignment.center,
          width: ScreenUtil.getInstance().setWidth(230.0),
          child: Container(
            width: ScreenUtil.getInstance().setWidth(200.0),
            child: RaisedButton(
              color: Colors.red,
              onPressed: () {},
              child: Text(
                '编辑',
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(35.0),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )),
      ],
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => 10;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
