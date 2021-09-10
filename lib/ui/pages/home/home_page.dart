import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/http/market_api.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';

import '../../../include.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeStatus();
  }
}

class _HomeStatus extends State<HomePage> {

  var hotSearchTag = [
    "网曝杨紫邓伦热恋 | 元宵节诗词 | 身份证异地能补办吗",
    "两限房是什么意思 | 公务员可以考研吗 | 一元等于多少日元",
    "喻恩泰喊话王景春 | 云南结婚吹唢呐视频 | 汉服下裙穿法",
    "网曝杨紫邓伦热恋 | 元宵节诗词 | 身份证异地能补办吗",
    "两限房是什么意思 | 公务员可以考研吗 | 一元等于多少日元",
    "喻恩泰喊话王景春 | 云南结婚吹唢呐视频 | 汉服下裙穿法"
  ];


  HomeController controller = Get.put(HomeController());
  Future<void> getData() async {
    BaseEntity baseEntity = await MarketApi.homeInfo();
    if (baseEntity.isOk() && baseEntity.data != null) {
      controller.setHomeEntity(baseEntity.data);

    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.init();
    getData();
  }

  var top = 0.0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder:(controller){
      return  Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 0.h,
                  backgroundColor: Colours.app_bar_bg,
                  pinned: true,
                  flexibleSpace: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        top = constraints.biggest.height;
                        return FlexibleSpaceBar(
                            centerTitle: true,
                            title: Visibility(
                              child: Text("IPFSNETS",
                                  style: TextStyle(color: Colours.white, fontSize: 20)), visible: top > 164 ? false : true,
                            ),
                            background: buildBackground());
                      }),
                ),
              ];
            },
            body:SingleChildScrollView(
              child: Column(
                children: [
                  buildNotice(),
                  buildItem1(),
                  buildItem2(),
                  buildTilte(R.assetsImgHomeItem3,S.current.home_item_3,"",false,0),
                  buildItem3(context),
                  buildTilte(R.assetsImgHomeItem4,S.current.home_item_4,S.current.home_info,true,1),
                  buildItem4(context),
                  buildTilte(R.assetsImgHomeItem5,S.current.home_item_5,controller.item5_title,true,2),
                  buildItem5(context)
                ],
              ),
            )
            // body: ListView.separated(itemBuilder: (context, index){
            //   return  Column(
            //     children: [
            //       buildNotice(),
            //       buildItem1(),
            //       buildItem2(),
            //       buildTilte(R.assetsImgHomeItem3,S.current.home_item_3,false),
            //       buildItem3(context),
            //       buildTilte(R.assetsImgHomeItem4,S.current.home_item_4,true),
            //       buildItem4(context),
            //       buildTilte(R.assetsImgHomeItem5,S.current.home_item_5,false),
            //       buildItem5(context)
            //     ],
            //   );
            // }, itemCount: 1, separatorBuilder: (BuildContext context, int index) { return Text(""); },),
          ));
    });
  }
  // 背景
  buildBackground() {
    return Stack(children: [
      Image.asset(R.assetsImgIcHomeGet, fit: BoxFit.cover,height: double.infinity,width: double.infinity,),
      Positioned(
        top: 100.h,
        left: 50.h,
        child: buildItem("0.00001",R.assetsImgIcEnvelope),
      ),
      Positioned(
        top: 100.h,
        right: 50.h,
        child: buildItem("0.00001",R.assetsImgIcMasonry),
      )
    ],);
  }
  Column buildItem(String title, String image) {
    return Column(
      children: [
          Image.asset(image,width: 60.w,height: 60.w,),
          Text(title,style: TextStyle(fontSize: 12, color: Colours.white),)
      ],
    );
  }
  // 标题
  buildTilte(String image,String title,String info,bool show, int index) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w,top: 10.w,bottom: 10.w),
      child: Row(
        children: [
          Image.asset(image,width: 35.w,height: 35.w,),
          Gaps.hGap4,
          Text(title, style: ITextStyles.itemTitle,),
          Expanded(child: SizedBox()),
          Visibility(child:GestureDetector(child: Text(info, style: ITextStyles.itemContentSel,),onTap: (){
            if (index == 1) {
              NavigatorUtil.jump(context, Routes.machineTotalPage);
            }else if (index == 2) {
              controller.onCnyChange(info);
            }
          },),visible: show,)

        ],
      ),
    );
  }
  // 顶部notice
  buildNotice() {
    return  Container(
        color: Colours.app_bar_bg,
        child: Container(
          padding: EdgeInsets.fromLTRB(20.w, 30.w, 30.w, 20.w),
          decoration: BoxDecoration(
              color: Colours.layout_bg,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30.w), topRight: Radius.circular(30.w))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(R.assetsImgHomeNotice, height: 35.w, width: 35.w,),
              Gaps.hGap4,
              // Flexible(child:MyNoticeVecAnimation(duration: const Duration(milliseconds: 5000),messages: hotSearchTag),),
              SizedBox(),
            ],),
        )

    );
  }
  // 我的钱包
  buildItem1() {
    return Container(
      color: Colours.white,
      padding: EdgeInsets.fromLTRB(0.w, 30.w, 0.w, 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildItm(R.assetsImgHomeItemWallet,  S.current.home_wallet),
          buildItm(R.assetsImgHomeItemTreasure,  S.current.home_treasure),
          buildItm(R.assetsImgHomeItemMonitoring,  S.current.home_monitoring),
          buildItm(R.assetsImgHomeItemMining,  S.current.home_mining)
        ],
      ),
    );
  }
  // 图片
  buildItem2() {
    return Container(
      margin: ITextStyles.containerMargin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.w),
        child: Image.asset(R.assetsImgIcHomeGet,fit: BoxFit.cover,width: double.infinity,height: 150.w,),
      )
    );
  }
  // 24小时封装成本
  buildItem3(BuildContext context){
    return Container(
      margin: EdgeInsets.all(20.w),
      padding: EdgeInsets.all(10.w),
      decoration: ITextStyles.boxDecoration,
      child:Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildItem3Title(S.current.home_item_3_1,0),
              buildItem3Title(S.current.home_item_3_2,1),
              buildItem3Title(S.current.home_item_3_3,2),
            ],
          ),
          Gaps.vGap4,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildItem1Desc(controller.item3_1, S.current.home_item_3_1_desc,Color(0xff516DFF)),
              Gaps.vLine,
              buildItem1Desc(controller.item3_2, S.current.home_item_3_2_desc,Color(0xff00E253)),
              Gaps.vLine,
              buildItem1Desc(controller.item3_3, S.current.home_item_3_3_desc,Color(0xffF23E2A)),
            ],
          ),
          Gaps.vGap8
        ],
      ),
    );
  }
  buildItem3Title(String title,int index){
    return SizedBox(width: 180.w,child:TextButton(onPressed:(){
      controller.onBtnClick(index);
    }, child: Text(title,style: TextStyle(fontSize: 12,color:controller.btnSel == index?Colours.item_title_color:Colours.item_content_color),),
        style:  controller.btnSel == index?IButtonStyle.chainButtonSel:IButtonStyle.chainButtonUnsel));
  }
  buildItem1Desc(String title, String dec,Color textColor) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 14,color: textColor),),
        Text(dec, style: ITextStyles.itemContent12)
      ],
    );
  }
  // 矿区收益
  buildItem4(BuildContext context){
    return Container(
      margin: EdgeInsets.all(20.w),
      padding: EdgeInsets.all(20.w),
      decoration: ITextStyles.boxDecoration,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(S.current.home_item_4_0, style: ITextStyles.itemContent12),
              Gaps.vGap4,
              Text(controller.item4_1, style: TextStyle(fontSize: 16,color: Color(0xffF23E2A)),),
            ],
          ),
          Gaps.vGap8,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child:buildItem3Desc(controller.item4_2, S.current.home_item_4_1),flex: 1,),
              Expanded(child:buildItem3Desc(controller.item4_3, S.current.home_item_4_3),flex: 1,)
            ],
          ),
          // Gaps.vGap8,
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Expanded(child:buildItem3Desc(controller.item4_3, S.current.home_item_4_3),flex: 1,),
          //     Expanded(child:buildItem3Desc(controller.item4_4, S.current.home_item_4_4),flex: 1,)
          //   ],
          // ),
        ],
      ),
    );
  }
  buildItem3Desc(String title, String dec) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(dec, style: ITextStyles.itemContent12),
        Gaps.vGap2,
        Text(title, style: ITextStyles.itemTitle,),
      ],
    );
  }
  // 矿池销售
  buildItem5(BuildContext context){
    return Container(
      margin: EdgeInsets.all(20.w),
      padding: EdgeInsets.all(20.w),
      decoration: ITextStyles.boxDecoration,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child:buildItem5Desc(controller.item5_1, S.current.home_item_5_1,Color(0xffF23E2A)),flex: 1,),
              Expanded(child:buildItem3Desc(controller.item5_3, S.current.home_item_5_3),flex: 1,),
            ],
          ),
          Gaps.vGap8,
          Gaps.line,
          Gaps.vGap8,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child:buildItem3Desc(controller.item5_4, S.current.home_item_5_4),flex: 1,),
              Expanded(child:buildItem3Desc(controller.item5_5, S.current.home_item_5_5),flex: 1,)
            ],
          ),
        ],
      ),
    );
  }
  buildItem5Desc(String title, String dec,Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(dec, style: ITextStyles.itemContent12),
        Gaps.vGap2,
        Text(title, style: TextStyle(fontSize: 14,color: textColor),),
      ],
    );
  }
  buildItm(String image, String title) {
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            image,
            width: 70.w,
            height: 70.w,
            fit: BoxFit.cover,
          ),
          Gaps.vGap4,
          Text(
            title,
            style: ITextStyles.textSize12,
          )
        ],
      ),
      onTap: () {
        if (title == S.current.home_wallet) {
          NavigatorUtil.jump(context, Routes.walletPage);
        }
      },
    );
  }

}
