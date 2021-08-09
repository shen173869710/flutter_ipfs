
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/res/colors.dart';
import '../../../include.dart';

class MarketEndPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.layout_bg,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colours.app_bar_bg,
          title: Text(S.current.market_end_title, style: ITextStyles.whiteTitle,)),
      body: Container(
        padding: EdgeInsets.only(top: 300.w),
        alignment: Alignment.center,
        child: Column(
          children: [

              Image.asset(R.assetsImgIcBuySucess, height: 320.w,width: 320.w,fit: BoxFit.fill,),
              Gaps.vGap10,
              Container(child: Text(S.current.market_end_signed,style: TextStyle(color: Colours.white,fontSize: 16),),
                alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular((20.w)),
                color: Colours.button_sel
              ),width: 290.w,height: 90.w,)

          ],
        ),
      ));
  }

}