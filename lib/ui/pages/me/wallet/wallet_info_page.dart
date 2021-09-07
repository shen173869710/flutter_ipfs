import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:ipfsnets/http/wallet_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/wallet_info_entity.dart';
import 'package:ipfsnets/models/wallet_item_entiy.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/res/styles.dart';
import 'package:ipfsnets/ui/pages/me/wallet/wallet_info_controller.dart';
import 'package:ipfsnets/ui/pages/me/wallet/wallet_info_item.dart';
import 'package:ipfsnets/utils/num_util.dart';

class WalletInfoPage extends StatefulWidget {
  @override
  _WalletInfoState createState() => _WalletInfoState();
}


class _WalletInfoState extends State<WalletInfoPage> with TickerProviderStateMixin{
  late WalletItemEntiy entiy;

  late TabController tabController;
  final WalletInfoController controller = Get.put(WalletInfoController());


  EasyRefreshController _refreshController1 = EasyRefreshController();
  EasyRefreshController _refreshController2 = EasyRefreshController();
  EasyRefreshController _refreshController3 = EasyRefreshController();


  Future _onLoading1() async {
    controller.page1++;
    bool next = await controller.getList1More(controller.page1++,entiy.coinCode);
    _refreshController1.finishLoad(noMore: next);
  }

  Future _onLoading2() async {
    controller.page2++;
    bool next = await controller.getList2More(controller.page2++,entiy.coinCode);
    _refreshController2.finishLoad(noMore: next);
  }

  Future _onLoading3() async {
    controller.page3++;
    bool next = await controller.getList3More(controller.page3++,entiy.coinCode);
    _refreshController3.finishLoad(noMore: next);
  }

  @override
  void initState() {
    this.tabController = TabController(length: 3, vsync: this);
    // TODO: implement initState
    super.initState();

    controller.initData();

  }

  getData() async {
    BaseEntity baseEntity  = await WalletApi.getWalletInfo(entiy.coinCode);
    WalletInfoEntity info = baseEntity.data;
    controller.setWalletInfoEntity(info);

    controller.getList1More(1, entiy.coinCode);
    controller.getList2More(1, entiy.coinCode);
    controller.getList3More(1, entiy.coinCode);
  }

