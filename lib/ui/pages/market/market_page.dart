
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipfsnets/generated/l10n.dart';
import 'package:ipfsnets/models/main_tab_entiy.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/find/find_controller.dart';
import 'package:ipfsnets/ui/pages/find/find_recommend_page.dart';
import 'package:ipfsnets/ui/pages/find/find_status_page.dart';
import 'package:ipfsnets/ui/pages/main_page.dart';
import 'package:ipfsnets/ui/widget/main_tabs.dart';

class MarketPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _MarketStatus();
  }
}

class _MarketStatus extends State<MarketPage> with SingleTickerProviderStateMixin{
  late TabController tabController;
  final FindController findController = Get.put(FindController());
  List<MainTabEntiy> entiys = [
    MainTabEntiy(S.current.find_tab_1, FindRecommend()),
    MainTabEntiy(S.current.find_tab_2, FindRecommend()),
    MainTabEntiy(S.current.find_tab_3, FindRecommend()),
    MainTabEntiy(S.current.find_tab_4, FindStatusPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return MainTabs("IPFSNETS", entiys, true, this.tabController);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.tabController = TabController(length: entiys.length, vsync: this);
  }

}