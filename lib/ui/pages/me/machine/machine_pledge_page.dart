
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ipfsnets/dialog/password_dialog.dart';
import 'package:ipfsnets/http/market_api.dart';
import 'package:ipfsnets/models/machine_pledge_entity.dart';
import 'package:ipfsnets/models/market_buy_entity.dart';
import 'package:ipfsnets/models/market_coupon_entity.dart';
import 'package:ipfsnets/models/market_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/market/market_buy_controller.dart';
import 'package:ipfsnets/ui/pages/market/market_coupons_page.dart';

import '../../../../include.dart';


class MachinePledgePage extends StatefulWidget{
  String machineId;
  MachinePledgePage(this.machineId);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MachinePledgeState();
  }

}

class MachinePledgeState extends State<MachinePledgePage>{

  late MachinePledgeEntity data;
  @override
  void initState() {
    data = MachinePledgeEntity();
    data.init();
    getData();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colours.layout_bg,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colours.app_bar_bg,
          title: Text(
            S.current.machine_pledge_title,
            style: ITextStyles.whiteTitle,
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildTitle(),
            buildInfo(),
            Gaps.vGap16,
            buildAddItem(),
          ],
        ),
      ),
      bottomNavigationBar: buildBottom(context),
    );

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
              Text(S.current.machine_pledge_1, style: ITextStyles.itemTitle16,),
              Expanded(child: SizedBox()),
              Text(data.symbol, style: ITextStyles.itemTitleSel16,),

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
          Gaps.vGap4,
          buildItem(S.current.machine_pledge_2,data.realCap.toString()+" TB"),
          Gaps.vGap12,
          buildItem(S.current.machine_pledge_3,data.pledge.toString()+" FIL"),
          Gaps.vGap12,
          buildItem(S.current.machine_pledge_4,data.gas.toString()+" FIL"),
          Gaps.vGap12,
          buildItem(S.current.machine_pledge_5,data.amount.toString()+" FIL"),
          Gaps.vGap12,
          buildItem(S.current.machine_pledge_6,data.alreadyAmount.toString()+" FIL"),
          Gaps.vGap4,
        ],
      ),
    );
  }

  Row buildItem(String title, String desc) {
    return Row(
      children: [
        Text(title, style: ITextStyles.itemTitle),
        Expanded(child: SizedBox(),),
        Text(desc, style: ITextStyles.itemTitle),
      ],
    );
  }

   buildAddItem() {
    return Container(
      padding: EdgeInsets.only(top: 40.w,left: 20.w,right: 20.w,bottom: 40.w),
      color: Colours.white,
      child:Row(
        children: [
          Text(S.current.machine_pledge_7, style: TextStyle(fontSize:14,color: Colours.gray_black,)),
          Expanded(child: SizedBox(),),
          Text(data.needAmount.toString()+" FIL", style: ITextStyles.itemTitleRed),
        ],
      )
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
              TextSpan(text: data.needAmount.toString() + " FIL", style: TextStyle(fontSize: 16,color: Colours.item_red)),
            ])),
          ),
          flex: 3,
        ),
        Expanded(
          child: Container(
              alignment: Alignment.center,
              height: 120.w,
              color: Colours.button_sel,
              child: GestureDetector(child:Text(S.current.machine_pledge_8,style: TextStyle(fontSize: 16,color: Colours.white),),onTap: (){

              },)
          ),
          flex: 2,
        ),
      ],
    );
  }

  Future<void> getData() async {
    BaseEntity baseEntity = await MarketApi.getMachinePledge(widget.machineId);;
    if (baseEntity.isOk()) {
      if (baseEntity.data != null) {
          data = baseEntity.data;
          setState(() {

          });
      }
    }
  }


}