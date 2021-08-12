
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/dialog/password_dialog.dart';
import 'package:ipfsnets/http/market_api.dart';
import 'package:ipfsnets/models/market_buy_entity.dart';
import 'package:ipfsnets/models/market_coupon_entity.dart';
import 'package:ipfsnets/models/market_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/market/market_coupons_page.dart';

import '../../../include.dart';
import 'market_buy_controller.dart';

class MarketBuyPage extends StatelessWidget{
  late MarketEntity data;
  // 用户协议
  final _registProtocolRecognizer = new TapGestureRecognizer();


  final MarketBuyController controller = Get.put(MarketBuyController());

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as MarketEntity;
    controller.init(data);
    getData();

    return GetBuilder<MarketBuyController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colours.layout_bg,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colours.app_bar_bg,
            title: Text(
              S.current.market_buy_title,
              style: ITextStyles.whiteTitle,
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildTitle(),
              buildInfo(),
              buildCoupons(context),
              buildChooseMoney(context),
            ],
          ),
        ),
        bottomNavigationBar: buildBottom(context),
      );
    });
  }

  Container buildTitle() {
    return
      Container(
        color: Colours.app_bar_bg,
        child: Container(
          padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 20.w),
          decoration: BoxDecoration(
              color: Colours.layout_bg,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30.w), topRight: Radius.circular(30.w))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text.rich(TextSpan(children: [
                WidgetSpan(child: Image.asset(R.assetsImgIcFil, height: 35.w, width: 35.w,)),
                TextSpan(text: "  "),
                TextSpan(text: data.name, style: TextStyle(color: Colours.item_title_color, fontSize: 18)),
              ]),textAlign: TextAlign.left,),
              SizedBox(),
            ],),
        )

    );
  }

  Container buildInfo() {
    return Container(
      padding: ITextStyles.containerMargin,
      decoration: ITextStyles.boxDecoration,
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Gaps.vGap12,
          buildItem(S.current.market_item_1,data.price.toString(),ITextStyles.itemTitleRed),
          Gaps.vGap12,
          buildItem(S.current.market_item_2,data.nodeName,ITextStyles.itemTitle),
          Gaps.vGap12,
          buildItem(S.current.market_item_3,data.contractPeriod.toString()+S.current.day,ITextStyles.itemTitle),
          Gaps.vGap12,
          buildItem(S.current.market_item_4,data.initial.toString()+"TB",ITextStyles.itemTitle),
          Gaps.vGap12,
          buildAddItem(),
        ],
      ),
    );
  }

  Row buildItem(String title, String desc, TextStyle textStyle) {
    return Row(
      children: [
        Text(title, style: ITextStyles.itemContent,textAlign: TextAlign.start,),
        Expanded(child: SizedBox(),),
        Text(desc, style: textStyle,textAlign: TextAlign.end),
      ],
    );
  }

  Row buildAddItem() {
    return Row(
      children: [
        Text(S.current.market_buy_num, style: ITextStyles.itemContent,textAlign: TextAlign.start,),
        Expanded(child: SizedBox(),),
        Text.rich(TextSpan(children: [
          WidgetSpan(child:GestureDetector(child: Image.asset(R.assetsImgIcAdd, height: 30.w, width: 30.w,),onTap: (){addNumber(true);},)),
          TextSpan(text: "  "),
          TextSpan(text: controller.count.toString(), style:ITextStyles.itemTitle),
          TextSpan(text: "  "),
          WidgetSpan(child: GestureDetector(child: Image.asset(R.assetsImgIcSub, height: 30.w, width: 30.w,),onTap: (){addNumber(false);},)),
        ]),textAlign: TextAlign.left,),
      ],
    );
  }

  // 优惠券
  Container buildCoupons(BuildContext context) {
    return Container(margin: EdgeInsets.fromLTRB(0.w, 20.w, 0.w, 20.w),
        padding: ITextStyles.containerMargin,
        decoration: ITextStyles.boxDecoration,
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Text.rich(TextSpan(children: [
              WidgetSpan(child:GestureDetector(child: Image.asset(R.assetsImgIcCoupon, height: 35.w, width: 35.w,),onTap: (){},)),
              TextSpan(text: "  "),
              TextSpan(text: S.current.market_buy_coupons, style:ITextStyles.itemTitle),
            ])),
            Expanded(child: SizedBox()),
            GestureDetector(child:  Text.rich(TextSpan(children: [
              TextSpan(text: getCoupon(), style:ITextStyles.itemTitle),
              TextSpan(text: "  "),
              WidgetSpan(child: Image.asset(R.assetsImgIcArrowRight, height: 30.w, width: 30.w,)),
            ])),onTap: (){
              toCoupons(context);},),

          ],
        ));
  }

  String getCoupon() {
    if ( StringUtil.isNotEmpty(controller.entity.name) && controller.entity.sel) {
      return controller.entity.name;
    }
    return S.current.market_buy_coupons_hint;
  }


  // 选择钱包
  Container buildChooseMoney(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0.w, 0.w, 0.w, 0.w),
        decoration: ITextStyles.boxDecoration,
        alignment: Alignment.topLeft,
        child:Column(
          children: [
            buildChooseMoneyItem(R.assetsImgIconCny,"CNY", controller.buyEntity.cnyBalance.toString(), 0),
            buildChooseMoneyItemn(R.assetsImgIconUsdt,"USDT", controller.buyEntity.usdtBalance.toString(), 1),
            buildRegisterAndForget(context, controller),
          ],
        ));
  }


  Row buildChooseMoneyItem(String image, String title, String desc, int index) {
    return Row(
      children: [
        SizedBox(width: 20.w),
        Text.rich(TextSpan(children: [
          WidgetSpan(child:GestureDetector(child: Image.asset(image, height: 35.w, width: 35.w,),onTap: (){},)),
          TextSpan(text: "  "),
          TextSpan(text: title, style:ITextStyles.itemTitle),
        ])),
        Expanded(child: SizedBox()),
        Text(desc,style: ITextStyles.itemTitle,),
        Checkbox(
            activeColor: Colours.button_sel,
            value: controller.selCny,
            onChanged: (value) {
              controller.setSelCny(true);
            },
            shape: CircleBorder()),
      ],
    );
  }

  Row buildChooseMoneyItemn(String image, String title, String desc, int index) {
    return Row(
      children: [
        SizedBox(width: 20.w),
        Text.rich(TextSpan(children: [
          WidgetSpan(child:GestureDetector(child: Image.asset(image, height: 35.w, width: 35.w,),onTap: (){},)),
          TextSpan(text: "  "),
          TextSpan(text: title, style:ITextStyles.itemTitle),
        ])),
        Expanded(child: SizedBox()),
        Text(desc,style: ITextStyles.itemTitle,),
        Checkbox(
            activeColor: Colours.button_sel,
            value: !controller.selCny,
            onChanged: (value) {
              controller.setSelCny(false);
            },
            shape: CircleBorder()),
      ],
    );
  }

  Row buildBottom(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 50.w),
            height: 100.w,
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: Text.rich(TextSpan(children: [
              TextSpan(text: S.current.market_buy_total, style: ITextStyles.itemContent12),
              TextSpan(text: controller.total, style: TextStyle(fontSize: 16,color: Colours.item_red)),
            ])),
          ),
          flex: 3,
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 100.w,
            color: controller.enableBuy?Colours.button_sel:Colours.button_unsel,
            child: GestureDetector(child:Text(S.current.market_item_buy,style: TextStyle(fontSize: 16,color: Colours.white),),onTap: (){
              showDialog(context);
    },)
          ),
          flex: 2,
        ),
      ],
    );
  }

  Future<void> getData() async {
    BaseEntity baseEntity = await MarketApi.getMachineCoinInfo(data.machineId);;
    if (baseEntity.isOk()) {
      MarketBuyEntity buyEntity = baseEntity.data;
      if (buyEntity != null) {
         controller.setBuyInfo(buyEntity);
      }
    }
  }

  void showDialog(BuildContext context) {
    num all;
    if (controller.selCny) {
      all = controller.buyEntity.cnyPrice * controller.count;
      if (controller.entity.sel && controller.entity.couponId > 0) {
        all = all = controller.entity.faceValue;
      }

      if (all > controller.buyEntity.cnyBalance) {
        ToastUtil.show(S.current.not_enough);
        return;
      }
    }else{
      all = controller.buyEntity.usdtPrice * controller.count;
      if (controller.entity.sel && controller.entity.couponId > 0) {
        all = all = controller.entity.faceValue;
      }

      if (all > controller.buyEntity.usdtPrice) {
        ToastUtil.show(S.current.not_enough);
        return;
      }
    }


    showModalBottomSheet<void>(
    context: context,
    enableDrag: false,
    isScrollControlled: true,
    builder: (_) =>  PasswordDiaglog(onItemClickListener: (code) async {
      LogUtil.e("showDialog()"+code.toString());

      String type = "1";
      if (controller.selCny) {
        type = "0";
      }
      BaseEntity baseEntity = await MarketApi.machineBuy(data.machineId,controller.count,controller.entity.couponId, code,type);;
      if (baseEntity.isOk()) {
        NavigatorUtil.goBack(context);
        NavigatorUtil.jump(context, Routes.marketEndPage);
      }else{
        ToastUtil.show(baseEntity.msg);
      }

    },));
  }

  // 用户协议
  Row buildRegisterAndForget(BuildContext context, MarketBuyController controller) {
    return Row(
      children:[
        Checkbox(
            activeColor: Colours.button_sel,
            value: controller.agreeMent,
            onChanged: (value) {
              controller.setAgreeMent();
            },
            shape: CircleBorder()),
        Text.rich(TextSpan(children: [
          TextSpan(text: S.current.register_desc,style: TextStyle(fontSize: 12)),
          TextSpan(
              text: S.current.market_buy_desc_more,
              style: TextStyle(
                  color: Colours.button_sel,
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid),
              recognizer:_registProtocolRecognizer..onTap=(){
                LogUtil.e("打开网页");
                NavigatorUtil.goWebViewPage(context, S.current.market_buy_desc_more, GlobalEntiy.web_market_buy);
              }
          ),
        ]))
      ],
    );
  }

  void toBuy(BuildContext context) {
    // NavigatorUtil.push(context,Routes.marketInfoPage,arguments: data);
    NavigatorUtil.pushResult(context, Routes.marketInfoPage, (Object code) {
      print("code = " +code.toString());

    });
  }

  // 添加数量
  void addNumber(bool add) {
    if (add) {
      controller.addCount();
    }else{
      controller.subCount();
    }
  }
  // 选择优惠券
  Future<void> toCoupons(BuildContext context) async {
    var data = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
              return MarketCouponsPage(controller.entity);
            }
        ),
    );
    if (data != null) {
      MarketCouponEntity entity = data;
      if (entity != null) {
        controller.setCoupon(entity);
      }
    }

  }
}