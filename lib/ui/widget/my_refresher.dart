

import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../include.dart';

class MyRefresher extends StatelessWidget{

  RefreshController _refreshController;
  VoidCallback? onRefresh;
  VoidCallback? onLoading;
  bool enablePullDown;
  bool enablePullUp;
  ListView _listView;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colours.bg_color,
        body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: WaterDropHeader(),
          footer: ClassicFooter(),
          controller: _refreshController,
          onRefresh: onRefresh,
          onLoading: onLoading,
          child: _listView
        )
    );
  }

  MyRefresher(this._refreshController, this.onRefresh, this.onLoading,
      this.enablePullDown, this.enablePullUp,this._listView);

}