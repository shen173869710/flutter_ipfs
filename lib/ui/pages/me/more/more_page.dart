import 'package:ipfsnets/models/main_tab_entiy.dart';
import 'package:ipfsnets/ui/pages/find/find_recommend_page.dart';
import 'package:ipfsnets/ui/pages/find/find_status_page.dart';
import 'package:ipfsnets/ui/pages/find/more_child_page.dart';
import 'package:ipfsnets/ui/widget/main_tabs.dart';

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
    return MainTabs(S.current.more_title, entiys, true, this.tabController);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.tabController = TabController(length: entiys.length, vsync: this);
  }

}