


import 'package:ipfsnets/models/market_coupon_entity.dart';
import 'package:ipfsnets/models/market_entity.dart';

import '../../../include.dart';

class MarketBuyController extends GetxController {

  late MarketEntity data;
  late MarketCouponEntity entity = new MarketCouponEntity();

  num count = 1;
  bool agreeMent = false;

  bool enableBuy = false;
  String total = "0";


 void init(MarketEntity marketEntity) {
   data = marketEntity;
   count = 1;
   agreeMent = false;
   enableBuy = false;
   num all = count * data.price;

   total = all.toString();
 }


  // 点击增加服务器
  void addCount() {
    count++;
    LogUtil.e(count.toString());
    if (count >= data.stock - data.selled) {
      count = data.stock - data.selled;
    }
    setTotal();
    update();
  }

  void subCount() {
    count--;
    LogUtil.e(count.toString());
    if (count <= 1) {
      count = 1;
    }
    setTotal();
    update();
  }

  setTotal() {
    num all = count * data.price;
    total = all.toString();
  }

  // 是否选择用户协议
  void setAgreeMent () {
    agreeMent = !agreeMent;
    LogUtil.e("setAgreeMent"+agreeMent.toString());
    enableRegister ();
    update();
  }

  // 是否可以点击登录
  void enableRegister () {
    LogUtil.e("enableRegister()");
    if (agreeMent) {
      enableBuy = true;
    }else {
      enableBuy = false;
    }


  }

  // 设置优惠券
  void setCoupon(MarketCouponEntity couponEntity) {
    entity = couponEntity;
    if (entity.sel) {
      total = (count * data.price - 200).toString();
    }else{
      total = (count * data.price).toString();
    }

    update();
  }

}
