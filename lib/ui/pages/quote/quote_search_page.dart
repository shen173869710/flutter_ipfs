
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/http/market_api.dart';
import 'package:ipfsnets/models/main_tab_entiy.dart';
import 'package:ipfsnets/models/market_bar_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/market/market_list_page.dart';
import 'package:ipfsnets/ui/pages/quote/quote_optional_page.dart';

import '../../../include.dart';

class QuoteSearchPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _QuoteSearchtatus();
  }
}

class _QuoteSearchtatus extends State<QuoteSearchPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchBarDemo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context: context,delegate: SearchBarDelegate());
            },
          )
        ],
      ),

    );
  }
  }


class SearchBarDelegate extends SearchDelegate<String>{
  String searchHint = "请输入搜索内容...";
  var monthList = [
    "一月",
    "二月",
    "三月",
    "四月",
    "五月",
    "六月",
    "七月",
    "八月",
    "九月",
    "十月",
    "十一月",
    "十二月",
  ];

  var typeList = [
    "差旅费报销单",
    "一般费用报销单",
    "因公临时出国(境)支出表",
    "药费报销单",
    "合同付款审批表",
    "工资系统专用报销表",
  ];


  //清空按钮
  @override
  List<Widget>buildActions(BuildContext context){
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "", //搜索值为空
      )
    ];
  }
  //返回上级按钮
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation
        ),
        onPressed: ()=> close(context, "") //点击时关闭整个搜索页面
    );
  }
  //搜到到内容后的展现
  @override
  Widget buildResults(BuildContext context){
    return Container(
      width: 100.0,
      height:100.0,
      child: Card(
        color:Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      child: ListView(
        primary: false,
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 10.0),
          Text(
            "热门搜索",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: monthList.map((childNode) {
              return InkWell(
                child: new ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Container(
                    padding: EdgeInsets.all(3.0),
                    color:Colours.bg_color,
                    child: Text(
                      childNode,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                              color: Colors.grey, offset: Offset(0.2, 0.2))
                        ],
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  _loadData();
                  Future.delayed( Duration(seconds: 2), () async {
                    searchHint = "";
                    query = childNode;
                    showResults(context);
                  });
                },
              );
            }).toList(),
          ),

          SizedBox(height: 10.0),
          Text(
            "搜索历史",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: typeList.map((childNode) {
              return InkWell(
                child: new ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Container(
                    padding: EdgeInsets.all(3.0),
                    color:Colors.grey,
                    child: Text(
                      childNode,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                              color: Colors.grey, offset: Offset(0.2, 0.2))
                        ],
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  _loadData();
                  Future.delayed( Duration(seconds: 2), () async {
                    searchHint = "";
                    query = childNode;
                    showResults(context);
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
  _loadData() async {
    //网络加载
    // var data = await ExpenseDao.getInitExpense(1, 20);
    // Expense expense = Expense.fromJson(data);
    // items=expense.list;
  }
}