
import 'package:flustars/flustars.dart';
import 'package:ipfsnets/models/user_entity.dart';

class UserUtil {
  static const String SP_USER_ID = "sp_user_userId";
  static const String SP_AVATAR = "sp_avatar";
  static const String SP_CODE = "sp_code";
  static const String SP_NICKNAME = "sp_nickname";
  static const String SP_PASSWORD = "sp_password";
  static const String SP_SEX = "sp_sex";
  static const String SP_USER_NAME = "sp_user_name";


  static const String SP_IS_ALLOGIN = "sp_is_allogin";

  // 保存用户个人信息
  static void saveUserInfo(UserEntity entity) {
    if (entity != null) {
      SpUtil.putInt(SP_USER_ID, entity.userId!);
      SpUtil.putString(SP_AVATAR, entity.avatar!);
      SpUtil.putString(SP_NICKNAME, entity.nickname!);
      // SpUtil.putString(SP_PASSWORD, entity.password!);
      SpUtil.putString(SP_SEX, entity.sex!);
      SpUtil.putString(SP_USER_NAME, entity.username!);
      SpUtil.putBool(SP_IS_ALLOGIN, true);
    }
  }

  // 获取用户信息
  static UserEntity getUserInfo() {
    bool isLogin = SpUtil.getBool(SP_IS_ALLOGIN)!;

    UserEntity user = UserEntity();
    user.userId = SpUtil.getInt(SP_USER_ID);
    user.avatar = SpUtil.getString(SP_AVATAR);
    user.nickname = SpUtil.getString(SP_NICKNAME);
    // user.password = SpUtil.getString(SP_PASSWORD);
    user.sex = SpUtil.getString(SP_SEX);
    user.username = SpUtil.getString(SP_USER_NAME);
    return user;
  }


  static void initUserInfo(UserEntity user) {
    // SpUtil.putString(SP_USER_ID, user.id);
    // SpUtil.putString(SP_USER_NAME, user.username);
    // SpUtil.putString(SP_USER_NICK, user.nick);
    // SpUtil.putString(SP_USER_HEADURL, user.headurl);
    // SpUtil.putString(SP_USER_DESC, user.decs);
    // SpUtil.putString(SP_USER_GENDER, user.gender);
    // SpUtil.putString(SP_USER_FOLLOW, user.followCount);
    // SpUtil.putString(SP_USER_FAN, user.fanCount);
    // SpUtil.putInt(SP_USER_ISMEMBER, user.ismember);
    // SpUtil.putInt(SP_USER_ISVERTIFY, user.isvertify);
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
    // SpUtil.putBool(SP_IS_ALLOGIN, false);
    // SpUtil.putObject(SP_USER_ID, "");
    // SpUtil.putString(SP_USER_NAME, "");
    // SpUtil.putString(SP_USER_NICK, "");
    // SpUtil.putString(SP_USER_HEADURL, "");
    // SpUtil.putObject(SP_USER_DESC, "");
    // SpUtil.putObject(SP_USER_GENDER, "");
    // SpUtil.putObject(SP_USER_FOLLOW, "");
    // SpUtil.putObject(SP_USER_FAN, "");
    // SpUtil.putObject(SP_USER_ISMEMBER, "");
    // SpUtil.putObject(SP_USER_ISVERTIFY, "");
  }
}