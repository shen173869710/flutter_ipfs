import 'package:flutter/gestures.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:ipfsnets/data/global_entiy.dart';
import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/cny_record_entiy.dart';
import 'package:ipfsnets/ui/pages/me/cny/cny_record_item.dart';

class CnyAccountPage extends StatelessWidget {
  List<CnyRecordEntiy> list = List.from(GlobalEntiy.cnyList);


  EasyRefreshController _refreshController = EasyRefreshController();
  int page = 1;
  bool isFailure = false;
  Future _onRefresh() async {
    page = 1;
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    // _refreshController.resetLoadState();
    _refreshController.finishRefresh();
  }

  Future _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    // _refreshController.resetRefreshState();
    _refreshController.finishLoad();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colours.bg_color,
      appBar: AppBar(
        title: new Text(S.current.cny_title),
        centerTitle: true,
        backgroundColor: Colours.app_bar_bg,
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: [
            SizedBox(
                width: double.infinity,
                height: 70.h,
                child: Container(
                  color: Colours.app_bar_bg,
                )),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: ITextStyles.containerMargin,
                  padding: EdgeInsets.all(20.w),
                  decoration: ITextStyles.boxDecoration,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      bulidTopTitle(),
                      Gaps.vGap8,
                      bulidTopMoney(),
                      Gaps.vGap12,
                      Gaps.line,
                      Gaps.vGap12,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          bulidBottomIcon(context,R.assetsImgIcCnyRechage, S.current.cny_rechage,1),
                          Gaps.vLine,
                          bulidBottomIcon(context,R.assetsImgIcCnyWithdrawal, S.current.cny_withdrawal,2),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(20.w, 0.w, 20.w, 0),
                    padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 0),
                    decoration: new BoxDecoration(
                        color: Colours.text_white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.w),
                            topRight: Radius.circular(10.w))
                        // borderRadius: new BorderRadius.circular((10.w)),
                        ),
                    child: SingleChildScrollView(
                      reverse: false,
                      padding: EdgeInsets.all(0.0),
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Text("    "+S.current.cny_item_1,
                                    style: ITextStyles.itemContent),
                                flex: 1,
                              ),
                              Expanded(
                                child: Text("  "+S.current.cny_item_2,
                                    style: ITextStyles.itemContent),
                                flex: 1,
                              ),
                              Expanded(
                                child: Text("   "+S.current.cny_item_3,
                                    style: ITextStyles.itemContent),
                                flex: 1,
                              ),
                            ],
                          ),
                          Gaps.vGap12,
                          Gaps.line,
                        ],
                      ),
                    )),
                bulidRecordList(),
              ],
            )
          ],
        ),
      ),
    );
  }

  // 创建顶部标题
  Text bulidTopTitle() {
    return Text.rich(TextSpan(
      children: [
        WidgetSpan(
            child: Image.asset(
          R.assetsImgIcCnyIcon,
          height: 30.w,
          width: 30.w,
        )),
        TextSpan(text: " ", style: ITextStyles.itemContent),
        TextSpan(text: S.current.cny_all, style: ITextStyles.itemContent),
      ],
    ));
  }

  // 创建顶部资产
  Text bulidTopMoney() {
    return Text.rich(TextSpan(
      children: [
        TextSpan(
            text: "12345",
            style: TextStyle(color: Colours.item_red, fontSize: 32)),
        TextSpan(text: " ", style: ITextStyles.itemContent),
        TextSpan(text: "CNY", style: ITextStyles.itemTitle),
      ],
    ));
  }

  // 创建充值和提现按钮
  Text bulidBottomIcon(BuildContext context,String image, String name, int type) {
    return Text.rich(TextSpan(
      children: [
        WidgetSpan(
            child: Image.asset(
          image,
          height: 42.w,
          width: 42.w,
        )),
        TextSpan(text: "  ", style: ITextStyles.itemContent,recognizer: TapGestureRecognizer()..onTap=(){
          // 充值
          if (type == 1) {
            NavigatorUtil.jump(context, Routes.cnyRechage);
          }else{
            NavigatorUtil.jump(context, Routes.cnyWithdrawal);
          }
        }),
        TextSpan(text: name, style: TextStyle(fontSize: 20, color: Colours.tab_sel),recognizer: TapGestureRecognizer()..onTap=(){
          if (type == 1) {
            NavigatorUtil.jump(context, Routes.cnyRechage);
          }else{
            NavigatorUtil.jump(context, Routes.cnyWithdrawal);
          }
          // 提现
        }),
      ],
    ));
  }

  // 创建充值和提现记录
  Expanded bulidRecordList() {
    return    Expanded(
      child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20.w, 0.w, 20.w, 30.w),
          decoration: new BoxDecoration(
              color: Colours.text_white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.w),
                  bottomRight: Radius.circular(10.w))
            // borderRadius: new BorderRadius.circular((10.w)),
          ),
          child:EasyRefresh.custom(
              enableControlFinishRefresh: false,
              enableControlFinishLoad: true,
              controller: _refreshController,
              header:  null,
              footer: ClassicalFooter(),
              onRefresh: _onRefresh,
              onLoad: _onLoading,
              slivers: [
                SliverList(delegate: SliverChildBuilderDelegate((context, index) {
                  return CnyRecordItem(list[index]);
                },childCount: list.length
                ))
              ])),
    );
  }
}