  @override
  Widget build(BuildContext context) {
    entiy = ModalRoute.of(context)!.settings.arguments as WalletItemEntiy;
    getData();
    return GetBuilder<WalletInfoController>(builder: (controller){
      return Scaffold(
        backgroundColor: Colours.bg_color,
        appBar: AppBar(
          title: new Text(entiy.coinName),
          centerTitle: true,
          backgroundColor: Colours.app_bar_bg,
        ),
        body: Stack(
          children: [
            SizedBox(
                width: double.infinity,
                height: 70.h,
                child: Container(
                  color: Colours.app_bar_bg,
                )),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                butTop(),
                buildItem(),
                Expanded(child: TabBarView(
                  controller: tabController,
                  children: [
                    bulidRecordList1(),
                    bulidRecordList2(),
                    bulidRecordList3(),
                  ],)),
                buildBottomBtn(),
                Gaps.vGap24
              ],

            )

          ],
        ),
      );

    });
  }

  Container butTop() {
    return Container(
        width: double.infinity,
        margin: ITextStyles.containerMargin,
        padding: EdgeInsets.all(30.w),
        decoration: ITextStyles.boxDecoration,
        alignment: Alignment.topLeft,
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(children: [
              bulidTopTitle(),
            ],),
            Gaps.vGap8,
            buildInfo(S.current.wallet_info_item_1, S.current.wallet_info_item_2, ITextStyles.itemContent),
            Gaps.vGap4,
            buildInfo(controller.walletInfoEntity.txValue.toString(), controller.walletInfoEntity.freeze.toString(),ITextStyles.itemTitle),
            Visibility(child:  Gaps.vGap12,visible: entiy.coinName == "FIL"?true:false),
            Visibility(child:buildInfo(S.current.wallet_info_item_3, S.current.wallet_info_item_4,ITextStyles.itemContent),visible: entiy.coinName == "FIL"?true:false,),
            Gaps.vGap4,
            Visibility(child: buildInfo(controller.walletInfoEntity.pledge.toString(), NumUtil.prseeZero(controller.walletInfoEntity.todayEarnings.toStringAsFixed(7)),ITextStyles.itemTitle),visible: entiy.coinName == "FIL"?true:false,)
            // buildListItem()
          ],
        )

    );
  }
  // 创建顶部标题
  Text bulidTopTitle() {
    return Text.rich(TextSpan(
      children: [
        WidgetSpan(child: ImageUtil.loadImage(entiy.coinIcon, 45.w, 45.w)),
        TextSpan(text: " ", style: ITextStyles.itemContent),
        TextSpan(text: controller.walletInfoEntity.sum.toString(), style: TextStyle(fontSize: 22,color: Colours.item_red)),
      ],
    ));
  }

  Row buildInfo(String title,String desc,TextStyle textStyle) {
    return Row(
      children: [
        Text(title, style: textStyle),
        Expanded(child: SizedBox()),
        Text(desc, style: textStyle),
      ],
    );
  }

  Container buildItem() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(20.w, 0.w, 20.w, 0.w),
      decoration:BoxDecoration(
        color: Colours.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.w),topRight: Radius.circular(10.w)),
      ),
      child: TabBar(
        controller: tabController,
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: Colours.item_title_color,
        unselectedLabelColor: Colours.item_content_color,
        tabs: [
          Tab(text: S.current.wallet_info_water_1),
          Tab(text: S.current.wallet_info_water_2),
          Tab(text: S.current.wallet_info_water_3)
        ],
      ),
    );
  }

  Container bulidRecordList1() {
    return Container(
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
              controller: _refreshController1,
              header:  null,
              footer: Refresh.loadMore,
              onRefresh: null,
              onLoad: _onLoading1,
              slivers: [
                SliverList(delegate: SliverChildBuilderDelegate((context, index) {
                  return WalletInfoItem(controller.list1[index]);
                },childCount: controller.list1.length
                ))
              ]));

  }

  Container bulidRecordList2() {
    return Container(
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
            controller: _refreshController2,
            header:  null,
            footer: Refresh.loadMore,
            onRefresh: null,
            onLoad: _onLoading2,
            slivers: [
              SliverList(delegate: SliverChildBuilderDelegate((context, index) {
                return WalletInfoItem(controller.list2[index]);
              },childCount: controller.list2.length
              ))
            ]));

  }

  Container bulidRecordList3() {
    return Container(
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
            controller: _refreshController3,
            header:  null,
            footer: Refresh.loadMore,
            onRefresh: null,
            onLoad: _onLoading3,
            slivers: [
              SliverList(delegate: SliverChildBuilderDelegate((context, index) {
                return WalletInfoItem(controller.list3[index]);
              },childCount: controller.list3.length
              ))
            ]));

  }

  // 构建底部按钮
  Row buildBottomBtn() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(onPressed: (){
          NavigatorUtil.push(context, '${Routes.walletRechagePage}?coinCode=${Uri.encodeComponent(entiy.coinCode.toString())}');
        }, child: Text(S.current.wallet_info_btn_1,style: TextStyle(color: Colours.white)),style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.w)),),
          backgroundColor:MaterialStateProperty.all(Colours.button_sel),
          minimumSize: MaterialStateProperty.all(Size(180.w, 40.w)),
        )),
        TextButton(onPressed: (){
          NavigatorUtil.push(context, '${Routes.walletWithdrawalPage}?coinCode=${Uri.encodeComponent(entiy.coinCode.toString())}');
        }, child: Text(S.current.wallet_info_btn_2,style: TextStyle(color: Colours.white)),style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.w)),),
          backgroundColor:MaterialStateProperty.all(Colours.button_sel),
          minimumSize: MaterialStateProperty.all(Size(180.w, 40.w)),
        )),
        TextButton(onPressed: (){
          NavigatorUtil.push(context, '${Routes.transferPage}?coinCode=${Uri.encodeComponent(entiy.coinCode.toString())}');
        }, child: Text(S.current.wallet_info_btn_3,style: TextStyle(color: Colours.white)),style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.w)),),
          backgroundColor:MaterialStateProperty.all(Colours.button_sel),
          minimumSize: MaterialStateProperty.all(Size(180.w, 40.w)),
        )),
      ],

    );
  }
}
