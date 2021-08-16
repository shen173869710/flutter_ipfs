
import 'dart:convert';

import 'package:flustars/flustars.dart';
import 'package:ipfsnets/models/user_entity.dart';
import 'package:ipfsnets/utils/string_util.dart';

class UserUtil {

  static const String SP_USER_INFO = "sp_user_info";

  static const String SP_USER_ID = "sp_user_userId";
  static const String SP_AVATAR = "sp_avatar";
  static const String SP_LEVEL = "sp_level";
  static const String SP_NICKNAME = "sp_nickname";
  static const String SP_PASSWORD = "sp_password";
  static const String SP_SEX = "sp_sex";
  static const String SP_USER_NAME = "sp_user_name";
  static const String SP_CODE = "sp_code";
  static const String SP_REF = "sp_ref";
  static const String SP_REFNAME = "sp_refname";
  static const String SP_REFS = "sp_refs";
  static const String SP_REFLEVELS = "sp_reflevels";

  static const String SP_IS_ALLOGIN = "sp_is_allogin";

  // 保存用户个人信息
  static void saveUserInfo(UserEntity entity) {
    if (entity != null) {
      String userStr = jsonEncode(entity).toString();
      LogUtil.e("保存用户 user = "+userStr);
      SpUtil.putString(SP_USER_INFO, userStr);
      SpUtil.putBool(SP_IS_ALLOGIN, true);
    }
  }

  // 获取用户信息
  static UserEntity getUserInfo() {
    bool isLogin = SpUtil.getBool(SP_IS_ALLOGIN)!;
    UserEntity user = UserEntity();
    String? userStr = SpUtil.getString(SP_USER_INFO);
    if (StringUtil.isNotEmpty(userStr!)) {
      Map<String, dynamic> responseJson = json.decode(userStr);
      user = UserEntity.fromJson(responseJson);
      LogUtil.e("获取用户信息 user = "+jsonEncode(user).toString());
    }
    return user;
  }


  static bool hasUserInfo() {
    String? userStr = SpUtil.getString(SP_USER_INFO);

    LogUtil.e("userInfo === "+userStr!);
    if (StringUtil.isNotEmpty(userStr)) {
       return true;
    }
    return false;
  }

  // 判断用户是否登录
  static bool isLogin() {
    bool b = SpUtil.getBool(SP_IS_ALLOGIN)!;
    return b != null && b;
  }

  // 保存用户头像
  static saveUserAvatarl(String mUrl) async {
    await SpUtil.putString(SP_AVATAR, mUrl);
  }

  /**
   *  用户昵称
   */
  static saveUserNickName(String ncik) async {
    await SpUtil.putString(SP_NICKNAME, ncik);
  }

  /**
   *  用户性别
   */
  static saveUserSex(String sex) async {
    await SpUtil.putString(SP_SEX, sex);
  }


  static loginout() {
    SpUtil.putBool(SP_IS_ALLOGIN, false);
    SpUtil.putString(SP_USER_INFO, "");
  }
}