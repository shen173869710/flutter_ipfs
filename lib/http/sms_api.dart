

import 'dart:convert';

import 'package:ipfsnets/net/base_entity.dart';

import 'http_manager.dart';

class SmsApi {
  // 短信验证码
  static const String send_sms = "wallet/app/send/register";

  // 发送短信验证码
  static  Future<BaseEntity> sendSms(int type, String username) {
    Map<String, dynamic> params = new Map();
    params['type'] = type;
    params['username'] = username;
    return HttpManager.getInstance().post(send_sms,jsonEncode(params));
  }

}