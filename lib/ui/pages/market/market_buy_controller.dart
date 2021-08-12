


import 'package:ipfsnets/models/market_buy_entity.dart';
import 'package:ipfsnets/models/market_coupon_entity.dart';
import 'package:ipfsnets/models/market_entity.dart';

import '../../../include.dart';

class MarketBuyController extends GetxController {

  late MarketEntity data;
  late MarketCouponEntity entity;
  late MarketBuyEntity buyEntity;


  bool selCny = true;

  num count = 1;
  bool agreeMent = false;

  bool enableBuy = false;
  String total = "0";

 void init(MarketEntity marketEntity) {
    LogUtil.e("init");
   data = marketEntity;
   count = 1;
   agreeMent = false;
   enableBuy = false;
   selCny = true;
   buyEntity = new MarketBuyEntity();
    entity = new MarketCouponEntity();
   buyEntity.usdtPrice = 0;
   buyEntity.cnyPrice = 0;
   buyEntity.usdtBalance = 0;
   buyEntity.cnyBalance = 0;
   setTotal();
 }

 // 选择支付币种
 void setSelCny(bool sel) {
   selCny = sel;
   entity = new MarketCouponEntity();
   setTotal();
   update();
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
   num price = 0;
    if (selCny) {
      price = buyEntity.cnyPrice;
      entity.type = "0";
    }else{
      price = buyEntity.usdtPrice;
      entity.type = "1";
    }

    num all = count * price;

    LogUtil.e("all = "+all.toString());
   if (entity.sel && entity.couponId > 0) {
     all = all - entity.faceValue;
   }

   entity.total = all;
   total = all.toString();

   if (selCny) {
     total = total + "CNY";
   }else{
     total = total + "USDT";
   }
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
    setTotal();
    update();
  }



  void setBuyInfo(MarketBuyEntity entity) {
    buyEntity = entity;
    LogUtil.e("setBuyInfo");
    setTotal();
    update();
  }




}
