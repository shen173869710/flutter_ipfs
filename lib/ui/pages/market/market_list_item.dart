import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipfsnets/models/market_entity.dart';
import 'package:ipfsnets/utils/num_util.dart';

import '../../../include.dart';
import '../../../r.dart';
class MarketListItem extends StatelessWidget {
  final MarketEntity data;
  MarketListItem(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 10.w),
      padding: ITextStyles.containerMargin,
      decoration: ITextStyles.boxDecoration,
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          bulidTop(context),
          Gaps.line,
          Gaps.vGap8,
          buildItem(S.current.market_item_1,NumUtil.prseeZero(data.price.toString())+" CNY",ITextStyles.itemTitleRed),
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


  Row bulidTop(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Text.rich(TextSpan(children: [
                WidgetSpan(child: Image.asset(R.assetsImgIcFil, height: 35.w, width: 35.w,)),
                TextSpan(text: "  "),
                TextSpan(text: data.name, style: TextStyle(color: Colours.item_title_color, fontSize: 18)),
              ]),textAlign: TextAlign.left,),
                SizedBox(),
            ],),
            Gaps.vGap8,
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

        Expanded(child: SizedBox(),),
        Visibility(child:  Image.asset(R.assetsImgIcSold,width: 120.w,height: 120.w,),visible:data.shopStatus == "0"?false:true,),
        Visibility(child: Container(
          margin: EdgeInsets.fromLTRB(0, 30.w, 0, 30.w),
          alignment: Alignment.center,
          width: 140.w,
          height: 60.w,child:GestureDetector(child:  Text(S.current.market_item_buy,style: TextStyle(color: Colors.white,fontSize: 12),),onTap: (){toBuy(context);},),
         decoration: BoxDecoration(
           color: Colours.button_sel,
            borderRadius: new BorderRadius.circular((30.w))
        ),),visible:data.shopStatus == "0"?true:false)
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
    num count =  entity.selled/entity.stock*100;
    return count.truncate().toString()+"%";
  }

  double getPorgressInt(MarketEntity entity) {
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
    NavigatorUtil.push(context, '${Routes.marketInfoPage}?id=${Uri.encodeComponent(data.machineId.toString())}');
  }
}

