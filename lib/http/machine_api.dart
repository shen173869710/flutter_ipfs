

import 'dart:convert';

import 'package:ipfsnets/models/machine_entity.dart';
import 'package:ipfsnets/models/machine_hosting_entity.dart';
import 'package:ipfsnets/models/machine_pledge_entity.dart';
import 'package:ipfsnets/models/machine_top_entity.dart';
import 'package:ipfsnets/models/wallet_info_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';

import 'http_manager.dart';

class MachineApi{

  // 用户服务统计数据
  static const String machine_statistics = "machine/app/machine/statistics";
  static  Future<BaseEntity> getMachineStatistics() {
    return HttpManager.getInstance().get<MachineTopEntity>(machine_statistics,withLoading: false);
  }
  // 用户服务器列表
  static const String machine_list = "machine/app/machine/list";
  static  Future<BaseEntity> getMachineList() {
    return HttpManager.getInstance().get<List<MachineEntity>>(machine_list,withLoading: false);
  }

  // 用户服务器详情
  static const String machine_info = "machine/app/machine/";
  static  Future<BaseEntity> getMachineInfo(num machineId) {
    return HttpManager.getInstance().get<WalletInfoEntity>(machine_info+machineId.toString(),withLoading: true);
  }


  // 服务器托管续期详情
  static const String machine_hosting_info = "machine/app/hosting/";
  static  Future<BaseEntity> getMachineHosting(String id) {
    return HttpManager.getInstance().get<MachineHostingEntity>(machine_hosting_info+id);
  }

  // 服务器升级详情
  static const String machine_update_info = "machine/app/upgrade/";
  static  Future<BaseEntity> getMachineUpdate(String id) {
    return HttpManager.getInstance().get<MachineHostingEntity>(machine_update_info+id);
  }

  // 服务器质押详情
  static const String machine_pledge_info = "machine/app/pledge/";
  static  Future<BaseEntity> getMachinePledge(String id) {
    return HttpManager.getInstance().get<MachinePledgeEntity>(machine_pledge_info+id);
  }

  // 服务器升级 购买
  static const String machine_upgrade_pay = "machine/app/upgrade";
  static  Future<BaseEntity> machineUpgradePay(num count, num coupon, num machineId, String password, bool payType) {
    Map<String, dynamic> param = new Map();
    param['count'] = count;
    param['machineId'] = machineId;
    if (coupon != null && coupon >0) {
      param['coupon'] = coupon;
    }
    param['password'] = password;
    if (payType) {
      param['payType'] = "0";
    }else{
      param['payType'] = "1";
    }

    return HttpManager.getInstance().post(machine_upgrade_pay,jsonEncode(param));
  }
  // 服务器质押
  static const String machine_plage_pay = "machine/app/pledge";
  static  Future<BaseEntity> machinePledgePay(num machineId, String password) {
    Map<String, dynamic> param = new Map();
    param['machineId'] = machineId;
    param['password'] = password;
    return HttpManager.getInstance().post(machine_plage_pay,jsonEncode(param));
  }

  // 服务器托管
  static const String machine_hosting_pay = "machine/app/hosting";
  static  Future<BaseEntity> machineHostingPay(num count, num coupon, num machineId, String password, bool payType) {
    Map<String, dynamic> param = new Map();
    param['count'] = count;
    param['machineId'] = machineId;
    if (coupon != null && coupon >0) {
      param['coupon'] = coupon;
    }
    param['password'] = password;
    if (payType) {
      param['payType'] = "0";
    }else{
      param['payType'] = "1";
    }
    return HttpManager.getInstance().post(machine_hosting_pay,jsonEncode(param));
  }

}