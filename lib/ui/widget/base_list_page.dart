import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../include.dart';

abstract class BaseListPageState< W extends StatefulWidget>extends State<W>{

  EasyRefreshController _refreshController = EasyRefreshController();
  int page = 1;
  bool isFailure = false;
  Future _onRefresh() async {
    page = 1;
    clearList();
    BaseEntity entity = await getData();

    bool hasNex = false;
    if (entity.total <= 10) {
      hasNex = true;
    }

    if (_refreshController != null) {
      LogUtil.e("停止刷新");
      _refreshController.finishRefresh(success: true);
      _refreshController.finishLoad(success:true,noMore: hasNex);
    }
    // _refreshController.finishRefresh(success: true);
  }

  Future _onLoading() async {
    page++;
    BaseEntity entity = await getData();
    int max = (page-1) * 10;
    bool hasNex = false;
    if ( max > entity.total || entity.total < 10) {
       hasNex = true;
    }
    LogUtil.e("停止加载更多"+hasNex.toString());
    if (_refreshController != null) {
      _refreshController.finishLoad(success:true,noMore: hasNex);
    }
  }

  @override
  void initState() {
    _onRefresh();
    super.initState();
  }


  int getPage() {
    return page;
  }

  //是否开启下拉刷新
  bool _enableRefresh = true;
  //是否开启上拉加载
  bool _enableLoadMore = true;

  /// 构建一个带刷新的列表视图
  Widget buildRefreshView(BuildContext context) {
    return EasyRefresh.custom(
        enableControlFinishRefresh: _enableRefresh,
        enableControlFinishLoad: _enableLoadMore,
        controller: _refreshController,
        header: _enableRefresh ? Refresh.head : null,
        footer: _enableLoadMore ? Refresh.loadMore: null,
        onRefresh: _enableRefresh? _onRefresh :null,
        shrinkWrap: true,
        onLoad: _enableLoadMore ?_onLoading :null,
          topBouncing: true,
          bottomBouncing: true,
        slivers: [
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            return GestureDetector(child: setListView(index),onTap: (){
                onItemClick(context, index);
            },);
          },childCount: getListLength()
          ))
        ]);

    // return SmartRefresher(
    //   enablePullDown: enableRefresh,
    //   enablePullUp: enableLoadMore,
    //   header: ClassicHeader(),
    //   footer: ClassicFooter(),
    //   controller: _refreshController,
    //   onRefresh: _onRefresh,
    //   onLoading: _onLoading,
    //   child: setListView(),
    // );
  }

  ///有返回列表视图。无数据，返回空视图
  Widget setListView(int index);

  int getListLength();

  //列表行点击事件
  void onItemClick(BuildContext context, int index);


  Future<BaseEntity> getData();
  void clearList();



  //是否开启加载更多
  void setEnableLoadMore(enable) {
    _enableLoadMore = enable;
  }

  //是否开启下拉刷新
  void setEnableRefresh(enable) {
    _enableRefresh = enable;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _refreshController.dispose();
    super.dispose();

  }

}
