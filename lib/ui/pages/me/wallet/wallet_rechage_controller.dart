import 'dart:typed_data';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ipfsnets/http/wallet_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/wallet_account_entity.dart';
import 'package:ipfsnets/models/wallet_rechage_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';

class WalletRechageController extends GetxController{

  Uint8List bytes = Uint8List(0);

  List<WalletAccountEntity> listEntiy = [];
  List<WalletRechageEntity> walletListEntiy = [];
  // 顶部 币种选择
  String type = "";
  // 默认选中的币种
  int typeIndex = 0;
  // 默认选择的主链
  int addressIndex = 0;
  // 主链名称 是否显示
  bool showMainAddress = true;
  // 是否显示链  item
  String item0 = "";
  bool showItem0 = false;
  bool selItem0 = false;
  String item1 = "";
  bool showItem1 = false;
  bool selItem1 = false;
  String item2 = "";
  bool showItem2 = false;
  bool selItem2 = false;
  String item3 = "";
  bool showItem3 = false;
  bool selItem3 = false;

  // 充币地址
  String address = "";
  // 确定按钮是否可以点击
  bool enableButton = false;
  // 底部描述信息
  String desc = "";
  num coinCode = 0;
  String chain = "";

  init(){
    listEntiy = [];
    walletListEntiy = [];
    // 顶部 币种选择
    type = "";
    // 默认选中的币种
    typeIndex = 0;
    // 默认选择的主链
    addressIndex = 0;
    // 主链名称 是否显示
    showMainAddress = true;
    // 是否显示链  item
    item0 = "";
    showItem0 = false;
    selItem0 = false;
    item1 = "";
    showItem1 = false;
    selItem1 = false;
    item2 = "";
    showItem2 = false;
    selItem2 = false;
    item3 = "";
    showItem3 = false;
    selItem3 = false;

    // 提币地址
    address = "";
    // 确定按钮是否可以点击
    enableButton = false;
    // 底部描述信息
    desc = "";
  }

  // 初始化数据
  initData(List<WalletAccountEntity> aEntiy, List<WalletRechageEntity> wEntiy, int index) {
    listEntiy = aEntiy;
    walletListEntiy = wEntiy;

    typeIndex = index;
    addressIndex = 0;
    type = listEntiy[typeIndex].coinName;
    LogUtil.e("tyoe =="+type+walletListEntiy.length.toString());
    if (walletListEntiy.length == 1) {
      showMainAddress = false;
    }else {
      showMainAddress = true;
      showItem();
    }

    showOther(walletListEntiy[addressIndex]);

    update();
  }
  // 显示item
  void showItem() {
    int length = walletListEntiy.length;
    item0 = "";
    showItem0 = false;
    selItem0 = false;
    item1 = "";
    showItem1 = false;
    selItem1 = false;
    item2 = "";
    showItem2 = false;
    selItem2 = false;
    item3 = "";
    showItem3 = false;
    selItem3 = false;

    if (length == 1) {
      item0 = walletListEntiy[0].chain;
      showItem0 = true;
      selItem0 = true;
    }else if(length == 2) {
      item0 = walletListEntiy[0].chain;
      showItem0 = true;
      selItem0 = true;
      item1 = walletListEntiy[1].chain;
      showItem1 = true;
      selItem1 = false;
    }else if (length == 3) {
      item0 = walletListEntiy[0].chain;
      showItem0 = true;
      selItem0 = true;
      item1 = walletListEntiy[1].chain;
      showItem1 = true;
      selItem1 = false;
      item2 = walletListEntiy[1].chain;
      showItem2 = true;
      selItem2 = false;
    }else if (length == 4) {
      item0 = walletListEntiy[0].chain;
      showItem0 = true;
      selItem0 = true;

      item1 = walletListEntiy[1].chain;
      showItem1 = true;
      selItem1 = false;

      item2 = walletListEntiy[2].chain;
      showItem2 = true;
      selItem2 = false;

      item3 = walletListEntiy[3].chain;
      showItem3 = true;
      selItem3 = false;
    }

  }

  // 显示其他页面
  void showOther(WalletRechageEntity entity) {
    coinCode = entity.coinCode;
    chain = entity.chain;
    desc = entity.inDes;
    setAddress(entity.address);

  }


  void onItemSel(index) {
    if (index>walletListEntiy.length) {
      return;
    }
    LogUtil.e(index.toString());
    addressIndex = index;
    selItem0 = false;
    selItem1 = false;
    selItem2 = false;
    selItem3 = false;
    if (index == 0) {
      selItem0 = true;
    }else if (index == 1) {
      selItem1 = true;
    }else if (index == 2) {
      selItem2 = true;
    }else if (index == 3) {
      selItem3 = true;
    }

    showOther(walletListEntiy[addressIndex]);
    update();
  }

  copyAddress() {


  }
  // 删除通讯录
  Future<bool> delAddress(num id) async {
    BaseEntity baseEntity  = await WalletApi.walletAccountAddressDel(id);
    if (baseEntity.isOk()) {
      ToastUtil.show(S.current.option_success);
      return false;
    }else{
      ToastUtil.show(baseEntity.msg);
    }
    return true;
  }

  withdrawalAddress(String str){
    setAddress(str);
    update();
  }


  setAddress(String inputCode) async {
    address = inputCode;

  }


}