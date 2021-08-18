import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ipfsnets/http/wallet_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/wallet_account_entity.dart';
import 'package:ipfsnets/models/wallet_withdrawal_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/utils/num_util.dart';
import 'package:ipfsnets/utils/string_util.dart';

class WalletWithdrawalController extends GetxController{

  List<WalletAccountEntity> listEntiy = [];
  List<WalletWithdrawalEntity> walletListEntiy = [];
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

  // 可以转出币的数量
  num blance = 0;
  // 最少转出
  num minBlance = 0;
  // 转出的手续费
  num poundage = 0;
  // 输入金币数量
  num inputMoney = 0;
  // 转换的费率
  num poundageGas = 0;
  // 提币地址
  String address = "";
  String mark = "";
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

    // 可以转出币的数量
    blance = 0;
    // 最少转出
    minBlance = 0;
    // 转出的手续费
    poundage = 0;
    // 输入金币数量
    inputMoney = 0;
    // 转换的费率
    poundageGas = 0;
    // 提币地址
    address = "";
    mark = "";
    // 确定按钮是否可以点击
    enableButton = false;
    // 底部描述信息
    desc = "";
  }

  // 初始化数据
  initData(List<WalletAccountEntity> aEntiy, List<WalletWithdrawalEntity> wEntiy, int index) {
    listEntiy = aEntiy;
    walletListEntiy = wEntiy;

    typeIndex = index;
    addressIndex = 0;
    type = listEntiy[typeIndex].coinName;
    blance = listEntiy[typeIndex].value;

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
  void showOther(WalletWithdrawalEntity entity) {

    coinCode = entity.coinCode;
    chain = entity.chain;
    minBlance = entity.withdrawCoinLowNumber;
    poundageGas = entity.withdrawCoinGasPrice;
    LogUtil.e(poundageGas.toString());
    poundage = NumUtil.multiplyDec(poundageGas,inputMoney).toDouble();
    desc = entity.outDes;
  }
  // 提现金额
  void withdrawalMoney(String str) {
    if (StringUtil.isEmpty(str)){
      inputMoney = 0;
    }else{
      inputMoney = double.parse(str);
    }

    LogUtil.e(inputMoney.toString());
    poundage =  NumUtil.multiplyDec(poundageGas,inputMoney).toDouble();
    enableBSubmit();
    update();
  }
  // 地址输入
  void withdrawalAddress(String str) {
    LogUtil.e("地址输入"+str);
    address = str;
    enableBSubmit();
    update();
  }

  void withdrawalMark(String str) {
    mark = str;
  }

  void enableBSubmit() {
    LogUtil.e("inout = "+inputMoney.toString() +" minBlance "+ minBlance.toString()+"addres"+address);
    if (inputMoney >= minBlance && StringUtil.isNotEmpty(address)) {
        enableButton = true;
    }else{
      enableButton = false;
    }
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
    inputMoney = 0;
    showOther(walletListEntiy[addressIndex]);
    update();
  }
  // 点击全部
  void allClick(String str) {
    withdrawalMoney(str);
  }

  // 提交提现
  Future<bool> doWithdrawalSubmit() async {
      if (inputMoney > blance){
        ToastUtil.show(S.current.not_enough);
        return false;
      }
      BaseEntity baseEntity  = await WalletApi.putWalletWithdeawalSubmit(chain,coinCode,poundage,mark,address,inputMoney);
      if (baseEntity.isOk()) {
        ToastUtil.show(S.current.option_success);
        return false;
      }else{
        ToastUtil.show(baseEntity.msg);
      }
      return true;
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

}