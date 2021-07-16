

import 'dart:convert';
import 'dart:io';

import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/access_token_entity.dart';
import 'package:ipfsnets/models/image_entity.dart';
import 'package:ipfsnets/models/user_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/utils/string_util.dart';
import 'data_helper.dart';
import 'http_manager.dart';

class ApiServer {
  // 获取token
  static const String login_url = "auth/app/login";
  // 获取用户信息
  static const String get_user = "wallet/app/user/info";
  // 找回密码
  static const String change_password = "wallet/app/user/findPwd";
  // 上传图片
  static const String upload = "file/upload";
  // 编辑用户信息
  static const String update_user = "wallet/app/user/updateInfo";
  // 注册
  static const String register_user = "wallet/app/user/register";

  ///获取用户token
  static  Future<BaseEntity> login(String username, String password) {
    var params = DataHelper.getBaseMap();
    params['username'] = username;
    params['password'] = password;
    String json = jsonEncode(params);
    return HttpManager.getInstance().post<AccessTokenEntity>(login_url,json);
  }

  /***获取用户信息***/
  static  Future<BaseEntity> getuserInfo() {
    return HttpManager.getInstance().get<UserEntity>(get_user);
  }

  // 上传文件
  static Future<BaseEntity> uploadFile (File file) {
    return HttpManager.getInstance().upload<ImageEntity>(upload, file);
  }

  ///编辑用户信息
  static  Future<BaseEntity> updateUserInfo(String headUrl, String nickname, String sex) {
    var params = DataHelper.getBaseMap();
    if (headUrl != null && headUrl.isNotEmpty) {
      params['avatar'] = headUrl;
    }
    if (nickname != null && nickname.isNotEmpty) {
      params['nickname'] = nickname;
    }
    if (sex != null && sex.isNotEmpty) {
      params['sex'] = sex;
    }
    String json = jsonEncode(params);
    return HttpManager.getInstance().post<AccessTokenEntity>(update_user,json);
  }

  // 注册用户
  static Future<BaseEntity> register(String username, String password, String verifyCode, [String? inviteCode]) {
    var params = DataHelper.getBaseMap();
    if (StringUtil.isNotEmpty(inviteCode!)) {
      params['inviteCode'] = inviteCode;
    }
    params['username'] = username;
    params['password'] = password;
    params['verifyCode'] = verifyCode;
    String json = jsonEncode(params);
    return HttpManager.getInstance().post(register_user, json);
  }

  // 注册用户
  static Future<BaseEntity> findPassword(String username, String password, String verifyCode) {
    var params = DataHelper.getBaseMap();
    params['username'] = username;
    params['password'] = password;
    params['verifyCode'] = verifyCode;
    String json = jsonEncode(params);
    return HttpManager.getInstance().post(change_password, json);
  }
}