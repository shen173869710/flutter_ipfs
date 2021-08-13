

import 'dart:convert';

import 'package:ipfsnets/models/machine_entity.dart';
import 'package:ipfsnets/models/machine_top_entity.dart';
import 'package:ipfsnets/models/transfer_record_entity.dart';
import 'package:ipfsnets/models/wallet_account_entity.dart';
import 'package:ipfsnets/models/wallet_address_entity.dart';
import 'package:ipfsnets/models/wallet_home_entity.dart';
import 'package:ipfsnets/models/wallet_info_entity.dart';
import 'package:ipfsnets/models/wallet_info_list_entity.dart';
import 'package:ipfsnets/models/wallet_rechage_entity.dart';
import 'package:ipfsnets/models/wallet_withdrawal_entity.dart';
import 'package:ipfsnets/models/wallet_withdrawal_record_entity.dart';
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



}