
import 'dart:convert';

import 'package:ipfsnets/models/fans_entity.dart';
import 'package:ipfsnets/models/home_entity.dart';
import 'package:ipfsnets/models/machine_hosting_entity.dart';
import 'package:ipfsnets/models/machine_pledge_entity.dart';
import 'package:ipfsnets/models/market_bar_entity.dart';
import 'package:ipfsnets/models/market_buy_entity.dart';
import 'package:ipfsnets/models/market_coupon_entity.dart';
import 'package:ipfsnets/models/market_entity.dart';
import 'package:ipfsnets/models/share_cion_entity.dart';
import 'package:ipfsnets/models/share_day_entity.dart';
import 'package:ipfsnets/models/share_month_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'http_manager.dart';

class MarketApi{
  ///我的服务器
  static const String machine_home = "machine/app/type/mini/list";

  static  Future<BaseEntity> getMachineHome() {
    return HttpManager.getInstance().get<List<MarketBarEntity>>(machine_home,withLoading: false);
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


  // 获取服务器详细信息
  static const String machine_coin_info = "machine/app/record/";
  static  Future<BaseEntity> getMachineCoinInfo(num id) {
    return HttpManager.getInstance().get<MarketBuyEntity>(machine_coin_info+id.toString());
  }

  // 优惠券
  static const String machine_coupon= "machine/app/coupon/";
  static  Future<BaseEntity> getMachineCoupon(String type) {
    return HttpManager.getInstance().get<List<MarketCouponEntity>>(machine_coupon+type.toString());
  }

  // 购买服务器
  static const String machine_buy= "machine/app/record/";
  /**
   *  payType "0" cny
   *          "1" usdt
   */
  static  Future<BaseEntity> machineBuy(num machineId, num count, num couponId,String password,String payType) {
    Map<String, dynamic> param = new Map();
    param['count'] = count;
    param['machineId'] = machineId;
    if (couponId != null && couponId > 0) {
      param['coupon'] = couponId;
    }
    param['password'] = password;
    param['payType'] = payType;
    return HttpManager.getInstance().post<MarketBuyEntity>(machine_buy,jsonEncode(param));
  }
  // 我的业绩
  static const String fans_info = "grade/app/user/kpi";
  static  Future<BaseEntity> getFansInfo() {
    return HttpManager.getInstance().get<FansEntity>(fans_info);
  }
  // 我的我的粉丝
  static const String fans_list = "grade/app/user/fans";
  static  Future<BaseEntity> getFansList() {
    return HttpManager.getInstance().get<List<FansEntity>>(fans_list);
  }

  // 区块总收益
  static const String share_coin_total = "share/app/sharecoin/area/total-earnings/";
  static  Future<BaseEntity> shareCoinTotal() {
    return HttpManager.getInstance().get<ShareCionEntity>(share_coin_total);
  }

  // 区块收益
  static const String share_coin_month = "share/app/sharecoin/area/earnings/";
  static  Future<BaseEntity> shareCoinTime(String time) {
    Map<String, dynamic> param = new Map();
    param['time'] = time;
    return HttpManager.getInstance().post<ShareMonthEntity>(share_coin_month,jsonEncode(param));
  }
  // 区块收益每天
  static const String share_coin_day = "share/app/sharecoin/serv-earnings/";
  static  Future<BaseEntity> shareCoinDay(String time) {
    Map<String, dynamic> param = new Map();
    param['time'] = time;
    return HttpManager.getInstance().post<ShareDayEntity>(share_coin_day,jsonEncode(param));
  }


  // 区块首页
  static const String home_info = "machine/app/index";
  static  Future<BaseEntity> homeInfo() {
    return HttpManager.getInstance().get<HomeEntity>(home_info,withLoading: false);
  }
}