import 'package:ipfsnets/models/main_tab_entiy.dart';
import 'package:ipfsnets/ui/pages/find/more_child_page.dart';

import '../../../../include.dart';

class MorePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _FindStatus();
  }
}

class _FindStatus extends State<MorePage> with SingleTickerProviderStateMixin{
  late TabController tabController;
  List<MainTabEntiy> entiys = [
    MainTabEntiy(S.current.more_tab_1, MoreChildPage(0)),
    MainTabEntiy(S.current.more_tab_2, MoreChildPage(1)),
    MainTabEntiy(S.current.more_tab_3, MoreChildPage(2)),
    MainTabEntiy(S.current.more_tab_4, MoreChildPage(3)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colours.app_bar_bg,
          title: Text(
            "INSTAR",
            style: ITextStyles.whiteTitle,
          ),
          bottom: PreferredSize(
              preferredSize: Size(double.infinity, 90.w),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colours.layout_bg,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.w),
                          topRight: Radius.circular(30.w))),
                  child: TabBar(
                    controller: tabController,
                    isScrollable: false,
                    indicatorColor: Colours.button_sel,
                    labelColor: Colours.item_title_color,
                    unselectedLabelColor: Colours.item_content_color,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.only(bottom: 15.w),
                    tabs: entiys
                        .map((e) => Tab(
                              text: e.title,
                            ))
                        .toList(),
                  )))),
      body: TabBarView(
        controller: tabController,
        children:
            entiys.isEmpty ? [] : entiys.map((item) => item.widget).toList(),
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