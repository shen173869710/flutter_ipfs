
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/http/market_api.dart';
import 'package:ipfsnets/models/main_tab_entiy.dart';
import 'package:ipfsnets/models/market_coupon_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/find/find_recommend_page.dart';

import '../../../include.dart';
import 'market_coupon_list_page.dart';

class MarketCouponsPage extends StatefulWidget{
  MarketCouponEntity entity;

  MarketCouponsPage(this.entity);
  @override
  State<StatefulWidget> createState() {
    return _MarketCouponsStatus(entity);
  }
}

class _MarketCouponsStatus extends State<MarketCouponsPage> with AutomaticKeepAliveClientMixin,TickerProviderStateMixin{
  late TabController tabController;
  MarketCouponEntity entity;
  _MarketCouponsStatus(this.entity);

  List<MainTabEntiy> entiys = [];

  @override
  void initState() {
    entiys = [
      MainTabEntiy(S.current.market_coupons_item_1, MarketCouponListPage("unused",entity)),
      MainTabEntiy(S.current.market_coupons_item_2, MarketCouponListPage("dated",entity)),
      MainTabEntiy(S.current.market_coupons_item_3, MarketCouponListPage("used",entity)),
    ];
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
          title: Text(S.current.market_coupons_title, style: ITextStyles.whiteTitle,),
          bottom: PreferredSize(
              preferredSize: Size(double.infinity, 55.w),
              child: Material(
                  color: Colours.app_bar_bg,
                  child:Container(
                    decoration: BoxDecoration(
                        color: Colours.layout_bg,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.w), topRight: Radius.circular(30.w))
                    ),
                  child: TabBar(
                      controller: tabController,
                      isScrollable: false,
                      indicatorColor: Colours.button_sel,
                      labelColor: Colours.item_title_color,
                      unselectedLabelColor: Colours.item_content_color,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorPadding: EdgeInsets.only(bottom: 15.w),
                      tabs: entiys.map((e) => Tab(text: e.title,)).toList(),
                    )
                  )
              )
          )
      ),
      body: TabBarView(
        controller: tabController,
        children: entiys.isEmpty?[]:entiys.map((item) => item.widget).toList(),
      ),
    );
  }



}