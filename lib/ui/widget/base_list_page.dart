import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../include.dart';

abstract class BaseListPageState< W extends StatefulWidget>extends State<W>{

  EasyRefreshController _refreshController = EasyRefreshController();
  int page = 1;
  bool isFailure = false;
  Future _onRefresh() async {
    page = 1;
    requestListData();
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    // _refreshController.resetLoadState();
    _refreshController.finishRefresh();
  }

  Future _onLoading() async {
    requestListData();
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    // _refreshController.resetRefreshState();
    _refreshController.finishLoad();
  }

  int getPage() {
    return page;
  }

  // @override
  // void listFailure() {
  //   if (page == 1) {
  //     isFailure = true;
  //     _refreshController.refreshCompleted();
  //   } else {
  //     _refreshController.loadFailed();
  //   }
  //
  //   setState(() {});
  // }

  // @override
  // void listSuccess(ListEntity result) {
  //   total = result.count;
  //   if (page == 1) {
  //     isFailure = false;
  //     setEnableLoadMore(true);
  //     list.clear();
  //     list.addAll(result.getList<T>());
  //     _refreshController.refreshCompleted();
  //   } else {
  //     list.addAll(result.getList<T>());
  //     _refreshController.loadComplete();
  //   }
  //   page++;
  //
  //   if (list == null || list.length == 0) {
  //     //列表为空
  //     return;
  //   }
  //   if (list.length >= total) {
  //     //没有更多数据了
  //     _refreshController.loadNoData();
  //   }
  // }

  //是否开启下拉刷新
  bool _enableRefresh = true;

  //是否开启上拉加载
  bool _enableLoadMore = true;

  /// 构建一个带刷新的列表视图
  Widget buildRefreshView(BuildContext context) {
    return
      EasyRefresh.custom(
        enableControlFinishRefresh: _enableLoadMore,
        enableControlFinishLoad: _enableLoadMore,
        controller: _refreshController,
        header: _enableLoadMore ? ClassicalHeader() : null,
        footer: _enableLoadMore ? ClassicalFooter() : null,
        onRefresh: _onRefresh,
        onLoad: _onLoading,
        slivers: [
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            return setListView(index);
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

  //请求列表数据
  void requestListData();

  //是否开启加载更多
  void setEnableLoadMore(enable) {
    _enableLoadMore = enable;
  }

  //是否开启下拉刷新
  void setEnableRefresh(enable) {
    _enableRefresh = enable;
  }

}
