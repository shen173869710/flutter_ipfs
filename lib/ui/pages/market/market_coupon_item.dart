import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipfsnets/models/market_coupon_entity.dart';
import '../../../include.dart';
import '../../../r.dart';


class MarketCouponItem extends StatelessWidget {
  final MarketCouponEntity data;
  final void Function(bool sel,int postion) onItemSelListener;
  final int index;
  MarketCouponItem({required this.data, required this.index, required this.onItemSelListener});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 10.w),
      decoration: ITextStyles.boxDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          getType(data),
          Gaps.hGap10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.vGap8,
              Text(data.name, style: ITextStyles.itemTitle,),
              Gaps.vGap2,
              Text(getAbout(data), style: ITextStyles.itemContent12,),
              Text(getTime(data), style: ITextStyles.itemContent12,),
              Gaps.vGap2,
            ],
          ),
          Expanded(child: SizedBox()),
          getChild(data),
          Gaps.hGap8,
        ],
      ),
    );
  }

  // 使用条件
  String getAbout(MarketCouponEntity entity) {
    return S.current.market_coupons_about+" "+ entity.condition;
  }

  String getTime(MarketCouponEntity entity) {
    return S.current.market_coupons_time+" "+ DateUtil.getTime(entity.pastTime);
  }

  //0 未使用
  //1 已使用
  //2 已过期
  getChild(MarketCouponEntity data) {
    if (data.status == 0) {
      return Checkbox(activeColor: Colours.button_sel, value: data.sel,
          onChanged: (value) {
            onItemSelListener(value!,index);
            // state.repository.isAggress = value!;
            // BlocProvider.of<LoginBloc>(context).add(LoginAgressEvent(state.repository));
          },
          shape: CircleBorder());

    }else if (data.status == 1) {
      return Image.asset(R.assetsImgIcCouponUsed, width: 90.w,height: 90.w,fit: BoxFit.cover,);
    }else if (data.status == 2) {
      return Image.asset(R.assetsImgIcCouponDated, width: 90.w,height: 90.w,fit: BoxFit.cover,);
    }
  }

  getType(MarketCouponEntity data) {
    if (data.status == 0) {
      if ("0" == data.type){
        return Image.asset(R.assetsImgIcCouponCny, width: 135.w,height: 135.w,fit: BoxFit.fill,);
      }else{
        return Image.asset(R.assetsImgIcCouponUsdt, width: 135.w,height: 135.w,fit: BoxFit.fill,);
      }
    }else{
      if ("0" == data.type){
        return Image.asset(R.assetsImgIcCouponCnyN, width: 135.w,height: 135.w,fit: BoxFit.fill,);
      }else{
        return Image.asset(R.assetsImgIcCouponUsdtN, width: 135.w,height: 135.w,fit: BoxFit.fill,);
      }
    }
  }


}

