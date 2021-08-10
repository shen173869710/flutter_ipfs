import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipfsnets/models/quote_optional_entity.dart';
import 'package:ipfsnets/res/styles.dart';

import '../../../include.dart';

class QuoteOptionalRankItem extends StatelessWidget {
  final QuoteOptionalEntity data;
  final int index;
  QuoteOptionalRankItem(this.data,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 30.w),
      decoration: ITextStyles.boxDecoration,
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Gaps.vGap8,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
            buildItem1(),
            buildItem2(),
            buildItem3()
          ],),
          Gaps.vGap8,
          Gaps.line,
        ],
      ),
    );
  }

  buildItem1() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Gaps.hGap16,
          Image.asset(
            R.assetsImgIcUnlike,
            width: 25.w,
            height: 25.w,
          ),
          Gaps.hGap8,
          Container(child:Text((index+1).toString(),style: TextStyle(fontSize: 10, color: Colours.item_content_color)),height: 25.w,width: 35.w,color: Colours.bg_color,alignment: Alignment.center,),
          Gaps.hGap8,
          Container(
            child: ImageUtil.loadImage(data.logo, 25.w, 25.w),
            height: 25.w,
            width: 35.w,
            alignment: Alignment.center,
          ),
          Gaps.hGap5,
          Text(data.name, style: ITextStyles.itemTitle),
        ],
      ),
      flex: 5,
    );
  }

  buildItem2() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(StringUtil.addCoin(data.priceCny.toString()),style: ITextStyles.itemTitle,),
        ],
      ),
      flex: 4,
    );
  }

  buildItem3() {
    return Expanded(
      child: Container(
          padding: EdgeInsets.only(right: 15.w),
        alignment: Alignment.centerRight,
         child: Container(
           width: 120.w,
           height: 50.w,
           alignment: Alignment.center,
           decoration: BoxDecoration(
             color: getItem3Bg(data),
               borderRadius:BorderRadius.circular(10.w)
           ),

           child: Text(data.changeRate.toString()+"%",style: TextStyle(color: Colours.white,fontSize: 14),),
         )
      ),
      flex: 3,
    );
  }


  // 涨跌
  getItem3Bg(QuoteOptionalEntity entity) {
    if (entity.changeRate > 0) {
      return Color(0xff1F7A2E);
    }else {
      return Color(0xffD8323E);
    }
  }


}
