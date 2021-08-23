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
  MarketCouponEntity couponEntity;
  MarketCouponListPage(this.type,this.couponEntity);
  @override
  _MarketCouponListState createState() => _MarketCouponListState(type,couponEntity);
}

class _MarketCouponListState extends BaseListPageState<MarketCouponListPage> with AutomaticKeepAliveClientMixin{
  late String type;
  MarketCouponEntity couponEntity;
  _MarketCouponListState(this.type,this.couponEntity);
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
    return MarketCouponItem(data: list[index],index: index,onItemSelListener: (sel,postion){
        if (couponEntity.type != list[index].type || couponEntity.total < list[index].condition) {
          return ToastUtil.show(S.current.can_not_use);
        }

        int length = list.length;
        for(int i = 0; i < length; i++) {
          list[i].sel = false;
        }
        list[postion].sel = sel;
        setState(() {

        });
        NavigatorUtil.goBackWithParams(context, list[index]);
    },);
  }

  @override
  void onItemClick(BuildContext context, int index) {
    // TODO: implement onItemClick
    LogUtil.e("index = "+index.toString());

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
      if (couponEntity != null && couponEntity.couponId != null && couponEntity.sel) {
        int length = list.length;
        for(int i = 0; i < length; i++) {
          if (couponEntity.couponId == list[i].couponId) {
            list[i].sel = couponEntity.sel;
          }
        }
      }

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
