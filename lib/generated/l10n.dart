// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flutter 中国`
  String get title {
    return Intl.message(
      'Flutter 中国',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `拍照`
  String get choose_camera {
    return Intl.message(
      '拍照',
      name: 'choose_camera',
      desc: '',
      args: [],
    );
  }

  /// `从相册选择`
  String get choose_photo {
    return Intl.message(
      '从相册选择',
      name: 'choose_photo',
      desc: '',
      args: [],
    );
  }

  /// `设置`
  String get action_settings {
    return Intl.message(
      '设置',
      name: 'action_settings',
      desc: '',
      args: [],
    );
  }

  /// `setting`
  String get tab_home {
    return Intl.message(
      'setting',
      name: 'tab_home',
      desc: '',
      args: [],
    );
  }

  /// `market`
  String get tab_market {
    return Intl.message(
      'market',
      name: 'tab_market',
      desc: '',
      args: [],
    );
  }

  /// `find`
  String get tab_find {
    return Intl.message(
      'find',
      name: 'tab_find',
      desc: '',
      args: [],
    );
  }

  /// `queoe`
  String get tab_quotes {
    return Intl.message(
      'queoe',
      name: 'tab_quotes',
      desc: '',
      args: [],
    );
  }

  /// `mine`
  String get tab_me {
    return Intl.message(
      'mine',
      name: 'tab_me',
      desc: '',
      args: [],
    );
  }

  /// `你好,`
  String get login_title {
    return Intl.message(
      '你好,',
      name: 'login_title',
      desc: '',
      args: [],
    );
  }

  /// `欢迎来到IPFSNETS`
  String get login_title_1 {
    return Intl.message(
      '欢迎来到IPFSNETS',
      name: 'login_title_1',
      desc: '',
      args: [],
    );
  }

  /// `请输入手机号`
  String get login_phone {
    return Intl.message(
      '请输入手机号',
      name: 'login_phone',
      desc: '',
      args: [],
    );
  }

  /// `请输入密码`
  String get login_pwd {
    return Intl.message(
      '请输入密码',
      name: 'login_pwd',
      desc: '',
      args: [],
    );
  }

  /// `登录`
  String get login_login {
    return Intl.message(
      '登录',
      name: 'login_login',
      desc: '',
      args: [],
    );
  }

  /// `注册`
  String get login_register {
    return Intl.message(
      '注册',
      name: 'login_register',
      desc: '',
      args: [],
    );
  }

  /// `忘记密码`
  String get login_find_pwd {
    return Intl.message(
      '忘记密码',
      name: 'login_find_pwd',
      desc: '',
      args: [],
    );
  }

  /// `请输入登录密码`
  String get register_pwd {
    return Intl.message(
      '请输入登录密码',
      name: 'register_pwd',
      desc: '',
      args: [],
    );
  }

  /// `请再次输入登录密码`
  String get register_pwd_again {
    return Intl.message(
      '请再次输入登录密码',
      name: 'register_pwd_again',
      desc: '',
      args: [],
    );
  }

  /// `我已阅读并同意`
  String get register_desc {
    return Intl.message(
      '我已阅读并同意',
      name: 'register_desc',
      desc: '',
      args: [],
    );
  }

  /// `《用户注册协议》`
  String get register_desc_more {
    return Intl.message(
      '《用户注册协议》',
      name: 'register_desc_more',
      desc: '',
      args: [],
    );
  }

  /// `我已注册,去登陆`
  String get register_login {
    return Intl.message(
      '我已注册,去登陆',
      name: 'register_login',
      desc: '',
      args: [],
    );
  }

  /// `手机注册`
  String get register_phone {
    return Intl.message(
      '手机注册',
      name: 'register_phone',
      desc: '',
      args: [],
    );
  }

  /// `邮箱注册`
  String get register_email {
    return Intl.message(
      '邮箱注册',
      name: 'register_email',
      desc: '',
      args: [],
    );
  }

  /// `请输入邮箱`
  String get register_email_hint {
    return Intl.message(
      '请输入邮箱',
      name: 'register_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `请输邀请码`
  String get register_share_hint {
    return Intl.message(
      '请输邀请码',
      name: 'register_share_hint',
      desc: '',
      args: [],
    );
  }

  /// `获取验证码`
  String get login_forgot_code {
    return Intl.message(
      '获取验证码',
      name: 'login_forgot_code',
      desc: '',
      args: [],
    );
  }

  /// `请输入验证码`
  String get login_forgot_code_hint {
    return Intl.message(
      '请输入验证码',
      name: 'login_forgot_code_hint',
      desc: '',
      args: [],
    );
  }

  /// `请输入新密码`
  String get login_forgot_pwd {
    return Intl.message(
      '请输入新密码',
      name: 'login_forgot_pwd',
      desc: '',
      args: [],
    );
  }

  /// `请再次输入新密码`
  String get login_forgot_pwd_again {
    return Intl.message(
      '请再次输入新密码',
      name: 'login_forgot_pwd_again',
      desc: '',
      args: [],
    );
  }

  /// `手机找回`
  String get forgot_by_phone {
    return Intl.message(
      '手机找回',
      name: 'forgot_by_phone',
      desc: '',
      args: [],
    );
  }

  /// `邮箱找回`
  String get forget_by_email {
    return Intl.message(
      '邮箱找回',
      name: 'forget_by_email',
      desc: '',
      args: [],
    );
  }

  /// `确定`
  String get sure {
    return Intl.message(
      '确定',
      name: 'sure',
      desc: '',
      args: [],
    );
  }

  /// `保存`
  String get save {
    return Intl.message(
      '保存',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `取消`
  String get cancle {
    return Intl.message(
      '取消',
      name: 'cancle',
      desc: '',
      args: [],
    );
  }

  /// `余额不足`
  String get not_enough {
    return Intl.message(
      '余额不足',
      name: 'not_enough',
      desc: '',
      args: [],
    );
  }

  /// `两次输入的密码不相同`
  String get password_no_equal {
    return Intl.message(
      '两次输入的密码不相同',
      name: 'password_no_equal',
      desc: '',
      args: [],
    );
  }

  /// `发送成功`
  String get send_success {
    return Intl.message(
      '发送成功',
      name: 'send_success',
      desc: '',
      args: [],
    );
  }

  /// `发送失败`
  String get send_faile {
    return Intl.message(
      '发送失败',
      name: 'send_faile',
      desc: '',
      args: [],
    );
  }

  /// `保存失败`
  String get save_faile {
    return Intl.message(
      '保存失败',
      name: 'save_faile',
      desc: '',
      args: [],
    );
  }

  /// `操作失败`
  String get option_faile {
    return Intl.message(
      '操作失败',
      name: 'option_faile',
      desc: '',
      args: [],
    );
  }

  /// `保存成功`
  String get save_success {
    return Intl.message(
      '保存成功',
      name: 'save_success',
      desc: '',
      args: [],
    );
  }

  /// `操作成功`
  String get option_success {
    return Intl.message(
      '操作成功',
      name: 'option_success',
      desc: '',
      args: [],
    );
  }

  /// `注册成功`
  String get register_success {
    return Intl.message(
      '注册成功',
      name: 'register_success',
      desc: '',
      args: [],
    );
  }

  /// `我的资料`
  String get me_info_title {
    return Intl.message(
      '我的资料',
      name: 'me_info_title',
      desc: '',
      args: [],
    );
  }

  /// `头像`
  String get me_info_head {
    return Intl.message(
      '头像',
      name: 'me_info_head',
      desc: '',
      args: [],
    );
  }

  /// `昵称`
  String get me_info_nick {
    return Intl.message(
      '昵称',
      name: 'me_info_nick',
      desc: '',
      args: [],
    );
  }

  /// `性别`
  String get me_info_sex {
    return Intl.message(
      '性别',
      name: 'me_info_sex',
      desc: '',
      args: [],
    );
  }

  /// `手机号码`
  String get me_info_phone {
    return Intl.message(
      '手机号码',
      name: 'me_info_phone',
      desc: '',
      args: [],
    );
  }

  /// `我的收货地址`
  String get me_info_address {
    return Intl.message(
      '我的收货地址',
      name: 'me_info_address',
      desc: '',
      args: [],
    );
  }

  /// `保存`
  String get me_info_save {
    return Intl.message(
      '保存',
      name: 'me_info_save',
      desc: '',
      args: [],
    );
  }

  /// `拍照`
  String get me_info_image_camera {
    return Intl.message(
      '拍照',
      name: 'me_info_image_camera',
      desc: '',
      args: [],
    );
  }

  /// `选择头像`
  String get me_info_image_choose {
    return Intl.message(
      '选择头像',
      name: 'me_info_image_choose',
      desc: '',
      args: [],
    );
  }

  /// `女`
  String get me_info_image_woman {
    return Intl.message(
      '女',
      name: 'me_info_image_woman',
      desc: '',
      args: [],
    );
  }

  /// `男`
  String get me_info_image_man {
    return Intl.message(
      '男',
      name: 'me_info_image_man',
      desc: '',
      args: [],
    );
  }

  /// `编辑昵称`
  String get edit_nick_name {
    return Intl.message(
      '编辑昵称',
      name: 'edit_nick_name',
      desc: '',
      args: [],
    );
  }

  /// `请输入昵称`
  String get edit_nick_input {
    return Intl.message(
      '请输入昵称',
      name: 'edit_nick_input',
      desc: '',
      args: [],
    );
  }

  /// `我的订单`
  String get me_order {
    return Intl.message(
      '我的订单',
      name: 'me_order',
      desc: '',
      args: [],
    );
  }

  /// `财富生活`
  String get me_life {
    return Intl.message(
      '财富生活',
      name: 'me_life',
      desc: '',
      args: [],
    );
  }

  /// `我的服务`
  String get me_server {
    return Intl.message(
      '我的服务',
      name: 'me_server',
      desc: '',
      args: [],
    );
  }

  /// `总账户资产折合: (CNY)`
  String get me_money {
    return Intl.message(
      '总账户资产折合: (CNY)',
      name: 'me_money',
      desc: '',
      args: [],
    );
  }

  /// `全部`
  String get me_item_1 {
    return Intl.message(
      '全部',
      name: 'me_item_1',
      desc: '',
      args: [],
    );
  }

  /// `代发货`
  String get me_item_2 {
    return Intl.message(
      '代发货',
      name: 'me_item_2',
      desc: '',
      args: [],
    );
  }

  /// `已发货`
  String get me_item_3 {
    return Intl.message(
      '已发货',
      name: 'me_item_3',
      desc: '',
      args: [],
    );
  }

  /// `已完成`
  String get me_item_4 {
    return Intl.message(
      '已完成',
      name: 'me_item_4',
      desc: '',
      args: [],
    );
  }

  /// `钱包`
  String get me_item_5 {
    return Intl.message(
      '钱包',
      name: 'me_item_5',
      desc: '',
      args: [],
    );
  }

  /// `付款`
  String get me_item_6 {
    return Intl.message(
      '付款',
      name: 'me_item_6',
      desc: '',
      args: [],
    );
  }

  /// `收款`
  String get me_item_7 {
    return Intl.message(
      '收款',
      name: 'me_item_7',
      desc: '',
      args: [],
    );
  }

  /// `扫一扫`
  String get me_item_8 {
    return Intl.message(
      '扫一扫',
      name: 'me_item_8',
      desc: '',
      args: [],
    );
  }

  /// `服务器`
  String get me_item_9 {
    return Intl.message(
      '服务器',
      name: 'me_item_9',
      desc: '',
      args: [],
    );
  }

  /// `购物车`
  String get me_item_10 {
    return Intl.message(
      '购物车',
      name: 'me_item_10',
      desc: '',
      args: [],
    );
  }

  /// `CNY账号`
  String get me_item_11 {
    return Intl.message(
      'CNY账号',
      name: 'me_item_11',
      desc: '',
      args: [],
    );
  }

  /// `内网转账`
  String get me_item_12 {
    return Intl.message(
      '内网转账',
      name: 'me_item_12',
      desc: '',
      args: [],
    );
  }

  /// `佣金提现`
  String get me_item_13 {
    return Intl.message(
      '佣金提现',
      name: 'me_item_13',
      desc: '',
      args: [],
    );
  }

  /// `我的粉丝`
  String get me_item_14 {
    return Intl.message(
      '我的粉丝',
      name: 'me_item_14',
      desc: '',
      args: [],
    );
  }

  /// `推广二维码`
  String get me_item_15 {
    return Intl.message(
      '推广二维码',
      name: 'me_item_15',
      desc: '',
      args: [],
    );
  }

  /// `消息通知`
  String get me_item_16 {
    return Intl.message(
      '消息通知',
      name: 'me_item_16',
      desc: '',
      args: [],
    );
  }

  /// `我的客服`
  String get me_item_17 {
    return Intl.message(
      '我的客服',
      name: 'me_item_17',
      desc: '',
      args: [],
    );
  }

  /// `设置`
  String get me_item_18 {
    return Intl.message(
      '设置',
      name: 'me_item_18',
      desc: '',
      args: [],
    );
  }

  /// `更多应用`
  String get me_item_19 {
    return Intl.message(
      '更多应用',
      name: 'me_item_19',
      desc: '',
      args: [],
    );
  }

  /// `热门推荐`
  String get find_tab_1 {
    return Intl.message(
      '热门推荐',
      name: 'find_tab_1',
      desc: '',
      args: [],
    );
  }

  /// `企业公告`
  String get find_tab_2 {
    return Intl.message(
      '企业公告',
      name: 'find_tab_2',
      desc: '',
      args: [],
    );
  }

  /// `新闻资讯`
  String get find_tab_3 {
    return Intl.message(
      '新闻资讯',
      name: 'find_tab_3',
      desc: '',
      args: [],
    );
  }

  /// `企业动态`
  String get find_tab_4 {
    return Intl.message(
      '企业动态',
      name: 'find_tab_4',
      desc: '',
      args: [],
    );
  }

  /// `CNY账户`
  String get cny_title {
    return Intl.message(
      'CNY账户',
      name: 'cny_title',
      desc: '',
      args: [],
    );
  }

  /// `总资产`
  String get cny_all {
    return Intl.message(
      '总资产',
      name: 'cny_all',
      desc: '',
      args: [],
    );
  }

  /// `充值`
  String get cny_rechage {
    return Intl.message(
      '充值',
      name: 'cny_rechage',
      desc: '',
      args: [],
    );
  }

  /// `提现`
  String get cny_withdrawal {
    return Intl.message(
      '提现',
      name: 'cny_withdrawal',
      desc: '',
      args: [],
    );
  }

  /// `来源`
  String get cny_item_1 {
    return Intl.message(
      '来源',
      name: 'cny_item_1',
      desc: '',
      args: [],
    );
  }

  /// `收入`
  String get cny_item_2 {
    return Intl.message(
      '收入',
      name: 'cny_item_2',
      desc: '',
      args: [],
    );
  }

  /// `时间`
  String get cny_item_3 {
    return Intl.message(
      '时间',
      name: 'cny_item_3',
      desc: '',
      args: [],
    );
  }

  /// `充值`
  String get cny_rechage_title {
    return Intl.message(
      '充值',
      name: 'cny_rechage_title',
      desc: '',
      args: [],
    );
  }

  /// `上传充值支付凭证`
  String get cny_rechage_upload {
    return Intl.message(
      '上传充值支付凭证',
      name: 'cny_rechage_upload',
      desc: '',
      args: [],
    );
  }

  /// `上传成功后我们会尽快给您审核充值到该账户`
  String get cny_rechage_desc {
    return Intl.message(
      '上传成功后我们会尽快给您审核充值到该账户',
      name: 'cny_rechage_desc',
      desc: '',
      args: [],
    );
  }

  /// `收款账户信息`
  String get cny_rechage_collection {
    return Intl.message(
      '收款账户信息',
      name: 'cny_rechage_collection',
      desc: '',
      args: [],
    );
  }

  /// `卡号姓名`
  String get cny_rechage_collection_card {
    return Intl.message(
      '卡号姓名',
      name: 'cny_rechage_collection_card',
      desc: '',
      args: [],
    );
  }

  /// `账户账号`
  String get cny_rechage_collection_number {
    return Intl.message(
      '账户账号',
      name: 'cny_rechage_collection_number',
      desc: '',
      args: [],
    );
  }

  /// `账户类型`
  String get cny_rechage_collection_type {
    return Intl.message(
      '账户类型',
      name: 'cny_rechage_collection_type',
      desc: '',
      args: [],
    );
  }

  /// `收款二维码`
  String get cny_rechage_collection_qrcode {
    return Intl.message(
      '收款二维码',
      name: 'cny_rechage_collection_qrcode',
      desc: '',
      args: [],
    );
  }

  /// `收款钱包账户信息`
  String get cny_rechage_wallet {
    return Intl.message(
      '收款钱包账户信息',
      name: 'cny_rechage_wallet',
      desc: '',
      args: [],
    );
  }

  /// `钱包类型`
  String get cny_rechage_wallet_type {
    return Intl.message(
      '钱包类型',
      name: 'cny_rechage_wallet_type',
      desc: '',
      args: [],
    );
  }

  /// `钱包地址`
  String get cny_rechage_wallet_address {
    return Intl.message(
      '钱包地址',
      name: 'cny_rechage_wallet_address',
      desc: '',
      args: [],
    );
  }

  /// `钱包二维码`
  String get cny_rechage_wallet_qrcode {
    return Intl.message(
      '钱包二维码',
      name: 'cny_rechage_wallet_qrcode',
      desc: '',
      args: [],
    );
  }

  /// `充值记录`
  String get cny_rechage_record_title {
    return Intl.message(
      '充值记录',
      name: 'cny_rechage_record_title',
      desc: '',
      args: [],
    );
  }

  /// `充值成功`
  String get cny_rechage_record_suc {
    return Intl.message(
      '充值成功',
      name: 'cny_rechage_record_suc',
      desc: '',
      args: [],
    );
  }

  /// `充值失败`
  String get cny_rechage_record_fail {
    return Intl.message(
      '充值失败',
      name: 'cny_rechage_record_fail',
      desc: '',
      args: [],
    );
  }

  /// `等待中`
  String get cny_rechage_record_ing {
    return Intl.message(
      '等待中',
      name: 'cny_rechage_record_ing',
      desc: '',
      args: [],
    );
  }

  /// `提现成功`
  String get cny_withdrawal_record_suc {
    return Intl.message(
      '提现成功',
      name: 'cny_withdrawal_record_suc',
      desc: '',
      args: [],
    );
  }

  /// `提现失败`
  String get cny_withdrawal_record_fail {
    return Intl.message(
      '提现失败',
      name: 'cny_withdrawal_record_fail',
      desc: '',
      args: [],
    );
  }

  /// `等待中`
  String get cny_withdrawal_record_ing {
    return Intl.message(
      '等待中',
      name: 'cny_withdrawal_record_ing',
      desc: '',
      args: [],
    );
  }

  /// `提现`
  String get cny_withdrawal_title {
    return Intl.message(
      '提现',
      name: 'cny_withdrawal_title',
      desc: '',
      args: [],
    );
  }

  /// `金额`
  String get cny_withdrawal_money {
    return Intl.message(
      '金额',
      name: 'cny_withdrawal_money',
      desc: '',
      args: [],
    );
  }

  /// `全部`
  String get cny_withdrawal_all {
    return Intl.message(
      '全部',
      name: 'cny_withdrawal_all',
      desc: '',
      args: [],
    );
  }

  /// `手续费每笔5%`
  String get cny_withdrawal_commission {
    return Intl.message(
      '手续费每笔5%',
      name: 'cny_withdrawal_commission',
      desc: '',
      args: [],
    );
  }

  /// `1.仅支持USDT提现账户收款,手续费每笔5%;\n\n2.提现审核时间为9:00-18:00,T+1个工作日后到账;\n\n3.每次最低提现金额为100元及整数倍才能申请提现;`
  String get cny_withdrawal_desc {
    return Intl.message(
      '1.仅支持USDT提现账户收款,手续费每笔5%;\n\n2.提现审核时间为9:00-18:00,T+1个工作日后到账;\n\n3.每次最低提现金额为100元及整数倍才能申请提现;',
      name: 'cny_withdrawal_desc',
      desc: '',
      args: [],
    );
  }

  /// `提现记录`
  String get cny_withdrawal_record {
    return Intl.message(
      '提现记录',
      name: 'cny_withdrawal_record',
      desc: '',
      args: [],
    );
  }

  /// `提取成功`
  String get cny_withdrawal_success {
    return Intl.message(
      '提取成功',
      name: 'cny_withdrawal_success',
      desc: '',
      args: [],
    );
  }

  /// `到账`
  String get cny_withdrawal_result {
    return Intl.message(
      '到账',
      name: 'cny_withdrawal_result',
      desc: '',
      args: [],
    );
  }

  /// `选择提现账户`
  String get withdrawal_dialog_title {
    return Intl.message(
      '选择提现账户',
      name: 'withdrawal_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `提现到支付宝`
  String get withdrawal_dialog_alipay {
    return Intl.message(
      '提现到支付宝',
      name: 'withdrawal_dialog_alipay',
      desc: '',
      args: [],
    );
  }

  /// `提现到银行卡`
  String get withdrawal_dialog_bank {
    return Intl.message(
      '提现到银行卡',
      name: 'withdrawal_dialog_bank',
      desc: '',
      args: [],
    );
  }

  /// `最近使用`
  String get withdrawal_dialog_near {
    return Intl.message(
      '最近使用',
      name: 'withdrawal_dialog_near',
      desc: '',
      args: [],
    );
  }

  /// `提现金额`
  String get cny_withdrawal_end_money {
    return Intl.message(
      '提现金额',
      name: 'cny_withdrawal_end_money',
      desc: '',
      args: [],
    );
  }

  /// `提现到支付宝`
  String get cny_withdrawal_end_alipay_title {
    return Intl.message(
      '提现到支付宝',
      name: 'cny_withdrawal_end_alipay_title',
      desc: '',
      args: [],
    );
  }

  /// `请输入姓名`
  String get cny_withdrawal_end_alipay_name {
    return Intl.message(
      '请输入姓名',
      name: 'cny_withdrawal_end_alipay_name',
      desc: '',
      args: [],
    );
  }

  /// `请输入支付宝账户`
  String get cny_withdrawal_end_alipay_account {
    return Intl.message(
      '请输入支付宝账户',
      name: 'cny_withdrawal_end_alipay_account',
      desc: '',
      args: [],
    );
  }

  /// `请确认支付宝账号无误再提现`
  String get cny_withdrawal_end_alipay_desc {
    return Intl.message(
      '请确认支付宝账号无误再提现',
      name: 'cny_withdrawal_end_alipay_desc',
      desc: '',
      args: [],
    );
  }

  /// `提现到银行卡`
  String get cny_withdrawal_end_bank_title {
    return Intl.message(
      '提现到银行卡',
      name: 'cny_withdrawal_end_bank_title',
      desc: '',
      args: [],
    );
  }

  /// `请输入姓名`
  String get cny_withdrawal_end_bank_name {
    return Intl.message(
      '请输入姓名',
      name: 'cny_withdrawal_end_bank_name',
      desc: '',
      args: [],
    );
  }

  /// `请输入银行卡账户`
  String get cny_withdrawal_end_bank_account {
    return Intl.message(
      '请输入银行卡账户',
      name: 'cny_withdrawal_end_bank_account',
      desc: '',
      args: [],
    );
  }

  /// `请输入卡号银行`
  String get cny_withdrawal_end_bank_address {
    return Intl.message(
      '请输入卡号银行',
      name: 'cny_withdrawal_end_bank_address',
      desc: '',
      args: [],
    );
  }

  /// `确定提现`
  String get cny_withdrawal_end_sure {
    return Intl.message(
      '确定提现',
      name: 'cny_withdrawal_end_sure',
      desc: '',
      args: [],
    );
  }

  /// `请确认银行卡账号无误再提现`
  String get cny_withdrawal_end_band_desc {
    return Intl.message(
      '请确认银行卡账号无误再提现',
      name: 'cny_withdrawal_end_band_desc',
      desc: '',
      args: [],
    );
  }

  /// `新增地址`
  String get withdraw_address_title {
    return Intl.message(
      '新增地址',
      name: 'withdraw_address_title',
      desc: '',
      args: [],
    );
  }

  /// `请输入有效钱包地址`
  String get withdraw_address_hitn {
    return Intl.message(
      '请输入有效钱包地址',
      name: 'withdraw_address_hitn',
      desc: '',
      args: [],
    );
  }

  /// `名称`
  String get withdraw_address_name {
    return Intl.message(
      '名称',
      name: 'withdraw_address_name',
      desc: '',
      args: [],
    );
  }

  /// `更多应用`
  String get more_title {
    return Intl.message(
      '更多应用',
      name: 'more_title',
      desc: '',
      args: [],
    );
  }

  /// `推荐应用`
  String get more_tab_1 {
    return Intl.message(
      '推荐应用',
      name: 'more_tab_1',
      desc: '',
      args: [],
    );
  }

  /// `购物娱乐`
  String get more_tab_2 {
    return Intl.message(
      '购物娱乐',
      name: 'more_tab_2',
      desc: '',
      args: [],
    );
  }

  /// `游戏中心`
  String get more_tab_3 {
    return Intl.message(
      '游戏中心',
      name: 'more_tab_3',
      desc: '',
      args: [],
    );
  }

  /// `生活服务`
  String get more_tab_4 {
    return Intl.message(
      '生活服务',
      name: 'more_tab_4',
      desc: '',
      args: [],
    );
  }

  /// `星际商城`
  String get more_item_1 {
    return Intl.message(
      '星际商城',
      name: 'more_item_1',
      desc: '',
      args: [],
    );
  }

  /// `河豚网盘`
  String get more_item_2 {
    return Intl.message(
      '河豚网盘',
      name: 'more_item_2',
      desc: '',
      args: [],
    );
  }

  /// `LendChain`
  String get more_item_3 {
    return Intl.message(
      'LendChain',
      name: 'more_item_3',
      desc: '',
      args: [],
    );
  }

  /// `OKEX开户`
  String get more_item_4 {
    return Intl.message(
      'OKEX开户',
      name: 'more_item_4',
      desc: '',
      args: [],
    );
  }

  /// `币安开户`
  String get more_item_5 {
    return Intl.message(
      '币安开户',
      name: 'more_item_5',
      desc: '',
      args: [],
    );
  }

  /// `火币开户`
  String get more_item_6 {
    return Intl.message(
      '火币开户',
      name: 'more_item_6',
      desc: '',
      args: [],
    );
  }

  /// `星际商城`
  String get more_item_7 {
    return Intl.message(
      '星际商城',
      name: 'more_item_7',
      desc: '',
      args: [],
    );
  }

  /// `小矿工`
  String get more_item_8 {
    return Intl.message(
      '小矿工',
      name: 'more_item_8',
      desc: '',
      args: [],
    );
  }

  /// `想住卡`
  String get more_item_9 {
    return Intl.message(
      '想住卡',
      name: 'more_item_9',
      desc: '',
      args: [],
    );
  }

  /// `DLive`
  String get more_item_10 {
    return Intl.message(
      'DLive',
      name: 'more_item_10',
      desc: '',
      args: [],
    );
  }

  /// `BMall`
  String get more_item_11 {
    return Intl.message(
      'BMall',
      name: 'more_item_11',
      desc: '',
      args: [],
    );
  }

  /// `LastTnip`
  String get more_item_12 {
    return Intl.message(
      'LastTnip',
      name: 'more_item_12',
      desc: '',
      args: [],
    );
  }

  /// `海盗霸王`
  String get more_item_13 {
    return Intl.message(
      '海盗霸王',
      name: 'more_item_13',
      desc: '',
      args: [],
    );
  }

  /// `可信小镇`
  String get more_item_14 {
    return Intl.message(
      '可信小镇',
      name: 'more_item_14',
      desc: '',
      args: [],
    );
  }

  /// `我的钱包`
  String get wallet_title {
    return Intl.message(
      '我的钱包',
      name: 'wallet_title',
      desc: '',
      args: [],
    );
  }

  /// `总账户资产折合`
  String get wallet_total {
    return Intl.message(
      '总账户资产折合',
      name: 'wallet_total',
      desc: '',
      args: [],
    );
  }

  /// `扫一扫`
  String get wallet_item_1 {
    return Intl.message(
      '扫一扫',
      name: 'wallet_item_1',
      desc: '',
      args: [],
    );
  }

  /// `提币`
  String get wallet_item_2 {
    return Intl.message(
      '提币',
      name: 'wallet_item_2',
      desc: '',
      args: [],
    );
  }

  /// `充币`
  String get wallet_item_3 {
    return Intl.message(
      '充币',
      name: 'wallet_item_3',
      desc: '',
      args: [],
    );
  }

  /// `兑换`
  String get wallet_item_4 {
    return Intl.message(
      '兑换',
      name: 'wallet_item_4',
      desc: '',
      args: [],
    );
  }

  /// `提币`
  String get wallet_withdraw_title {
    return Intl.message(
      '提币',
      name: 'wallet_withdraw_title',
      desc: '',
      args: [],
    );
  }

  /// `选择币种`
  String get wallet_withdraw_money_choose {
    return Intl.message(
      '选择币种',
      name: 'wallet_withdraw_money_choose',
      desc: '',
      args: [],
    );
  }

  /// `余额`
  String get wallet_withdraw_money_has {
    return Intl.message(
      '余额',
      name: 'wallet_withdraw_money_has',
      desc: '',
      args: [],
    );
  }

  /// `主链名称`
  String get wallet_withdraw_money_name {
    return Intl.message(
      '主链名称',
      name: 'wallet_withdraw_money_name',
      desc: '',
      args: [],
    );
  }

  /// `ERC20`
  String get wallet_withdraw_erc20 {
    return Intl.message(
      'ERC20',
      name: 'wallet_withdraw_erc20',
      desc: '',
      args: [],
    );
  }

  /// `TRC20`
  String get wallet_withdraw_trc20 {
    return Intl.message(
      'TRC20',
      name: 'wallet_withdraw_trc20',
      desc: '',
      args: [],
    );
  }

  /// `HECO`
  String get wallet_withdraw_heco {
    return Intl.message(
      'HECO',
      name: 'wallet_withdraw_heco',
      desc: '',
      args: [],
    );
  }

  /// `OMNI`
  String get wallet_withdraw_omni {
    return Intl.message(
      'OMNI',
      name: 'wallet_withdraw_omni',
      desc: '',
      args: [],
    );
  }

  /// `数量`
  String get wallet_withdraw_num {
    return Intl.message(
      '数量',
      name: 'wallet_withdraw_num',
      desc: '',
      args: [],
    );
  }

  /// `可以转出`
  String get wallet_withdraw_out_hint {
    return Intl.message(
      '可以转出',
      name: 'wallet_withdraw_out_hint',
      desc: '',
      args: [],
    );
  }

  /// `最小提币数量是 `
  String get wallet_withdraw_min {
    return Intl.message(
      '最小提币数量是 ',
      name: 'wallet_withdraw_min',
      desc: '',
      args: [],
    );
  }

  /// `全部`
  String get wallet_withdraw_all {
    return Intl.message(
      '全部',
      name: 'wallet_withdraw_all',
      desc: '',
      args: [],
    );
  }

  /// `手续费率每笔`
  String get wallet_withdraw_out_money {
    return Intl.message(
      '手续费率每笔',
      name: 'wallet_withdraw_out_money',
      desc: '',
      args: [],
    );
  }

  /// `提币地址`
  String get wallet_withdraw_address {
    return Intl.message(
      '提币地址',
      name: 'wallet_withdraw_address',
      desc: '',
      args: [],
    );
  }

  /// `请输入有效地址`
  String get wallet_withdraw_address_hint {
    return Intl.message(
      '请输入有效地址',
      name: 'wallet_withdraw_address_hint',
      desc: '',
      args: [],
    );
  }

  /// `备注`
  String get wallet_withdraw_mark {
    return Intl.message(
      '备注',
      name: 'wallet_withdraw_mark',
      desc: '',
      args: [],
    );
  }

  /// `选填`
  String get wallet_withdraw_mark_hint {
    return Intl.message(
      '选填',
      name: 'wallet_withdraw_mark_hint',
      desc: '',
      args: [],
    );
  }

  /// `1.请勿向上述地址充值任何非FIL资产,否则资产将不可找回; \n\n  2.您充值至上述地址后,需要整个网络节点的确认,60次网络确认后到账,910次网络确认后可提现;\n\n  3.最小充值金额: 0.1FIL,小于最小金额的充值将不会在上账,且无法退回;\n\n  4.您的充值地址不会经常改变,可以重复充值;如果有更改,我们会尽量通过网站或邮件通知您;\n\n  5.请务必确认电脑以及浏览器安全,防止信息被篡改或者泄露;\n\n`
  String get wallet_withdraw_desc {
    return Intl.message(
      '1.请勿向上述地址充值任何非FIL资产,否则资产将不可找回; \n\n  2.您充值至上述地址后,需要整个网络节点的确认,60次网络确认后到账,910次网络确认后可提现;\n\n  3.最小充值金额: 0.1FIL,小于最小金额的充值将不会在上账,且无法退回;\n\n  4.您的充值地址不会经常改变,可以重复充值;如果有更改,我们会尽量通过网站或邮件通知您;\n\n  5.请务必确认电脑以及浏览器安全,防止信息被篡改或者泄露;\n\n',
      name: 'wallet_withdraw_desc',
      desc: '',
      args: [],
    );
  }

  /// `新增地址`
  String get wallet_withdraw_address_title {
    return Intl.message(
      '新增地址',
      name: 'wallet_withdraw_address_title',
      desc: '',
      args: [],
    );
  }

  /// `修改地址`
  String get wallet_withdraw_address_edit_title {
    return Intl.message(
      '修改地址',
      name: 'wallet_withdraw_address_edit_title',
      desc: '',
      args: [],
    );
  }

  /// `名称`
  String get wallet_withdraw_address_name {
    return Intl.message(
      '名称',
      name: 'wallet_withdraw_address_name',
      desc: '',
      args: [],
    );
  }

  /// `描述 (选填)`
  String get wallet_withdraw_address_desc {
    return Intl.message(
      '描述 (选填)',
      name: 'wallet_withdraw_address_desc',
      desc: '',
      args: [],
    );
  }

  /// `选择提币地址`
  String get wallet_withdraw_dialog_title {
    return Intl.message(
      '选择提币地址',
      name: 'wallet_withdraw_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `新增地址`
  String get wallet_withdraw_dialog_add {
    return Intl.message(
      '新增地址',
      name: 'wallet_withdraw_dialog_add',
      desc: '',
      args: [],
    );
  }

  /// `提币记录`
  String get wallet_withdraw_record_title {
    return Intl.message(
      '提币记录',
      name: 'wallet_withdraw_record_title',
      desc: '',
      args: [],
    );
  }

  /// `提币地址`
  String get wallet_withdraw_item_address {
    return Intl.message(
      '提币地址',
      name: 'wallet_withdraw_item_address',
      desc: '',
      args: [],
    );
  }

  /// `提币成功`
  String get wallet_withdraw_item_suc {
    return Intl.message(
      '提币成功',
      name: 'wallet_withdraw_item_suc',
      desc: '',
      args: [],
    );
  }

  /// `提币失败`
  String get wallet_withdraw_item_fail {
    return Intl.message(
      '提币失败',
      name: 'wallet_withdraw_item_fail',
      desc: '',
      args: [],
    );
  }

  /// `等待中`
  String get wallet_withdraw_item_ing {
    return Intl.message(
      '等待中',
      name: 'wallet_withdraw_item_ing',
      desc: '',
      args: [],
    );
  }

  /// `区块确认中`
  String get wallet_withdraw_item_sure {
    return Intl.message(
      '区块确认中',
      name: 'wallet_withdraw_item_sure',
      desc: '',
      args: [],
    );
  }

  /// `冲币记录`
  String get wallet_recharge_record_title {
    return Intl.message(
      '冲币记录',
      name: 'wallet_recharge_record_title',
      desc: '',
      args: [],
    );
  }

  /// `冲币地址`
  String get wallet_recharge_item_address {
    return Intl.message(
      '冲币地址',
      name: 'wallet_recharge_item_address',
      desc: '',
      args: [],
    );
  }

  /// `冲币成功`
  String get wallet_recharge_item_suc {
    return Intl.message(
      '冲币成功',
      name: 'wallet_recharge_item_suc',
      desc: '',
      args: [],
    );
  }

  /// `冲币失败`
  String get wallet_recharge_item_fail {
    return Intl.message(
      '冲币失败',
      name: 'wallet_recharge_item_fail',
      desc: '',
      args: [],
    );
  }

  /// `等待中`
  String get wallet_recharge_item_ing {
    return Intl.message(
      '等待中',
      name: 'wallet_recharge_item_ing',
      desc: '',
      args: [],
    );
  }

  /// `区块确认中`
  String get wallet_recharge_item_sure {
    return Intl.message(
      '区块确认中',
      name: 'wallet_recharge_item_sure',
      desc: '',
      args: [],
    );
  }

  /// `冲币`
  String get wallet_recharge_title {
    return Intl.message(
      '冲币',
      name: 'wallet_recharge_title',
      desc: '',
      args: [],
    );
  }

  /// `冲币地址`
  String get wallet_recharge_address {
    return Intl.message(
      '冲币地址',
      name: 'wallet_recharge_address',
      desc: '',
      args: [],
    );
  }

  /// `复制地址`
  String get wallet_recharge_copy {
    return Intl.message(
      '复制地址',
      name: 'wallet_recharge_copy',
      desc: '',
      args: [],
    );
  }

  /// `扫描二维码,获取地址`
  String get wallet_recharge_scan {
    return Intl.message(
      '扫描二维码,获取地址',
      name: 'wallet_recharge_scan',
      desc: '',
      args: [],
    );
  }

  /// `设置`
  String get setting_title {
    return Intl.message(
      '设置',
      name: 'setting_title',
      desc: '',
      args: [],
    );
  }

  /// `修改账户`
  String get setting_change_phone {
    return Intl.message(
      '修改账户',
      name: 'setting_change_phone',
      desc: '',
      args: [],
    );
  }

  /// `修改登录密码`
  String get setting_change_logig_pwd {
    return Intl.message(
      '修改登录密码',
      name: 'setting_change_logig_pwd',
      desc: '',
      args: [],
    );
  }

  /// `修改支付密码`
  String get setting_change_pay_pwd {
    return Intl.message(
      '修改支付密码',
      name: 'setting_change_pay_pwd',
      desc: '',
      args: [],
    );
  }

  /// `语言设置`
  String get setting_language {
    return Intl.message(
      '语言设置',
      name: 'setting_language',
      desc: '',
      args: [],
    );
  }

  /// `版本`
  String get setting_version {
    return Intl.message(
      '版本',
      name: 'setting_version',
      desc: '',
      args: [],
    );
  }

  /// `退出登录`
  String get setting_logout {
    return Intl.message(
      '退出登录',
      name: 'setting_logout',
      desc: '',
      args: [],
    );
  }

  /// `修改账号`
  String get pwd_account_title {
    return Intl.message(
      '修改账号',
      name: 'pwd_account_title',
      desc: '',
      args: [],
    );
  }

  /// `请输入手机号或者邮箱`
  String get pwd_account_hint {
    return Intl.message(
      '请输入手机号或者邮箱',
      name: 'pwd_account_hint',
      desc: '',
      args: [],
    );
  }

  /// `请输入验证码`
  String get pwd_account_code {
    return Intl.message(
      '请输入验证码',
      name: 'pwd_account_code',
      desc: '',
      args: [],
    );
  }

  /// `修改登录密码`
  String get pwd_login_title {
    return Intl.message(
      '修改登录密码',
      name: 'pwd_login_title',
      desc: '',
      args: [],
    );
  }

  /// `请输入旧密码`
  String get pwd_login_old {
    return Intl.message(
      '请输入旧密码',
      name: 'pwd_login_old',
      desc: '',
      args: [],
    );
  }

  /// `请输入新密码`
  String get pwd_login_new {
    return Intl.message(
      '请输入新密码',
      name: 'pwd_login_new',
      desc: '',
      args: [],
    );
  }

  /// `请再次输入新密码`
  String get pwd_login_again {
    return Intl.message(
      '请再次输入新密码',
      name: 'pwd_login_again',
      desc: '',
      args: [],
    );
  }

  /// `修改支付密码`
  String get pwd_pay_title {
    return Intl.message(
      '修改支付密码',
      name: 'pwd_pay_title',
      desc: '',
      args: [],
    );
  }

  /// `请输支付密码(6位纯数字)`
  String get pwd_pay_new {
    return Intl.message(
      '请输支付密码(6位纯数字)',
      name: 'pwd_pay_new',
      desc: '',
      args: [],
    );
  }

  /// `请再次输入密码`
  String get pwd_pay_new_again {
    return Intl.message(
      '请再次输入密码',
      name: 'pwd_pay_new_again',
      desc: '',
      args: [],
    );
  }

  /// `请输入手机验证码`
  String get pwd_pay_code {
    return Intl.message(
      '请输入手机验证码',
      name: 'pwd_pay_code',
      desc: '',
      args: [],
    );
  }

  /// `语言设置`
  String get language_title {
    return Intl.message(
      '语言设置',
      name: 'language_title',
      desc: '',
      args: [],
    );
  }

  /// `英语`
  String get language_en {
    return Intl.message(
      '英语',
      name: 'language_en',
      desc: '',
      args: [],
    );
  }

  /// `中文`
  String get language_ch {
    return Intl.message(
      '中文',
      name: 'language_ch',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'HK'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
