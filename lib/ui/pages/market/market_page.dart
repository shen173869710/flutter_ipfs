
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/http/market_api.dart';
import 'package:ipfsnets/models/main_tab_entiy.dart';
import 'package:ipfsnets/models/market_bar_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/market/market_list_page.dart';

import '../../../include.dart';

class MarketPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _MarketStatus();
  }
}

class _MarketStatus extends State<MarketPage> with AutomaticKeepAliveClientMixin,TickerProviderStateMixin{
  List<MainTabEntiy> entiys = [];
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    getData();
    tabController  = TabController(length: entiys.length, vsync: this);
    super.initState();
  }
  @override
  bool get wantKeepAlive => true;


  Future<void> getData() async {
    BaseEntity baseEntity = await MarketApi.getMachineHome();
    if (baseEntity.isOk()) {
      List<MarketBarEntity> barEntity = baseEntity.data;
      if (barEntity != null && barEntity.length > 0) {
        int length = barEntity.length;
        List<MainTabEntiy> temp = [];
        for (int i = 0; i < length; i++) {
          MainTabEntiy entiy = new MainTabEntiy(barEntity[i].name, MarketListPage(barEntity[i].typeId));
          temp.add(entiy);
        }
        entiys = temp;
        tabController  = TabController(length: entiys.length, vsync: this);
        setState(() {
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colours.app_bar_bg,
          title: Text("IPFSNETS", style: ITextStyles.whiteTitle,
          ),
          bottom: PreferredSize(
              preferredSize: Size(double.infinity, 55.w),

              child: Container(
                  decoration: BoxDecoration(
                      color: Colours.layout_bg,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30.w), topRight: Radius.circular(30.w))
                  ),
              child:TabBar(
                controller: tabController,
                isScrollable: false,
                indicatorColor: Colours.button_sel,
                labelColor: Colours.item_title_color,
                unselectedLabelColor: Colours.item_content_color,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.only(bottom: 15.w),
                tabs: entiys.map((e) => Tab(text: e.title,)).toList(),
              ))
          )),
      body: TabBarView(
        controller: tabController,
        children: entiys.isEmpty?[]:entiys.map((item) => item.widget).toList(),
      ),
    );



  }



}