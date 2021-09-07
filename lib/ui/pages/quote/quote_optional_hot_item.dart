import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipfsnets/models/quote_optional_entity.dart';
import 'package:ipfsnets/res/styles.dart';
import 'package:ipfsnets/utils/num_util.dart';

import '../../../include.dart';

class QuoteOptionalHotItem extends StatelessWidget {
  final QuoteOptionalEntity data;
  final int index;
  QuoteOptionalHotItem(this.data,this.index);
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
          Gaps.hGap12,
          // Image.asset(
          //   R.assetsImgIcUnlike,
          //   width: 25.w,
          //   height: 25.w,
          // ),
          // Gaps.hGap2,
          Container(child:Text((index+1).toString(),style: TextStyle(fontSize: 10, color: Colours.item_content_color)),height: 30.w,width: 40.w,color: Colours.bg_color,alignment: Alignment.center,),
          Gaps.hGap8,
          Container(
            child: ImageUtil.loadImage(data.logo, 30.w, 30.w),
            height: 30.w,
            width: 30.w,
            alignment: Alignment.center,
          ),
          Gaps.hGap8,
          Text(data.name.toUpperCase(), style: ITextStyles.itemTitle),
        ],
      ),
      flex: 1,
    );
  }

  buildItem2() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RatingBarIndicator(
            rating: data.star == null?0:data.star.toDouble(),
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.red,
            ),
            itemCount: 5,
            itemSize: 35.w,
            direction: Axis.horizontal,
          ),
        ],
      ),
      flex: 1,
    );
  }

  buildItem3() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(StringUtil.addCoin(NumUtil.prseeZero(data.priceCny.toStringAsFixed(2))),style: TextStyle(color: Colours.item_title_color,fontSize: 12)),
          Text(NumUtil.prseeZero(data.changeRate.toString())+"%",style: TextStyle(color: getItem3Bg(data),fontSize: 12)),
        ],
      ),
      flex: 1,
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

