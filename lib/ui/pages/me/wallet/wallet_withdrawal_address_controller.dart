import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/wallet_account_entity.dart';
import 'package:ipfsnets/models/wallet_address_entity.dart';
import 'package:ipfsnets/models/wallet_withdrawal_entity.dart';
import 'package:ipfsnets/utils/num_util.dart';
import 'package:ipfsnets/utils/string_util.dart';

class WalletWithdrawalAddressController extends GetxController{
  late WalletAddressEntity entity;
  bool enable = false;

  intit (WalletAddressEntity addressEntity) {
    entity = addressEntity;
  }


  onNameInpiut(String str) {
    entity.aliasName = str;
    enableButton();
    update();
  }

  onAddressInpiut(String str) {
    entity.address = str;
    enableButton();
    update();
  }

  enableButton() {
    if (StringUtil.isNotEmpty(entity.address)&& StringUtil.isNotEmpty(entity.aliasName)) {
      enable = true;
    }else{
      enable = false;
    }
  }

}