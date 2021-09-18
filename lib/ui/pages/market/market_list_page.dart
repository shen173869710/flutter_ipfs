import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/http/market_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/market_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/widget/base_list_page.dart';
import 'market_list_item.dart';

class MarketListPage extends StatefulWidget {

  late num id;
  MarketListPage(this.id);
  @override
  _MarketListState createState() => _MarketListState(id);
}

class _MarketListState extends BaseListPageState<MarketListPage> with AutomaticKeepAliveClientMixin{
  late num id;
  _MarketListState(this.id);
  List<MarketEntity> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.bg_color,
      body: buildRefreshView(context)
    );
  }

  @override
  Widget setListView(int index) {
    return MarketListItem(list[index]);
  }

  @override
  void onItemClick(BuildContext context, int index) {
    // TODO: implement onItemClick


  }

  @override
  int getListLength() {
    // TODO: implement getListSize
    return list.length;
  }


  @override
  Future<BaseEntity> getData() async{
    BaseEntity entity = await MarketApi.getMachineById(id, false);
    if (entity.isOk() && entity.data != null) {
      list.clear();
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

  @override
  bool get wantKeepAlive => true;
}
