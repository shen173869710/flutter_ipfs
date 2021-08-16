import 'package:ipfsnets/models/machine_hosting_entity.dart';
import 'package:ipfsnets/models/market_coupon_entity.dart';
import '../../../../include.dart';


class MachineUpdateController extends GetxController {

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
      price = data.cnyPrice;
      entity.type = "0";
    }else{
      price = data.usdtPrice;
      entity.type = "1";
    }
    num all = count * price;

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



  void setBuyInfo(MachineHostingEntity entity) {
    data = entity;
    count = 1;
    if (data.hostingPeriod != null && data.hostingPeriod.length > 0) {
      count = data.hostingPeriod[0];
    }
    LogUtil.e("setBuyInfo");
    setTotal();
    update();
  }


}
