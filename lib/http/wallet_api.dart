

import 'dart:convert';

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

class WalletApi{


  // wallet home
  static const String wallet_home = "wallets/app/wallet/user/home";
  // wallet 获取链地址列表
  static const String wallet_in_address = "wallets/app/wallet/user/in_address";
  // wallet 选择币种
  static const String wallet_money_tyoe = "wallets/app/wallet/user/list";

  ///提交cny 提现首页
  static  Future<BaseEntity> getWalletHome() {
    return HttpManager.getInstance().get<WalletHomeEntity>(wallet_home,withLoading: true);
  }


  // wallet 提币记录
  static const String wallet_withdrawal_record = "wallets/app/wallet/transaction/out_page";
  static  Future<BaseEntity> getWithdrawalRecordList(int pageNum) {
    Map<String, dynamic> param = new Map();
    param['pageNum'] = pageNum;
    param['pageSize'] = 10;
    return HttpManager.getInstance().get<List<WalletWithdrawalRecordEntity>>(wallet_withdrawal_record,params: param,withLoading: true);
  }
  // wallet 冲币记录
  static const String wallet_rechage_record = "wallets/app/wallet/transaction/in_page";
  static  Future<BaseEntity> getRechageRecordList(int pageNum) {
    Map<String, dynamic> param = new Map();
    param['pageNum'] = pageNum;
    param['pageSize'] = 10;
    return HttpManager.getInstance().get<List<WalletWithdrawalRecordEntity>>(wallet_rechage_record,params: param,withLoading: true);
  }
  // wallet 冲币
  static const String wallet_rechage_home= "wallets/app/wallet/coin/in/";
  static  Future<BaseEntity> getWalletRechageHome(String type,bool show) {
    return HttpManager.getInstance().get<List<WalletRechageEntity>>(wallet_rechage_home+type,withLoading: show);
  }

  // wallet 提币
  static const String wallet_withdrawal_home= "wallets/app/wallet/coin/out/";
  static  Future<BaseEntity> getWalletWithdrawalHome(String type,bool show) {
    return HttpManager.getInstance().get<List<WalletWithdrawalEntity>>(wallet_withdrawal_home+type,withLoading: show);
  }
  // wallet 币种列表
  static const String wallet_account_list = "wallets/app/wallet/coin/list";
  static  Future<BaseEntity> getWalletWithdrawalList(int inType) {
    Map<String, dynamic> param = new Map();
    param['inType'] = inType;
    return HttpManager.getInstance().get<List<WalletAccountEntity>>(wallet_account_list,params: param,withLoading: false);
  }

  // wallet 通讯录列表
  static const String wallet_account_address = "wallets/app/wallet/contact/page";
  static  Future<BaseEntity> getWalletAccountAddress(int pageNum, num id) {
    Map<String, dynamic> param = new Map();
    param['coinCode'] = id;
    param['pageNum'] = pageNum;
    param['pageSize'] = 10;
    return HttpManager.getInstance().get<List<WalletAddressEntity>>(wallet_account_address,params: param,withLoading: false);
  }

  // 新增和编辑通讯录
  static const String wallet_account_address_add = "wallets/app/wallet/contact";
  static  Future<BaseEntity> getWalletAccountAddressAdd(String address, String aliasName, String coinName, num coinCode, num id) {
    Map<String, dynamic> param = new Map();
    if (id != 0) {
      param['id'] = id;
    }
    param['address'] = address;
    param['aliasName'] = aliasName;
    param['coinName'] = coinName;
    param['coinCode'] = coinCode;
    return HttpManager.getInstance().post(wallet_account_address_add,jsonEncode(param));
  }
  // 删除钱包
  static const String wallet_account_address_del = "wallets/app/wallet/contact/";
  static  Future<BaseEntity> walletAccountAddressDel(num id) {
    return HttpManager.getInstance().del(wallet_account_address_del+id.toString(),'');
  }

  // 钱包 申请提币
  static const String wallet_withdrawal_submit = "wallets/app/wallet/transaction";
  static  Future<BaseEntity> putWalletWithdeawalSubmit(String chain, num coinCode, num gas, String remark, String toAddress,num txValue) {
    Map<String, dynamic> param = new Map();
    param['chain'] = chain;
    param['coinCode'] = coinCode;
    param['gas'] = gas;
    param['remark'] = remark;
    param['toAddress'] = toAddress;
    param['txValue'] = txValue;
    return HttpManager.getInstance().post(wallet_withdrawal_submit,jsonEncode(param));
  }


  // 内网转账记录
  static const String transfer_record = "wallets/app/wallet/transfer/out_page";
  static  Future<BaseEntity> transferRecordList(int pageNum, num coinCode) {
    Map<String, dynamic> param = new Map();
    param['pageNum'] = pageNum;
    param['pageSize'] = 10;
    param['coinCode'] = coinCode;
    return HttpManager.getInstance().get<List<TransferRecordEntity>>(transfer_record,params: param,withLoading: true);
  }

  // 币种详情
  static const String waller_info = "wallets/app/wallet/flow/info/";
  static  Future<BaseEntity> getWalletInfo(num coinCode) {
    return HttpManager.getInstance().get<WalletInfoEntity>(waller_info+coinCode.toString(),withLoading: true);
  }
  // 冻结流水
  static const String waller_info_freeze = "wallets/app/wallet/flow/freeze";
  static  Future<BaseEntity> wallerInfForeeze(int pageNum) {
    Map<String, dynamic> param = new Map();
    param['pageNum'] = pageNum;
    param['pageSize'] = 10;
    return HttpManager.getInstance().get<List<WalletInfoListEntity>>(waller_info_freeze,params: param,withLoading: false);
  }
  // 可用流水
  static const String waller_info_normal = "wallets/app/wallet/flow/normal";
  static  Future<BaseEntity> wallerInfNormal(int pageNum) {
    Map<String, dynamic> param = new Map();
    param['pageNum'] = pageNum;
    param['pageSize'] = 10;
    return HttpManager.getInstance().get<List<WalletInfoListEntity>>(waller_info_normal,params: param,withLoading: false);
  }
  // 质押流水
  static const String waller_info_pledge = "wallets/app/wallet/flow/pledge";
  static  Future<BaseEntity> wallerInfPledge(int pageNum) {
    Map<String, dynamic> param = new Map();
    param['pageNum'] = pageNum;
    param['pageSize'] = 10;
    return HttpManager.getInstance().get<List<WalletInfoListEntity>>(waller_info_pledge,params: param,withLoading: false);
  }
}