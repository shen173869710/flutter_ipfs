
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/http/market_api.dart';
import 'package:ipfsnets/models/market_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/widget/login_button.dart';

import '../../../include.dart';

class MarketInfoPage extends StatefulWidget{
  String id;
  MarketInfoPage(this.id);

  @override
  State<StatefulWidget> createState() {
    return _MarketInfoStatus();
  }
}

class _MarketInfoStatus extends State<MarketInfoPage> {
  late MarketEntity data = new MarketEntity();

  @override
  void initState() {
    // TODO: implement initState
    data.contractPeriod = 0;
    data.details = "";
    data.initial =0;
    data.machineId = 0;
    data.name = "";
    data.nodeName = "";
    data.price = 0;
    data.recommend = "";
    data.selled = 0;
    data.shopStatus="";
    data.stock = 0;
    data.tag=[];

    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.layout_bg,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colours.app_bar_bg,
            title: Text(
              S.current.market_info_title,
              style: ITextStyles.whiteTitle,
            )),
        body:SingleChildScrollView(
          child:Column(
            children: [
              buildTitle(),
              buildInfo(),
              buildDesc(),
              buildNotice(),
              buildLogin(context),
            ],
          ),
        )

    );
  }


  Container buildInfo() {
    return Container(
      margin: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 10.w),
      padding: ITextStyles.containerMargin,
      decoration: ITextStyles.boxDecoration,
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          bulidTop(context),
          Gaps.vGap8,
          Gaps.line,
          Gaps.vGap8,
          buildItem(S.current.market_item_1,data.price.toString(),ITextStyles.itemTitleRed),
          Gaps.vGap8,
          buildItem(S.current.market_item_2,data.nodeName,ITextStyles.itemTitle),
          Gaps.vGap8,
          buildItem(S.current.market_item_3,data.contractPeriod.toString()+S.current.day,ITextStyles.itemTitle),
          Gaps.vGap8,
          buildItem(S.current.market_item_4,data.initial.toString()+"TB",ITextStyles.itemTitle),
          Gaps.vGap8,
          buildProgress(data),
          Gaps.vGap8,
          Text(getPorgressTxet(data),style: ITextStyles.itemContent,),
        ],
      ),
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

  Row bulidTop(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Visibility(child: buildTag1(),visible: data.recommend=="0"?true:false,),
                Visibility(child: Gaps.hGap8,visible: data.recommend=="0"?true:false,),
                Visibility(child: buildTag2(getTagStr(data,0)),visible: showTag(data, 0)),
                Visibility(child: Gaps.hGap8,visible: showTag(data, 0)),
                Visibility(child: buildTag2(getTagStr(data,1)),visible: showTag(data, 1)),
                Visibility(child: Gaps.hGap8,visible: showTag(data, 1)),
                Visibility(child: buildTag2(getTagStr(data,2)),visible: showTag(data, 2)),
              ],
            )
          ],
        ),

      ],
    );
  }

  Container buildTag1(){
    return Container(
      padding: EdgeInsets.all(2),
      color: Colours.lable_red,
      child: Row(
        children: [
          Image.asset(R.assetsImgMarketRecomed, width: 20.w,height: 20.w,),
          Text(S.current.market_item_recommend,style: TextStyle(fontSize: 10,color: Colours.lable_red_txt),)
        ],
      ),
    );
  }

  Container buildTag2(String str){
    return Container(
      padding: EdgeInsets.all(3),
      color: Colours.lable_yellow,
      child: Row(
        children: [
          Text(str,style: TextStyle(fontSize: 10,color: Colours.lable_yellow_txt))
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

  Row buildProgress(MarketEntity entity) {
    return Row(
      children: [
        Expanded(child: SizedBox(height: 30.w,child:LinearProgressIndicator(
          value: getPorgressInt(entity),
          minHeight: 20,
          backgroundColor: Colours.bg_gray,
          valueColor: AlwaysStoppedAnimation<Color>(Colours.end),
        )),),
        Gaps.hGap8,
        Text(getPorgress(entity), style: ITextStyles.itemTitle,textAlign: TextAlign.end),
      ],
    );
  }


  String getPorgress(MarketEntity entity) {
    if (entity.stock == 0) {
      return "";
    }
    num count =  entity.selled/entity.stock*100;
    return count.truncate().toString()+"%";
  }

  double getPorgressInt(MarketEntity entity) {
    if (entity.stock == 0) {
      return 0;
    }
    double count =  entity.selled/entity.stock;
    return count;
  }


  String getPorgressTxet(MarketEntity entity) {
    return S.current.market_item_5+entity.selled.toString()+S.current.market_item_6+"/"+entity.stock.toString()+S.current.market_item_6;
  }


  bool showTag(MarketEntity entity, int indx) {
    if (entity.tag != null && entity.tag.length > indx) {
      return true;
    }else{
      return false;
    }
  }


  String getTagStr(MarketEntity entity, int indx) {
    if (entity.tag != null && entity.tag.length > indx) {
      return entity.tag[indx];
    }else{
      return "";
    }
  }

  void toBuy(BuildContext context) {
    NavigatorUtil.push(context,Routes.marketInfoPage,arguments: data);
  }

  Container buildDesc() {
    return Container(margin: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 10.w),
    padding: ITextStyles.containerMargin,
    decoration: ITextStyles.boxDecoration,
    alignment: Alignment.topLeft,
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Text(S.current.market_info_know,style: ITextStyles.itemTitle,)),
        Text(data.details, style: ITextStyles.itemContent,),
      ],
    ));
  }

  Container buildNotice() {
    return Container(margin: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 10.w),
        padding: ITextStyles.containerMargin,
        alignment: Alignment.topLeft,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(children: [
              WidgetSpan(child: Image.asset(R.assetsImgIcWorring, height: 32.w, width: 32.w,)),
              TextSpan(text: "  "),
              TextSpan(text: S.current.market_info_warring, style: ITextStyles.itemTitle),
            ]),textAlign: TextAlign.left,),
            SizedBox(),
            Gaps.vGap4,
            Text(S.current.market_info_notice, style: ITextStyles.itemContent,),
          ],
        ));
  }

  Padding buildLogin(BuildContext context) {
    return  Padding(padding: EdgeInsets.fromLTRB(50.w, 30.h, 50.w, 0),
      child: LoginButton(text: S.current.market_item_buy,
          endble :true,
          onPressed: () {
            NavigatorUtil.push(context,Routes.marketBuyPage,arguments: data);
          }),
    );
  }

  Future<void> getData() async {
    BaseEntity baseEntity = await MarketApi.getMachineInfo(num.parse(widget.id));
    if (baseEntity.isOk()) {
      MarketEntity barEntity = baseEntity.data;
      if (barEntity != null) {
        data = barEntity;
        setState(() {

        });
      }
    }
  }

}