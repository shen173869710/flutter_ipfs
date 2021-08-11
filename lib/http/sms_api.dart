

import 'dart:convert';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/utils/user_util.dart';
import 'http_manager.dart';

class SmsApi {

  static int CODE_TYPE_SET_PAY_PWD = 1003;
  // 发送验证码
  static const String send_code = "wallet/app/send/code";

  static const String send_register = "wallet/app/send/register";
  /**
   * REGISTER(1001, "register_code:","注册"),
   *  FIND_PASSWORD(1002, "find_password_code:","找回密码"),
   *  SET_PAY_PWD(1003, "set_pay_pwd_code:","设置支付密码"),
   *  MODIFY_USERNAME(1003, "modify_username:", "修改用户名"),
   *    PAY_CONFIRM(2001, "pay_code:","支付确认"),
   */
  // 发送短信验证码
  static  Future<BaseEntity> sendSms(int type) {
    Map<String, dynamic> params = new Map();
    params['type'] = type;
    params['username'] = UserUtil.getUserInfo().username;
    return HttpManager.getInstance().post(send_code,jsonEncode(params));
  }


  static  Future<BaseEntity> sendRegisterCode(String username) {
    Map<String, dynamic> params = new Map();
    // params['type'] = 1001;
    params['username'] = username;
    return HttpManager.getInstance().post(send_register,jsonEncode(params));
  }
}