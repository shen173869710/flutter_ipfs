import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipfsnets/models/market_coupon_entity.dart';
import 'package:ipfsnets/models/market_entity.dart';

import '../../../include.dart';
import '../../../r.dart';
class MarketCouponItem extends StatelessWidget {
  final MarketCouponEntity data;
  MarketCouponItem(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 10.w),
      decoration: ITextStyles.boxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(R.assetsImgIconCnyUsed, width: 80.w,height: 80.w,fit: BoxFit.cover,),
          Row(
            children: [
              Text(data.faceValue, style: ITextStyles.itemTitle16,),
              Gaps.vGap4,
              Text(getAbout(data), style: ITextStyles.itemContent,),
              Text(getTime(data), style: ITextStyles.itemContent,),
            ],
          ),
          Expanded(child: SizedBox()),
          Image.asset(R.assetsImgIconCnyUsed, width: 80.w,height: 80.w,fit: BoxFit.cover,),
        ],
      ),
    );
  }

  // 使用条件
  String getAbout(MarketCouponEntity entity) {
    return S.current.market_coupons_about+" "+ entity.faceValue;
  }

  String getTime(MarketCouponEntity entity) {
    return S.current.market_coupons_time+" "+ DateUtil.getTime(entity.pastTime);
  }

}

