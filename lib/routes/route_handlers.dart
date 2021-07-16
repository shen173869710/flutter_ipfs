import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/ui/pages/me/baseListpage/base_list_page.dart';
import 'package:ipfsnets/ui/pages/me/cny/cny_rechage_record_page.dart';
import 'package:ipfsnets/ui/pages/index_page.dart';
import 'package:ipfsnets/ui/pages/login_page.dart';
import 'package:ipfsnets/ui/pages/main_page.dart';
import 'package:ipfsnets/ui/pages/me/cny/cny_withdrawal_end_page.dart';
import 'package:ipfsnets/ui/pages/me/cny/cny_withdrawal_record_page.dart';
import 'package:ipfsnets/ui/pages/me/more/more_page.dart';
import 'package:ipfsnets/ui/pages/me/setting/language_page.dart';
import 'package:ipfsnets/ui/pages/me/setting/setting_page.dart';
import 'package:ipfsnets/ui/pages/me/user/user_edit_page.dart';
import 'package:ipfsnets/ui/pages/me/user/user_manager_page.dart';
import 'package:ipfsnets/ui/pages/me/wallet/walle_scan_page.dart';
import 'package:ipfsnets/ui/pages/me/wallet/wallet_exchange_page.dart';
import 'package:ipfsnets/ui/pages/me/wallet/wallet_page.dart';
import 'package:ipfsnets/ui/pages/me/wallet/wallet_recharge_page.dart';
import 'package:ipfsnets/ui/pages/me/wallet/wallet_withdrawal_page.dart';
import 'package:ipfsnets/ui/pages/register/forget_page.dart';
import 'package:ipfsnets/ui/pages/register/register_page.dart';
import 'package:ipfsnets/ui/pages/me/cny/cny_account_page.dart';
import 'package:ipfsnets/ui/pages/me/cny/cny_rechage_page.dart';
import 'package:ipfsnets/ui/pages/me/cny/cny_withdrawal_page.dart';



// 闪屏启动页面
var rootHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return MainPage();
    });

var indexHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return IndexPage();
});


var loginHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return LoginPage();
});

var registerHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return RegisterPage();
});
// 忘记密码
var forgetHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return ForgetPage();
});

// 用户昵称编辑
var userEditHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return UserEditPage();
});
// 用户管理
var userManagerHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return UserManagerPage();
});

// cny账户
var cnyAccountHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return CnyAccountPage();
});
// cny充值
var cnyRechageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return CnyRechagePage();
});
// cny提现
var cnyWithdrawalHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return CnyWithdrawalPage();
});
// cny充值记录
var cnyRechageRecordHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return CnyRechageRecordPage();
});

// cny提现记录
var cnyWithdrawalRecordHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return CnyWithDrawalRecordPage();
});

// cny提交到支付宝或者银行卡
var cnyWithdrawalEndHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return CnyWithdrawalEndPage(type: params['type']?.first ?? '');
});

// 更多
var moreHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return MorePage();
});

// 我的钱包
var walletHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return WalletPage();
});

// 钱包扫一扫
var walletScanHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return WalletScanPage();
});

// 我的钱包 提币
var walletWithdrawalHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return WalletWithdrawalPage();
});

// 我的钱包 充币
var walletRechargeHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return WalletRechargePage();
});

// 我的钱包 兑换
var walletExchangeHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return WalletExchangePage();
});

// 设置页面
var settingHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return SettingPage();
});
// 多语言
var languageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return LanguagePage();
});

// 历史记录相关页面
var baseListHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  final String type = params['type']?.first ?? '';
  return BaseListPage(type: type);
});