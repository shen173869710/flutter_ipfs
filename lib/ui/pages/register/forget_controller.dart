

import 'package:ipfsnets/http/api_service.dart';
import 'package:ipfsnets/http/sms_api.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/utils/string_util.dart';
import 'package:ipfsnets/utils/toast_util.dart';

import '../../../include.dart';

class ForgetController extends GetxController {

  // 是否是电话注册
  bool isPhone = true;
  late String account = "";
  late String code = "";
  late String password = "";
  late String paddwordAgain = "";

  bool enableRgister = false;

  // 切换注册
  void changeRegister() {
    isPhone = !isPhone;
    account = "";
    password = "";
    paddwordAgain = "";
    enableRegister ();
    update();
  }

  //  用户名输入
  void setUserName (String str) {
    this.account = str;
    enableRegister ();
    update();
  }
  //  验证码输入
  void setCode (String str) {
    this.code = str;
    enableRegister ();
    update();
  }



  //  密码输入
  void setPassword (String str) {
    this.password = str;
    enableRegister ();
    update();
  }

  //  密码输入再次
  void setPasswordAgain (String str) {
    this.paddwordAgain = str;
    enableRegister ();
    update();
  }

  // 是否可以点击登录
  void enableRegister () {
    if (StringUtil.greateLength(account, 10) &&
        StringUtil.greateLength(code, 5) &&
        StringUtil.greateLength(password, 5) &&
        StringUtil.greateLength(paddwordAgain, 5)){
      enableRgister = true;
    }else{
      enableRgister = false;
    }

  }
  // 找回密码
  Future<bool> findPwd() async{
    if (password != paddwordAgain) {
      ToastUtil.show(S.current.password_no_equal);
      return false;
    }
    BaseEntity baseEntity = await ApiServer.findPassword(account, password, code);
    if (baseEntity.isOk()) {
      return true;
    }else {
      ToastUtil.show(baseEntity.msg);
    }
    return false;
  }

  // 获取验证码
  Future<bool>  getCode() async {
    if(StringUtil.isEmpty(account)) {
      ToastUtil.show(S.current.not_account);
      return false;
    }

    BaseEntity baseEntity  = await SmsApi.sendForgetPawCode(account);
    if (baseEntity.isOk()) {
      ToastUtil.show(S.current.send_success);
    }else {
      ToastUtil.show(baseEntity.msg);
      return false;
    }
    return true;
  }
}
