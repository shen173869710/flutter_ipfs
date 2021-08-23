
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ipfsnets/dialog/choose_day_dialog.dart';
import 'package:ipfsnets/dialog/password_dialog.dart';
import 'package:ipfsnets/http/machine_api.dart';
import 'package:ipfsnets/models/machine_hosting_entity.dart';
import 'package:ipfsnets/models/market_coupon_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/market/market_coupons_page.dart';

import '../../../../include.dart';
import 'machine_hosting_controller.dart';


class MachineHostingPage extends StatelessWidget{
  String machineId;
  MachineHostingPage(this.machineId);
  // 用户协议
  final _registProtocolRecognizer = new TapGestureRecognizer();
  final MachineHostingController controller = Get.put(MachineHostingController());
  @override
  Widget build(BuildContext context) {
    controller.init();
    getData();

    return GetBuilder<MachineHostingController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colours.layout_bg,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colours.app_bar_bg,
            title: Text(controller.data.hostingStatus == 1?S.current.machine_hosting_title_s:S.current.machine_hosting_title,
              style: ITextStyles.whiteTitle,
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildTitle(),
              buildInfo(context),
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
    return Container(
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
              Text(S.current.machine_hosting_number, style: ITextStyles.itemTitle16,),
              Expanded(child: SizedBox()),
              Text(controller.data.symbol, style: ITextStyles.itemTitleSel16,),

            ],),
        )
    );
  }

  Container buildInfo(BuildContext context) {
    return Container(
      padding: ITextStyles.containerMargin,
      decoration: ITextStyles.boxDecoration,
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Gaps.vGap4,
          buildAddItem(context),
          Gaps.vGap12,
          buildItem(S.current.market_item_1,controller.data.cnyPrice.toString()+" CNY",ITextStyles.itemTitleRed),
          Gaps.vGap12,
          buildItem(S.current.market_item_2,controller.data.nodeName,ITextStyles.itemTitle),
          Gaps.vGap4,
        ],
      ),
    );
  }

  Row buildItem(String title, String desc, TextStyle textStyle) {
    return Row(
      children: [
        Text(title, style: ITextStyles.itemTitle),
        Expanded(child: SizedBox(),),
        Text(desc, style: textStyle,textAlign: TextAlign.end),
      ],
    );
  }

  Row buildAddItem(BuildContext context) {
    return Row(
      children: [
        Text(S.current.machine_hosting_time, style: ITextStyles.itemTitle),
        Expanded(child: SizedBox(),),
        Text.rich(TextSpan(children: [
          TextSpan(text: controller.count.toString()+" "+S.current.day, style:ITextStyles.itemTitle),
          TextSpan(text: " "),
          WidgetSpan(child: GestureDetector(child: Image.asset(R.assetsImgIcArrow, height: 30.w, width: 30.w,),onTap: (){showChooseDay(context);},)),
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
              WidgetSpan(child:GestureDetector(child: Image.asset(R.assetsImgIcCoupon, height: 40.w, width: 40.w,),onTap: (){},)),
              TextSpan(text: "  "),
              TextSpan(text: S.current.market_buy_coupons, style:ITextStyles.itemTitle),
            ])),
            Expanded(child: SizedBox()),
            GestureDetector(child:  Text.rich(TextSpan(children: [
              TextSpan(text: getCoupon(), style:ITextStyles.itemTitle),
              TextSpan(text: "  "),
              WidgetSpan(child: Image.asset(R.assetsImgIcArrowRight, height: 40.w, width: 40.w,)),
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
            buildChooseMoneyItem(R.assetsImgIconCny,"CNY", controller.data.cnyBalance.toString(), 0),
            buildChooseMoneyItemn(R.assetsImgIconUsdt,"USDT", controller.data.usdtBalance.toString(), 1),
            buildRegisterAndForget(context, controller),
          ],
        ));
  }


  Row buildChooseMoneyItem(String image, String title, String desc, int index) {
    return Row(
      children: [
        SizedBox(width: 20.w),
        Text.rich(TextSpan(children: [
          WidgetSpan(child:GestureDetector(child: Image.asset(image, height: 40.w, width: 40.w,),onTap: (){},)),
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
          WidgetSpan(child:GestureDetector(child: Image.asset(image, height: 40.w, width: 40.w,),onTap: (){},)),
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
            height: 120.w,
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
            height: 120.w,
            color: controller.enableBuy?Colours.button_sel:Colours.button_unsel,
            child: GestureDetector(child:Text(getBuyText(),style: TextStyle(fontSize: 16,color: Colours.white),),onTap: (){
              if(controller.enableBuy) {
                showDialog(context);
              }

    },)
          ),
          flex: 2,
        ),
      ],
    );
  }

  String getBuyText() {
    String str = "";
    if (controller.data.hostingDay == 0) {
      if (controller.data.hostingStatus == 1) {
        str = S.current.machine_hosting_submit_s;
      }else{
        str = S.current.machine_hosting_submit;
      }
    }else{
      if (controller.data.hostingStatus == 0) {
        str = controller.data.hostingDay.toString()+S.current.machine_hosting_unsubmit_s;
      }else{
        str = controller.data.hostingDay.toString()+S.current.machine_hosting_unsubmit;
      }
    }
    return str;
  }


  Future<void> getData() async {
    BaseEntity baseEntity = await MachineApi.getMachineHosting(machineId);;
    if (baseEntity.isOk()) {
      MachineHostingEntity buyEntity = baseEntity.data;
      if (buyEntity != null) {
         controller.setBuyInfo(buyEntity);
      }
    }
  }

  void showDialog(BuildContext context) {

    num all;
    if (controller.selCny) {
      all = controller.data.cnyPrice * controller.count;
      if (controller.entity.sel && controller.entity.couponId > 0) {
        all = all - controller.entity.faceValue;
      }
      LogUtil.e("all--- = "+all.toString() + "controller.buyEntity.cnyBalance = "+controller.data.cnyBalance.toString());
      if (all > controller.data.cnyBalance) {
        ToastUtil.show(S.current.not_enough);
        return;
      }
    }else{
      all = controller.data.usdtPrice * controller.count;
      if (controller.entity.sel && controller.entity.couponId > 0) {
        all = all - controller.entity.faceValue;
      }

      if (all > controller.data.usdtBalance) {
        ToastUtil.show(S.current.not_enough);
        return;
      }
    }

    showModalBottomSheet<void>(
    context: context,
    enableDrag: false,
    isScrollControlled: true,
    builder: (_) =>  PasswordDiaglog(onItemClickListener: (code){
      LogUtil.e("showDialog()");
      machinehostingPay(code);
    },));
  }

  // 用户协议
  Row buildRegisterAndForget(BuildContext context, MachineHostingController controller) {
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
              text: S.current.market_hostings_desc_more,
              style: TextStyle(
                  color: Colours.button_sel,
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid),
              recognizer:_registProtocolRecognizer..onTap=(){
                LogUtil.e("打开网页");
                NavigatorUtil.goWebViewPage(context, S.current.market_hostings_desc_more, GlobalEntiy.web_machine_hosting);
              }
          ),
        ]))
      ],
    );
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

  void showChooseDay(BuildContext context) {
    showModalBottomSheet(context: context,backgroundColor:Colours.transparent,builder:(BuildContext context) =>ChooseDayDialog(list:controller.data.hostingPeriod,onItemClickListener: (index) {
        controller.addCount(index);
    },));
  }

  Future<void> machinehostingPay(String pwd) async {
    BaseEntity baseEntity = await MachineApi.machineHostingPay(controller.count, controller.entity.couponId,controller.data.machineId,pwd,controller.selCny);
    if (baseEntity.isOk()) {
      ToastUtil.show(S.current.option_success);
    }else{
      ToastUtil.show(baseEntity.msg);
    }
  }
}