import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/http/quote_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/find__entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/find/new_item.dart';
import 'package:ipfsnets/ui/widget/base_list_page.dart';

class FindRecommend extends StatefulWidget {
  @override
  _FindRecommendState createState() => _FindRecommendState();
}

class _FindRecommendState extends BaseListPageState<FindRecommend> {
  List<FindEntity> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.bg_color,
      body: buildRefreshView(context)
    );
  }

  @override
  Widget setListView(int index) {
    return NewsItem(list[index]);
  }

  @override
  void onItemClick(BuildContext context, int index) {
    // TODO: implement onItemClick

    String url = list[index].noticeContent;
    if (StringUtil.isNotEmpty(url)) {
      url = url.replaceAll('<p>', '');
      url = url.replaceAll('</p>', '');
    }
    print("-----------"+url);
    NavigatorUtil.goWebViewPage(context, list[index].noticeTitle, url);
  }

  @override
  int getListLength() {
    // TODO: implement getListSize
    return list.length;
  }


  @override
  Future<BaseEntity> getData() async{
    // TODO: implement getData
    BaseEntity entity = await QuoteApi.findList();
    if(entity.isOk() && entity.data != null) {
      list.addAll(entity.data);
      setState(() {

      });
    }
    return entity;
  }

  @override
  void clearList() {
    list.clear();
  }
}
