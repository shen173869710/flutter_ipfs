

import 'package:ipfsnets/http/api_service.dart';
import 'package:ipfsnets/http/sms_api.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/utils/toast_util.dart';

import '../../../include.dart';

class RegisterController extends GetxController {


  void init() {
    isPhone = true;
    account = "";
    code = "";
    password = "";
    paddwordAgain = "";
    shareCode = "";
    agreeMent = false;
    enableRgister = false;
  }

  // 是否是电话注册
  bool isPhone = true;
  late String account;
  late String code;
  late String password;
  late String paddwordAgain;
  late String shareCode;
  bool agreeMent = false;
  bool enableRgister = false;

  // 切换注册
  void changeRegister() {
    isPhone = !isPhone;
    account = "";
    password = "";
    paddwordAgain = "";
    enableRgister = false;
    LogUtil.e("changeRegister"+isPhone.toString());
    enableRegister ();
    update();
  }

  //  用户名输入
  void setUserName (String str) {
    this.account = str;
    enableRegister ();
    LogUtil.e("setUserName"+str);
    update();
  }
  //  验证码输入
  void setCode (String str) {
    this.code = str;
    enableRegister ();
    LogUtil.e("setCode"+str);
    update();
  }

  //  输入邀请码
  void setShareCode (String str) {
    this.shareCode = str;
  }

  //  密码输入
  void setPassword (String str) {
    LogUtil.e("setPassword"+str);
    this.password = str;
    enableRegister ();
    update();
  }

  //  密码输入再次
  void setPasswordAgain (String str) {
    LogUtil.e("setPasswordAgain"+str);
    this.paddwordAgain = str;
    enableRegister ();
    update();
  }
  // 是否选择用户协议
  void setAgreeMent () {

    agreeMent = !agreeMent;
    LogUtil.e("setAgreeMent"+agreeMent.toString());
    enableRegister ();
    update();
  }
  // 是否可以点击登录
  void enableRegister () {
    LogUtil.e("enableRegister()");
    if (account != null && account.length > 6 &&
        code != null && code.length >5 &&
        password != null && password.length > 5 &&
        paddwordAgain != null && paddwordAgain.length > 5 &&
        agreeMent && StringUtil.isNotEmpty(shareCode)){

      enableRgister = true;
    }else{
      enableRgister = false;
    }

  }
  // 注册
  Future<bool> doRegister() async{
    if (password != paddwordAgain) {
      ToastUtil.show(S.current.password_no_equal);
      return false;
    }
    BaseEntity baseEntity  = await ApiServer.register(account, password, code,shareCode);
    if (baseEntity.isOk()) {
      return true;
    }else {
      ToastUtil.show(baseEntity.msg);
    }
    return false;
  }

  // 获取验证码
  Future<bool>  getCode() async {
    BaseEntity baseEntity  = await SmsApi.sendSms(0, "18675570791");
    if (baseEntity.isOk()) {
      ToastUtil.show(S.current.send_success);
    }else{
      ToastUtil.show(S.current.send_faile);
    }

    return true;
  }
}
