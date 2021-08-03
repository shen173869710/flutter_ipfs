
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/http/market_api.dart';
import 'package:ipfsnets/models/main_tab_entiy.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/find/find_recommend_page.dart';

import '../../../include.dart';
import 'market_coupon_list_page.dart';

class MarketCouponsPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _MarketCouponsStatus();
  }
}

class _MarketCouponsStatus extends State<MarketCouponsPage> with AutomaticKeepAliveClientMixin,TickerProviderStateMixin{
  List<MainTabEntiy> entiys = [
    MainTabEntiy(S.current.market_coupons_item_1, MarketCouponListPage("dated")),
    MainTabEntiy(S.current.market_coupons_item_2, MarketCouponListPage("unused")),
    MainTabEntiy(S.current.market_coupons_item_3, MarketCouponListPage("used")),
  ];
  late TabController tabController;

  @override
  void initState() {
    tabController  = TabController(length: entiys.length, vsync: this);
    super.initState();
  }
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colours.app_bar_bg,
          title: Text(S.current.market_coupons_title, style: ITextStyles.whiteTitle,
          ),
          bottom: PreferredSize(
              preferredSize: Size(double.infinity, 50.w),
              child: TabBar(
                controller: tabController,
                isScrollable: true,
                indicatorColor: Colours.white,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: entiys.map((e) => Tab(text: e.title,)).toList(),
              ))),
      body: TabBarView(
        controller: tabController,
        children: entiys.isEmpty?[]:entiys.map((item) => item.widget).toList(),
      ),
    );



  }



}