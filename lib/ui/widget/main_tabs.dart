import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/models/main_tab_entiy.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/res/styles.dart';
import 'package:ipfsnets/include.dart';

class MainTabs extends StatelessWidget {
  late String title;
  late List<MainTabEntiy> tabs;
  late bool tabScrollable;
  late TabController tabController;

  MainTabs(this.title, this.tabs, this.tabScrollable, this.tabController);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colours.app_bar_bg,
          title: Text(
            title,
            style: ITextStyles.whiteTitle,
          ),
          bottom: PreferredSize(
              preferredSize: Size(double.infinity, 50.w),
              child: TabBar(
                controller: tabController,
                isScrollable: tabScrollable,
                indicatorColor: Colours.white,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: tabs.map((e) => Tab(
                          text: e.title,
                        ))
                    .toList(),
              ))),
      body: TabBarView(
        controller: this.tabController,
        children: this.tabs.map((item) => item.widget).toList(),
      ),
    );
  }
}
