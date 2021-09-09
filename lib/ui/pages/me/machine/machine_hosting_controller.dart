import 'package:ipfsnets/models/machine_hosting_entity.dart';
import 'package:ipfsnets/models/market_coupon_entity.dart';
import 'package:ipfsnets/utils/num_util.dart';

import '../../../../include.dart';


class MachineHostingController extends GetxController {


  late MachineHostingEntity data;
  late MarketCouponEntity entity;


  bool selCny = true;

  num count = 1;
  bool agreeMent = false;

  bool enableBuy = false;
  String total = "0";

  void init() {
    LogUtil.e("init");

    entity = new MarketCouponEntity();
    count = 1;
    agreeMent = false;
    enableBuy = false;
    selCny = true;

    data = MachineHostingEntity();
    data.usdtPrice = 0;
    data.cnyPrice = 0;
    data.usdtBalance = 0;
    data.cnyBalance = 0;
    data.hostingPeriod = [];
    data.nodeName = "";
    data.symbol = "";
    data.hostingDay = 0;
    data.expand = 0;
    data.hostingStatus = 0;
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
  void addCount(int index) {
    if (data.hostingPeriod != null && data.hostingPeriod.length > index) {
      count = data.hostingPeriod[index];
    }
    LogUtil.e(count.toString());

    setTotal();
    update();
  }



  setTotal() {
    num price = 0;
    if (selCny) {
      price = data.cnyPrice;
      entity.type = "0";
    }else{
      price = data.usdtPrice;
      entity.type = "1";
    }
    num all = count * price;

    LogUtil.e("all = "+all.toString());
    if (entity.sel && entity.couponId > 0) {
      all = all - entity.faceValue;
    }

    entity.total = all;
    total = NumUtil.prseeZero(all.toStringAsFixed(8));

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

      // 托管续期 时间到呢
      if (data.hostingStatus == 1 && data.hostingDay == 0) {
        enableBuy = true;
      }else if(data.hostingStatus == 0){
        enableBuy = true;
      }

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



  void setBuyInfo(MachineHostingEntity entity) {
    data = entity;

    if (data.hostingPeriod != null && data.hostingPeriod.length > 0) {
      count = data.hostingPeriod[0];
    }
    LogUtil.e("setBuyInfo");
    setTotal();
    update();
  }


}
