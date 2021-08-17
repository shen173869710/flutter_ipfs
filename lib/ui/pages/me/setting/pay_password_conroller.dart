

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ipfsnets/data/global_entiy.dart';
import 'package:ipfsnets/http/api_service.dart';
import 'package:ipfsnets/http/sms_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/utils/string_util.dart';
class PayPasswordController extends GetxController {

  late String value1;
  late String value2;
  late String code;

  init () {
    value1 = "";
    value2 = "";
    code = "";
  }

  void setValue1(String str) {
    this.value1 = str;
    enableSurebtn();
    update();
  }

  void setValue2(String str) {
    this.value2 = str;
    enableSurebtn();
    update();
  }


  void setCode(String str) {
    this.code = str;
    enableSurebtn();
    update();
  }


  bool enableSure= false;

  // 是否可以点击登录
  void enableSurebtn () {
   if (StringUtil.greateLength(value1, 5)
        && StringUtil.greateLength(value2, 5)
        && StringUtil.equalLenght(code, 6)
        ) {
        enableSure = true;
    }else{
     enableSure = false;
   }

  }


  // 提交修改
  Future<bool> doSubmit(BuildContext context) async{
      // 修改支付
      LogUtil.e(value2+" "+value2+ "  " +code);
      if (value1 != value2) {
        ToastUtil.show(S.current.password_no_equal);
        return false;
      }
      BaseEntity baseEntity  = await ApiServer.setPayPassword(value2,code);
      if (baseEntity.isOk()) {
        ToastUtil.show(S.current.option_success);
        return false;
      }else {
        ToastUtil.show(baseEntity.msg);
        return false;
      }
  }

  // 获取验证码
  Future<bool> getCode() async {
    BaseEntity baseEntity = await SmsApi.sendSms(SmsApi.CODE_TYPE_SET_PAY_PWD);
    if (baseEntity.isOk()) {
      ToastUtil.show(S.current.send_success);
    } else {
      ToastUtil.show(baseEntity.msg);
      return false;
    }

    return true;
  }
}