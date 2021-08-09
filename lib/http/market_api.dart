
import 'package:ipfsnets/models/market_bar_entity.dart';
import 'package:ipfsnets/models/market_buy_entity.dart';
import 'package:ipfsnets/models/market_coupon_entity.dart';
import 'package:ipfsnets/models/market_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'http_manager.dart';

class MarketApi{
  // 服务器tabBar
  static const String machine_home = "machine/app/type/mini/list";
  ///提交cny 提现首页
  static  Future<BaseEntity> getMachineHome() {
    return HttpManager.getInstance().get<List<MarketBarEntity>>(machine_home,withLoading: true);
  }
  static const String machine_list = "machine/app/fil/list/";
  static  Future<BaseEntity> getMachineById(num id, bool show) {
    return HttpManager.getInstance().get<List<MarketEntity>>(machine_list+id.toString(),withLoading: show);
  }

  // 服务器详情
  static const String machine_info = "machine/app/fil/";
  static  Future<BaseEntity> getMachineInfo(num id) {
    Map<String, dynamic> param = new Map();
    param['extId'] = id;
    return HttpManager.getInstance().get<MarketEntity>(machine_info+id.toString(),params: param);
  }


  // 服务器支付货币
  static const String machine_coin_info = "machine/app/record/";
  static  Future<BaseEntity> getMachineCoinInfo(num id) {
    return HttpManager.getInstance().get<MarketBuyEntity>(machine_coin_info+id.toString());
  }

  // 优惠券
  static const String machine_coupon= "machine/app/coupon/";
  static  Future<BaseEntity> getMachineCoupon(String type) {
    return HttpManager.getInstance().get<List<MarketCouponEntity>>(machine_coupon+type.toString());
  }


}