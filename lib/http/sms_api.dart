

import 'dart:convert';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/utils/user_util.dart';
import 'http_manager.dart';

class SmsApi {
  // 找回密码
  static int CODE_TYPE_FIND_PWD = 1002;
  // 支付密码
  static int CODE_TYPE_SET_PAY_PWD = 1003;
  // 修改用户名
  static int CODE_TYPE_CHANGE_ACCOUNT = 1004;
  // 修改密码
  static int CODE_TYPE_CHANGE_PWD = 1005;
  // 修改支付密码
  static int CODE_TYPE_CHANGE_PAY_PWD = 1006;
  // 转账验证
  static int CODE_TYPE_SURE_PAY = 2001;
  // 转账验证
  static int CODE_TYPE_TRANSFER = 3001;
  // 提现接口
  static int CODE_TYPE_CNY_WITHDRAWAL = 4001;
  // 发送验证码
  static const String send_code = "wallet/app/send/code";

  static const String send_register = "wallet/app/send/register";
  /**
   * REGISTER(1001, "register_code:","注册"),
   *  FIND_PASSWORD(1002, "find_password_code:","找回密码"),
   *  SET_PAY_PWD(1003, "set_pay_pwd_code:","设置支付密码"),
   *  MODIFY_USERNAME(1003, "modify_username:", "修改用户名"),
   *    PAY_CONFIRM(2001, "pay_code:","支付确认"),
   *       *    PAY_CONFIRM(3001, "pay_code:","支付确认"),
   *
   *       1001-注册，1002-找回密码，
   *       1003-设置支付密码,
   *       1004-修改用户名,
   *       1005-支付确认,
   *       1006-修改支付密码,
   *       2001-支付确认, 3001-转账验证
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
    params['username'] = username;
    return HttpManager.getInstance().post(send_register,jsonEncode(params));
  }
  // 找回密码
  static const String send_find = "wallet/app/send/findPwd";
  static  Future<BaseEntity> sendForgetPawCode(String username) {
    Map<String, dynamic> params = new Map();
    params['username'] = username;
    return HttpManager.getInstance().post(send_find,jsonEncode(params));
  }
}