import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/http/market_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/market_coupon_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/widget/base_list_page.dart';

import 'market_coupon_item.dart';

class MarketCouponListPage extends StatefulWidget {
  late String type;
  MarketCouponListPage(this.type);
  @override
  _MarketCouponListState createState() => _MarketCouponListState(type);
}

class _MarketCouponListState extends BaseListPageState<MarketCouponListPage> with AutomaticKeepAliveClientMixin{
  late String type;
  _MarketCouponListState(this.type);
  List<MarketCouponEntity> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.bg_color,
      body: buildRefreshView(context)
    );
  }

  @override
  Widget setListView(int index) {
    return MarketCouponItem(list[index]);
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
    BaseEntity entity = await MarketApi.getMachineCoupon(type);
    if (entity.isOk()) {
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
