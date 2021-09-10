
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipfsnets/generated/l10n.dart';
import 'package:ipfsnets/models/main_tab_entiy.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/find/find_controller.dart';
import 'package:ipfsnets/ui/pages/find/find_recommend_page.dart';
import 'package:ipfsnets/ui/pages/find/find_status_page.dart';
import 'package:ipfsnets/ui/widget/main_tabs.dart';

import '../../../include.dart';

class FindPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _FindStatus();
  }
}

class _FindStatus extends State<FindPage> with SingleTickerProviderStateMixin{
  late TabController tabController;
  final FindController findController = Get.put(FindController());
  List<MainTabEntiy> entiys = [
    MainTabEntiy(S.current.find_tab_1, FindRecommend()),
    MainTabEntiy(S.current.find_tab_3, FindStatusPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colours.app_bar_bg,
            title: Text("INSTAR", style: ITextStyles.whiteTitle,),
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 90.w),
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
                      ))),)
        ),
        body: TabBarView(
            controller: tabController,
            children: entiys.isEmpty?[]:entiys.map((item) => item.widget).toList(),
    ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.tabController = TabController(length: entiys.length, vsync: this);
  }

}