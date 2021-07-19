

import 'dart:convert';
import 'dart:io';

import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/access_token_entity.dart';
import 'package:ipfsnets/models/acount_entiy.dart';
import 'package:ipfsnets/models/cny_account_entity.dart';
import 'package:ipfsnets/models/cny_acount_record_entity.dart';
import 'package:ipfsnets/models/cny_recharge_entity.dart';
import 'package:ipfsnets/models/cny_recharge_record_entity.dart';
import 'package:ipfsnets/models/cny_withdrawal_record_entity.dart';
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

  // 找回密码
  static Future<BaseEntity> findPassword(String username, String password, String verifyCode) {
    var params = DataHelper.getBaseMap();
    params['username'] = username;
    params['password'] = password;
    params['verifyCode'] = verifyCode;
    String json = jsonEncode(params);
    return HttpManager.getInstance().post(change_password, json);
  }


  // cny 首页
  static const String cny_account = "cny/app/account/home";
  static const String cny_account_list = "cny/app/account/statement/list";

  ///获取cny账户相关信息
  static  Future<BaseEntity> getCny() {
    return HttpManager.getInstance().get<CnyAccountEntity>(cny_account,withLoading: false);
  }
  ///获取cny转账记录
  static  Future<BaseEntity> getCnyList(int pageNum) {
    Map<String, dynamic> param = new Map();
    param['pageNum'] = pageNum;
    param['pageSize'] = 10;
    return HttpManager.getInstance().get<List<CnyAcountRecordEntity>>(cny_account_list,params: param,withLoading: false);
  }
  /***********
   *  cny充值
   *
   * ****************/

  static const String cny_recharge_info = "cny/app/recharge/setting";
  // 提交充值凭据
  static const String cny_recharge_submit = "cny/app/recharge";
  // 获取充值记录列表
  static const String cny_recharge_list = "cny/app/recharge/list";


  // 获取充值账户信息
  static  Future<BaseEntity> getCnyRechargeInfo() {
    return HttpManager.getInstance().get<CnyRechargeEntity>(cny_recharge_info);
  }

  ///提交充值凭证
  static  Future<BaseEntity> putCnyRecharge(String evidence) {
    Map<String, dynamic> param = new Map();
    param['evidence'] = evidence;
    return HttpManager.getInstance().post(cny_recharge_submit,jsonEncode(param));
  }

  ///获取列表相关信息
  static  Future<BaseEntity> getCnyRechargeList(int pageNum) {
    Map<String, dynamic> param = new Map();
    param['pageNum'] = pageNum;
    param['pageSize'] = 10;
    return HttpManager.getInstance().get<List<CnyRechargeRecordEntity>>(cny_recharge_list,params: param,withLoading: false);
  }

/***********
 *  cny提现
 *
 * ****************/

  // cny 提现
  static const String cny_withdrawal = "cny/app/withdraw";
  // cny 提交历史账户
  static const String cny_withdrawal_history = "cny/app/withdraw/history";
  // cny 提交记录
  static const String cny_withdrawal_list = "cny/app/withdraw/list";

  ///提交cny 提现
  static  Future<BaseEntity> cnyWithdrawal(String accountBank, String accountName, String accountNumber,String amount,String code, String type) {
    Map<String, dynamic> param = new Map();

    param['accountBank'] = accountBank;
    param['accountName'] = accountName;
    param['accountNumber'] = accountNumber;
    param['amount'] = amount;
    param['code'] = code;
    param['type'] = type;
    return HttpManager.getInstance().post(cny_withdrawal,jsonEncode(param),withLoading: true);
  }

  ///获取历史提现账户
  static  Future<BaseEntity> cnyWithdrawalhistory(int pageNum) {
    Map<String, dynamic> param = new Map();
    param['pageNum'] = pageNum;
    param['pageSize'] = 10;
    return HttpManager.getInstance().get<List<AccountEntiy>>(cny_withdrawal_history,params: param,withLoading: false);
  }
  static  Future<BaseEntity> cnyWithdrawalList(int pageNum) {
    Map<String, dynamic> param = new Map();
    param['pageNum'] = pageNum;
    param['pageSize'] = 10;
    return HttpManager.getInstance().get<List<CnyWithdrawalRecordEntity>>(cny_withdrawal_list,params: param,withLoading: false);
  }

}