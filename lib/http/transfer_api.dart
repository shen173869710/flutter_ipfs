

import 'dart:convert';

import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/transfer_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';

import 'http_manager.dart';

class TransferApi{


  // 内网转账接口
  static const String transfer_list = "wallets/app/wallet/transfer/coin/info_list";

  static  Future<BaseEntity> transferList() {
    return HttpManager.getInstance().get<List<TransferEntity>>(transfer_list);
  }


  static const String transfer_out = "wallets/app/wallet/transfer/out";

  static  Future<BaseEntity> transferOut(String code,num coinCode,num gas,String inUserId, String remark, num money) {
    Map<String, dynamic> param = new Map();
    param['captcha'] = code;
    param['coinCode'] = coinCode;
    param['gas'] = gas;
    param['inUsername'] = inUserId;
    if (StringUtil.isNotEmpty(remark)) {
      param['remark'] = remark;
    }
    param['transferNumber'] = money;
    return HttpManager.getInstance().post(transfer_out,jsonEncode(param));
  }
}