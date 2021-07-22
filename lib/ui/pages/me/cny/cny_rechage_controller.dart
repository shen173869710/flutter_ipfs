import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ipfsnets/http/api_service.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/cny_acount_record_entity.dart';
import 'package:ipfsnets/models/cny_recharge_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/utils/toast_util.dart';

class CnyRechargeController extends GetxController{
  late String accountBank = "";
  late String accountName = "";
  late String accountNumber = "";
  late String accountType = "";
  late String qrCode = "";

  late List<CnyAcountRecordEntity> list = [];

  /**获取充值账户信息**/
   getAccountInfo() async{
     BaseEntity baseEntity  = await ApiServer.getCnyRechargeInfo();
     CnyRechargeEntity entity = baseEntity.data;
     accountName = entity.accountName!;
     accountNumber = entity.accountNumber!;
     qrCode = entity.qrCode!;
     accountType = entity.accountType!;
      update();
     LogUtil.e("balance"+entity.toString());

  }

  /**
   *  提交凭据
   */
   putEvidence(String pageNum) async{
     BaseEntity baseEntity  = await ApiServer.putCnyRecharge(pageNum);
     ToastUtil.show(S.current.option_success);

  }

  Future<bool> init() async{
    list.clear();

    return true;
  }



}