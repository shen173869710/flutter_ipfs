import 'dart:typed_data';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ipfsnets/http/sms_api.dart';
import 'package:ipfsnets/http/transfer_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/transfer_entity.dart';
import 'package:ipfsnets/models/transfer_in_entiy.dart';
import 'package:ipfsnets/models/transfer_out_entiy.dart';
import 'package:ipfsnets/models/wallet_account_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/utils/num_util.dart';

class TeansferController extends GetxController{
  List<WalletAccountEntity> listEntiy = [];

  TransferOutEntiy outEntiy = new TransferOutEntiy();
  TransferInEntiy inEntiy = new TransferInEntiy();
  List<TransferEntity> list = [];

  num value = 0;

  num coinCode = 0;
  int itemSel = 0;
  // 顶部 币种选择
  String type = "";
  // 默认选中的币种
  int typeIndex = 0;
  // 转出的手续费率
  num poundageGas = 0;
  // 对方账号
  String account = "";
  // // 对方昵称
  // String nickname = "";
  // 转账数量
  String money = "";
  // 转出的手续费
  String poundage = "";
  // 验证码
  String code = "";
  // 备注
  String mark = "";
  // 收款账户
  String inAccount = "";
  bool enableButton = false;

  init(){
    list = [];
    outEntiy = new TransferOutEntiy();
    inEntiy = new TransferInEntiy();
    int itemSel = 0;
    // 顶部 币种选择
    type = "";
    // 默认选中的币种
    typeIndex = 0;
    // 转出的手续费率
    poundageGas = 0;
    // 对方账号
    account = "";
    // // 对方昵称
    // nickname = "";
    // 转账数量
    money = "";
    // 转出的手续费
    poundage = "";
    // 验证码
    code = "";
    // 备注
    mark = "";
    // 收款账户
    inAccount = "";
    enableButton = false;
  }

  initData(List<TransferEntity> entitys, int sel) {
    list = entitys;
    int size = entitys.length;
    listEntiy.clear();
    for(int i = 0; i < size; i++) {
      WalletAccountEntity accountEntity = new WalletAccountEntity();
      accountEntity.coinIcon = entitys[i].coinIcon;
      accountEntity.coinName = entitys[i].coinName;
      accountEntity.coinCode = entitys[i].coinCode;
      accountEntity.value = entitys[i].value;
      listEntiy.add(accountEntity);
    }
    typeIndex = sel;
    initView(sel);
  }
  // 初始化页面
  initView(int index) {
    if (list.length > index) {
      typeIndex = index;
      TransferEntity entity = list[index];
      inEntiy = entity.transferInfoVo.transferIn;
      outEntiy = entity.transferInfoVo.transferOut;
      coinCode = entity.coinCode;
      value = entity.value;
      type = entity.coinName;
      poundageGas = outEntiy.gas;
      inAccount = inEntiy.username;
      update();
    }

  }


  setValue(String str, int index) {
    if (index == 1) {
      account = str;
    }else if (index == 2) {
      // nickname = str;
    }else if (index == 3) {
      money = str;
      setPoundage();
    }else if (index == 4) {
      // poundage = str;
    }else if (index == 5) {
      code = str;
    }else if (index == 6) {
      mark = str;
    }
    enableBtn();
  }

  enableBtn() {
    LogUtil.e("account = "+account + "money = "+money+" code = "+code);
    if (StringUtil.isNotEmpty(account)
        // && StringUtil.isNotEmpty(nickname)
        && StringUtil.isNotEmpty(money)
        && StringUtil.isNotEmpty(code)
        ){
      enableButton = true;
    }else{
      enableButton = false;
    }
    update();
  }

   setPoundage() {
    String valut = "0";
    if(StringUtil.isNotEmpty(money)) {
      valut =  NumUtil.multiplyDec(poundageGas,num.parse(money)).toString();
    }
    poundage =  valut;
  }
  // 进行转账
  Future<bool> doTransfer() async {
    num outMoney = num.parse(money);
    if (outMoney > value) {
      ToastUtil.show(S.current.not_enough);
      return false;
    }

    BaseEntity entity = await TransferApi.transferOut(code, coinCode, poundageGas, account, mark,num.parse(money));
    if(entity.isOk()) {
      return true;
    }else{
      ToastUtil.show(entity.msg);
    }
    return false;
  }


  setItemSel(int index) {
    itemSel = index;
    update();
  }


  void setCode(String str) {
    code = str;
    enableBtn();
  }
  // 获取验证码
  Future<bool>  getCode() async {
    BaseEntity baseEntity  = await SmsApi.sendSms(SmsApi.CODE_TYPE_TRANSFER);
    if (baseEntity.isOk()) {
      ToastUtil.show(S.current.send_success);
    }else{
      ToastUtil.show(baseEntity.msg);
      return false;
    }
    return true;
  }
}