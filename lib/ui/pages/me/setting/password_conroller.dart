

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ipfsnets/data/global_entiy.dart';
import 'package:ipfsnets/http/api_service.dart';
import 'package:ipfsnets/http/sms_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/utils/string_util.dart';
class PasswordController extends GetxController {

  // 是否是电话注册
  late String  type;
  late String value1;
  late String value2;
  late String value3;
  late String code;

  init () {
    value1 = "";
    value2 = "";
    value3 = "";
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

  void setValue3(String str) {
    this.value3 = str;
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
    if (type == GlobalEntiy.PASSWORD_ACCOUNT
        && StringUtil.greateLength(value1, 5)
        && StringUtil.equalLenght(code, 6)) {
        enableSure = true;
    }else if (type == GlobalEntiy.PASSWORD_CHANGE
        && StringUtil.greateLength(value1, 5)
        && StringUtil.greateLength(value2, 5)
        && StringUtil.greateLength(value3, 5)
        ) {
        enableSure = true;
    }else if (type == GlobalEntiy.PASSWORD_APLAY
        && StringUtil.greateLength(value2, 5)
        && StringUtil.greateLength(value3, 5)
        && StringUtil.equalLenght(code, 6)) {
        enableSure = true;
    }else{
      enableSure = false;
    }

  }


  // 提交修改
  Future<bool> doSubmit(BuildContext context) async{

    if (type == GlobalEntiy.PASSWORD_ACCOUNT) {
      // 修改账户
      LogUtil.e(value1+" "+value2 + " " + value3);
      BaseEntity baseEntity  = await ApiServer.changeUsername(value1, code);
      if (baseEntity.isOk()) {
        ToastUtil.show(S.current.pwd_change_account);
        NavigatorUtil.goToLogin(context);
        return true;
      }else{
        ToastUtil.show(baseEntity.msg);
      }

    }else if (type == GlobalEntiy.PASSWORD_CHANGE) {
      // 修改密码
      LogUtil.e(value1+" "+value2 + " " + value3);
      if (value2 != value3) {
        ToastUtil.show(S.current.password_no_equal);
        return false;
      }
      BaseEntity baseEntity  = await ApiServer.changePassword(value1, value2);
      if (baseEntity.isOk()) {
        ToastUtil.show(S.current.pwd_change_sucess);
        NavigatorUtil.goToLogin(context);
        return true;
      }else{
        ToastUtil.show(baseEntity.msg);
      }

    }else if (type == GlobalEntiy.PASSWORD_APLAY) {
      // 修改支付
      LogUtil.e(value2+" "+value2+ "  " +code);

      if (value2 != value3) {
        ToastUtil.show(S.current.password_no_equal);
        return false;
      }
      BaseEntity baseEntity  = await ApiServer.setPayPassword(value2,code);
      if (baseEntity.isOk()) {
        ToastUtil.show(S.current.pwd_change_pay);
        NavigatorUtil.goBack(context);
        return true;
      }else {
        ToastUtil.show(baseEntity.msg);
        return false;
      }
    }


    return false;
  }

  // 获取验证码
  Future<bool> getCode() async{
    if (type == GlobalEntiy.PASSWORD_ACCOUNT) {
      BaseEntity baseEntity  = await SmsApi.sendSms(SmsApi.CODE_TYPE_CHANGE_ACCOUNT);
      if (baseEntity.isOk()) {
        ToastUtil.show(S.current.send_success);
      }else{
        ToastUtil.show(baseEntity.msg);
        return false;
      }
    }else if (type == GlobalEntiy.PASSWORD_CHANGE) {
      BaseEntity baseEntity  = await SmsApi.sendSms(SmsApi.CODE_TYPE_CHANGE_PWD);
      if (baseEntity.isOk()) {
        ToastUtil.show(S.current.send_success);
      }else{
        ToastUtil.show(baseEntity.msg);
        return false;
      }
    }else if (type == GlobalEntiy.PASSWORD_APLAY) {
      BaseEntity baseEntity  = await SmsApi.sendSms(SmsApi.CODE_TYPE_SET_PAY_PWD);
      if (baseEntity.isOk()) {
        ToastUtil.show(S.current.send_success);
      }else{
        ToastUtil.show(baseEntity.msg);
        return false;
      }
    }

    return true;
  }


}