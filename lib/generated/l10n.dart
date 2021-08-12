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

  /// `刷新`
  String get refresh {
    return Intl.message(
      '刷新',
      name: 'refresh',
      desc: '',
      args: [],
    );
  }

  /// `加载`
  String get loadMore {
    return Intl.message(
      '加载',
      name: 'loadMore',
      desc: '',
      args: [],
    );
  }

  /// `拉动刷新`
  String get pullToRefresh {
    return Intl.message(
      '拉动刷新',
      name: 'pullToRefresh',
      desc: '',
      args: [],
    );
  }

  /// `释放刷新`
  String get releaseToRefresh {
    return Intl.message(
      '释放刷新',
      name: 'releaseToRefresh',
      desc: '',
      args: [],
    );
  }

  /// `正在刷新...`
  String get refreshing {
    return Intl.message(
      '正在刷新...',
      name: 'refreshing',
      desc: '',
      args: [],
    );
  }

  /// `刷新完成`
  String get refreshFinish {
    return Intl.message(
      '刷新完成',
      name: 'refreshFinish',
      desc: '',
      args: [],
    );
  }

  /// `刷新失败`
  String get refreshFailed {
    return Intl.message(
      '刷新失败',
      name: 'refreshFailed',
      desc: '',
      args: [],
    );
  }

  /// `刷新完成`
  String get refreshed {
    return Intl.message(
      '刷新完成',
      name: 'refreshed',
      desc: '',
      args: [],
    );
  }

  /// `拉动加载`
  String get pushToLoad {
    return Intl.message(
      '拉动加载',
      name: 'pushToLoad',
      desc: '',
      args: [],
    );
  }

  /// `释放加载`
  String get releaseToLoad {
    return Intl.message(
      '释放加载',
      name: 'releaseToLoad',
      desc: '',
      args: [],
    );
  }

  /// `正在加载...`
  String get loading {
    return Intl.message(
      '正在加载...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `加载完成`
  String get loadFinish {
    return Intl.message(
      '加载完成',
      name: 'loadFinish',
      desc: '',
      args: [],
    );
  }

  /// `加载失败`
  String get loadFailed {
    return Intl.message(
      '加载失败',
      name: 'loadFailed',
      desc: '',
      args: [],
    );
  }

  /// `加载完成`
  String get loaded {
    return Intl.message(
      '加载完成',
      name: 'loaded',
      desc: '',
      args: [],
    );
  }

  /// `没有更多数据`
  String get noMore {
    return Intl.message(
      '没有更多数据',
      name: 'noMore',
      desc: '',
      args: [],
    );
  }

  /// `完成刷新`
  String get completeRefresh {
    return Intl.message(
      '完成刷新',
      name: 'completeRefresh',
      desc: '',
      args: [],
    );
  }

  /// `完成加载`
  String get completeLoad {
    return Intl.message(
      '完成加载',
      name: 'completeLoad',
      desc: '',
      args: [],
    );
  }

  /// `更新于 %T`
  String get updateAt {
    return Intl.message(
      '更新于 %T',
      name: 'updateAt',
      desc: '',
      args: [],
    );
  }

  /// `天`
  String get day {
    return Intl.message(
      '天',
      name: 'day',
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

  /// `home`
  String get tab_home {
    return Intl.message(
      'home',
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

  /// `不符合使用条件`
  String get can_not_use {
    return Intl.message(
      '不符合使用条件',
      name: 'can_not_use',
      desc: '',
      args: [],
    );
  }

  /// `账户不能为空`
  String get not_account {
    return Intl.message(
      '账户不能为空',
      name: 'not_account',
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

  /// `转账成功`
  String get transfer_success {
    return Intl.message(
      '转账成功',
      name: 'transfer_success',
      desc: '',
      args: [],
    );
  }

  /// `转账失败`
  String get transfer_fail {
    return Intl.message(
      '转账失败',
      name: 'transfer_fail',
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

  /// `复制成功`
  String get copy_success {
    return Intl.message(
      '复制成功',
      name: 'copy_success',
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

  /// `转账`
  String get me_item_12 {
    return Intl.message(
      '转账',
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

  /// `我的钱包`
  String get home_wallet {
    return Intl.message(
      '我的钱包',
      name: 'home_wallet',
      desc: '',
      args: [],
    );
  }

  /// `数据监控`
  String get home_monitoring {
    return Intl.message(
      '数据监控',
      name: 'home_monitoring',
      desc: '',
      args: [],
    );
  }

  /// `开心夺宝`
  String get home_treasure {
    return Intl.message(
      '开心夺宝',
      name: 'home_treasure',
      desc: '',
      args: [],
    );
  }

  /// `质押挖矿`
  String get home_mining {
    return Intl.message(
      '质押挖矿',
      name: 'home_mining',
      desc: '',
      args: [],
    );
  }

  /// `明细 >`
  String get home_info {
    return Intl.message(
      '明细 >',
      name: 'home_info',
      desc: '',
      args: [],
    );
  }

  /// `24H封装成本`
  String get home_item_3 {
    return Intl.message(
      '24H封装成本',
      name: 'home_item_3',
      desc: '',
      args: [],
    );
  }

  /// `每32G扇区`
  String get home_item_3_1 {
    return Intl.message(
      '每32G扇区',
      name: 'home_item_3_1',
      desc: '',
      args: [],
    );
  }

  /// `封装扇区总成本`
  String get home_item_3_1_desc {
    return Intl.message(
      '封装扇区总成本',
      name: 'home_item_3_1_desc',
      desc: '',
      args: [],
    );
  }

  /// `每1TB扇区`
  String get home_item_3_2 {
    return Intl.message(
      '每1TB扇区',
      name: 'home_item_3_2',
      desc: '',
      args: [],
    );
  }

  /// `封装扇区质押费`
  String get home_item_3_2_desc {
    return Intl.message(
      '封装扇区质押费',
      name: 'home_item_3_2_desc',
      desc: '',
      args: [],
    );
  }

  /// `每1PB扇区`
  String get home_item_3_3 {
    return Intl.message(
      '每1PB扇区',
      name: 'home_item_3_3',
      desc: '',
      args: [],
    );
  }

  /// `封装扇区Gas费`
  String get home_item_3_3_desc {
    return Intl.message(
      '封装扇区Gas费',
      name: 'home_item_3_3_desc',
      desc: '',
      args: [],
    );
  }

  /// `矿池区块收益`
  String get home_item_4 {
    return Intl.message(
      '矿池区块收益',
      name: 'home_item_4',
      desc: '',
      args: [],
    );
  }

  /// `累计解锁`
  String get home_item_4_1 {
    return Intl.message(
      '累计解锁',
      name: 'home_item_4_1',
      desc: '',
      args: [],
    );
  }

  /// `可提现余额`
  String get home_item_4_2 {
    return Intl.message(
      '可提现余额',
      name: 'home_item_4_2',
      desc: '',
      args: [],
    );
  }

  /// `当前冻结`
  String get home_item_4_3 {
    return Intl.message(
      '当前冻结',
      name: 'home_item_4_3',
      desc: '',
      args: [],
    );
  }

  /// `已提现`
  String get home_item_4_4 {
    return Intl.message(
      '已提现',
      name: 'home_item_4_4',
      desc: '',
      args: [],
    );
  }

  /// `矿池销售概览`
  String get home_item_5 {
    return Intl.message(
      '矿池销售概览',
      name: 'home_item_5',
      desc: '',
      args: [],
    );
  }

  /// `总收入`
  String get home_item_5_1 {
    return Intl.message(
      '总收入',
      name: 'home_item_5_1',
      desc: '',
      args: [],
    );
  }

  /// `可提现余额`
  String get home_item_5_2 {
    return Intl.message(
      '可提现余额',
      name: 'home_item_5_2',
      desc: '',
      args: [],
    );
  }

  /// `今日收入`
  String get home_item_5_3 {
    return Intl.message(
      '今日收入',
      name: 'home_item_5_3',
      desc: '',
      args: [],
    );
  }

  /// `我的有效算力`
  String get home_item_5_4 {
    return Intl.message(
      '我的有效算力',
      name: 'home_item_5_4',
      desc: '',
      args: [],
    );
  }

  /// `团队有效算力`
  String get home_item_5_5 {
    return Intl.message(
      '团队有效算力',
      name: 'home_item_5_5',
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

  /// `兑换`
  String get wallet_exchange_title {
    return Intl.message(
      '兑换',
      name: 'wallet_exchange_title',
      desc: '',
      args: [],
    );
  }

  /// `输入兑出数量`
  String get wallet_exchange_hint {
    return Intl.message(
      '输入兑出数量',
      name: 'wallet_exchange_hint',
      desc: '',
      args: [],
    );
  }

  /// `可用`
  String get wallet_exchange_has {
    return Intl.message(
      '可用',
      name: 'wallet_exchange_has',
      desc: '',
      args: [],
    );
  }

  /// `可兑换`
  String get wallet_exchange_max {
    return Intl.message(
      '可兑换',
      name: 'wallet_exchange_max',
      desc: '',
      args: [],
    );
  }

  /// `兑换记录`
  String get wallet_exchange_record_title {
    return Intl.message(
      '兑换记录',
      name: 'wallet_exchange_record_title',
      desc: '',
      args: [],
    );
  }

  /// `兑出数量`
  String get wallet_exchange_record_item_1 {
    return Intl.message(
      '兑出数量',
      name: 'wallet_exchange_record_item_1',
      desc: '',
      args: [],
    );
  }

  /// `获取CNY`
  String get wallet_exchange_record_item_2 {
    return Intl.message(
      '获取CNY',
      name: 'wallet_exchange_record_item_2',
      desc: '',
      args: [],
    );
  }

  /// `时间`
  String get wallet_exchange_record_item_3 {
    return Intl.message(
      '时间',
      name: 'wallet_exchange_record_item_3',
      desc: '',
      args: [],
    );
  }

  /// `可用`
  String get wallet_info_item_1 {
    return Intl.message(
      '可用',
      name: 'wallet_info_item_1',
      desc: '',
      args: [],
    );
  }

  /// `冻结`
  String get wallet_info_item_2 {
    return Intl.message(
      '冻结',
      name: 'wallet_info_item_2',
      desc: '',
      args: [],
    );
  }

  /// `质押`
  String get wallet_info_item_3 {
    return Intl.message(
      '质押',
      name: 'wallet_info_item_3',
      desc: '',
      args: [],
    );
  }

  /// `今日收益`
  String get wallet_info_item_4 {
    return Intl.message(
      '今日收益',
      name: 'wallet_info_item_4',
      desc: '',
      args: [],
    );
  }

  /// `可用流水`
  String get wallet_info_water_1 {
    return Intl.message(
      '可用流水',
      name: 'wallet_info_water_1',
      desc: '',
      args: [],
    );
  }

  /// `冻结流水`
  String get wallet_info_water_2 {
    return Intl.message(
      '冻结流水',
      name: 'wallet_info_water_2',
      desc: '',
      args: [],
    );
  }

  /// `质押流水`
  String get wallet_info_water_3 {
    return Intl.message(
      '质押流水',
      name: 'wallet_info_water_3',
      desc: '',
      args: [],
    );
  }

  /// `充币`
  String get wallet_info_btn_1 {
    return Intl.message(
      '充币',
      name: 'wallet_info_btn_1',
      desc: '',
      args: [],
    );
  }

  /// `提币`
  String get wallet_info_btn_2 {
    return Intl.message(
      '提币',
      name: 'wallet_info_btn_2',
      desc: '',
      args: [],
    );
  }

  /// `转账`
  String get wallet_info_btn_3 {
    return Intl.message(
      '转账',
      name: 'wallet_info_btn_3',
      desc: '',
      args: [],
    );
  }

  /// `转账`
  String get transfer_title {
    return Intl.message(
      '转账',
      name: 'transfer_title',
      desc: '',
      args: [],
    );
  }

  /// `内网转出`
  String get transfer_item_1 {
    return Intl.message(
      '内网转出',
      name: 'transfer_item_1',
      desc: '',
      args: [],
    );
  }

  /// `内网收账`
  String get transfer_item_2 {
    return Intl.message(
      '内网收账',
      name: 'transfer_item_2',
      desc: '',
      args: [],
    );
  }

  /// `对方账号`
  String get transfer_out_item_1 {
    return Intl.message(
      '对方账号',
      name: 'transfer_out_item_1',
      desc: '',
      args: [],
    );
  }

  /// `对方昵称`
  String get transfer_out_item_2 {
    return Intl.message(
      '对方昵称',
      name: 'transfer_out_item_2',
      desc: '',
      args: [],
    );
  }

  /// `转账数量`
  String get transfer_out_item_3 {
    return Intl.message(
      '转账数量',
      name: 'transfer_out_item_3',
      desc: '',
      args: [],
    );
  }

  /// `手续费`
  String get transfer_out_item_4 {
    return Intl.message(
      '手续费',
      name: 'transfer_out_item_4',
      desc: '',
      args: [],
    );
  }

  /// `手机验证`
  String get transfer_out_item_5 {
    return Intl.message(
      '手机验证',
      name: 'transfer_out_item_5',
      desc: '',
      args: [],
    );
  }

  /// `备注`
  String get transfer_out_item_6 {
    return Intl.message(
      '备注',
      name: 'transfer_out_item_6',
      desc: '',
      args: [],
    );
  }

  /// `请输入`
  String get transfer_out_item_1_hint {
    return Intl.message(
      '请输入',
      name: 'transfer_out_item_1_hint',
      desc: '',
      args: [],
    );
  }

  /// `内网转出对方昵称`
  String get transfer_out_item_2_hint {
    return Intl.message(
      '内网转出对方昵称',
      name: 'transfer_out_item_2_hint',
      desc: '',
      args: [],
    );
  }

  /// `请输入转账数量`
  String get transfer_out_item_3_hint {
    return Intl.message(
      '请输入转账数量',
      name: 'transfer_out_item_3_hint',
      desc: '',
      args: [],
    );
  }

  /// `手续费`
  String get transfer_out_item_4_hint {
    return Intl.message(
      '手续费',
      name: 'transfer_out_item_4_hint',
      desc: '',
      args: [],
    );
  }

  /// `请输入验证码`
  String get transfer_out_item_5_hint {
    return Intl.message(
      '请输入验证码',
      name: 'transfer_out_item_5_hint',
      desc: '',
      args: [],
    );
  }

  /// `可选填`
  String get transfer_out_item_6_hint {
    return Intl.message(
      '可选填',
      name: 'transfer_out_item_6_hint',
      desc: '',
      args: [],
    );
  }

  /// `收款账户`
  String get transfer_out_item_in_account {
    return Intl.message(
      '收款账户',
      name: 'transfer_out_item_in_account',
      desc: '',
      args: [],
    );
  }

  /// `收款账户二维码`
  String get transfer_out_item_in_qrcode {
    return Intl.message(
      '收款账户二维码',
      name: 'transfer_out_item_in_qrcode',
      desc: '',
      args: [],
    );
  }

  /// `转账记录`
  String get transfer_record_title {
    return Intl.message(
      '转账记录',
      name: 'transfer_record_title',
      desc: '',
      args: [],
    );
  }

  /// `转账人`
  String get transfer_record_out {
    return Intl.message(
      '转账人',
      name: 'transfer_record_out',
      desc: '',
      args: [],
    );
  }

  /// `收款人`
  String get transfer_record_in {
    return Intl.message(
      '收款人',
      name: 'transfer_record_in',
      desc: '',
      args: [],
    );
  }

  /// `推荐`
  String get market_item_recommend {
    return Intl.message(
      '推荐',
      name: 'market_item_recommend',
      desc: '',
      args: [],
    );
  }

  /// `单价`
  String get market_item_1 {
    return Intl.message(
      '单价',
      name: 'market_item_1',
      desc: '',
      args: [],
    );
  }

  /// `区域节点`
  String get market_item_2 {
    return Intl.message(
      '区域节点',
      name: 'market_item_2',
      desc: '',
      args: [],
    );
  }

  /// `合同周期`
  String get market_item_3 {
    return Intl.message(
      '合同周期',
      name: 'market_item_3',
      desc: '',
      args: [],
    );
  }

  /// `标配容量`
  String get market_item_4 {
    return Intl.message(
      '标配容量',
      name: 'market_item_4',
      desc: '',
      args: [],
    );
  }

  /// `已售`
  String get market_item_5 {
    return Intl.message(
      '已售',
      name: 'market_item_5',
      desc: '',
      args: [],
    );
  }

  /// `份`
  String get market_item_6 {
    return Intl.message(
      '份',
      name: 'market_item_6',
      desc: '',
      args: [],
    );
  }

  /// `立即购买`
  String get market_item_buy {
    return Intl.message(
      '立即购买',
      name: 'market_item_buy',
      desc: '',
      args: [],
    );
  }

  /// `服务器详情`
  String get market_info_title {
    return Intl.message(
      '服务器详情',
      name: 'market_info_title',
      desc: '',
      args: [],
    );
  }

  /// `购买须知`
  String get market_info_know {
    return Intl.message(
      '购买须知',
      name: 'market_info_know',
      desc: '',
      args: [],
    );
  }

  /// `风险提醒`
  String get market_info_warring {
    return Intl.message(
      '风险提醒',
      name: 'market_info_warring',
      desc: '',
      args: [],
    );
  }

  /// `1.市场价格波动或挖矿难度调整都可能导致合约的产出变动,无论从数字资产还是法币角度,本产品不对合约产出作出任何承诺,因挖矿难度、市场价值波动等因素,导致产出的数字资产价值变动,有用户自行承担.合约发行方对本条款保留所以解释权;\n2.本合同不涉及数字资产交易,若用户自行参加第三方的数字资产交易,应当自行承担责任和风险;\n3.用户理解并同意，如发生合同订立时不能预见、不能避免且不能克服的客观情况而导致合同无法继续履行,本合同自动终止,合同各方互不承担责任,由此造成的损失须各方自行承担,用户已支付的费用不予退还.`
  String get market_info_notice {
    return Intl.message(
      '1.市场价格波动或挖矿难度调整都可能导致合约的产出变动,无论从数字资产还是法币角度,本产品不对合约产出作出任何承诺,因挖矿难度、市场价值波动等因素,导致产出的数字资产价值变动,有用户自行承担.合约发行方对本条款保留所以解释权;\n2.本合同不涉及数字资产交易,若用户自行参加第三方的数字资产交易,应当自行承担责任和风险;\n3.用户理解并同意，如发生合同订立时不能预见、不能避免且不能克服的客观情况而导致合同无法继续履行,本合同自动终止,合同各方互不承担责任,由此造成的损失须各方自行承担,用户已支付的费用不予退还.',
      name: 'market_info_notice',
      desc: '',
      args: [],
    );
  }

  /// `购买服务器`
  String get market_buy_title {
    return Intl.message(
      '购买服务器',
      name: 'market_buy_title',
      desc: '',
      args: [],
    );
  }

  /// `购买数量`
  String get market_buy_num {
    return Intl.message(
      '购买数量',
      name: 'market_buy_num',
      desc: '',
      args: [],
    );
  }

  /// `优惠券`
  String get market_buy_coupons {
    return Intl.message(
      '优惠券',
      name: 'market_buy_coupons',
      desc: '',
      args: [],
    );
  }

  /// `选择优惠券`
  String get market_buy_coupons_hint {
    return Intl.message(
      '选择优惠券',
      name: 'market_buy_coupons_hint',
      desc: '',
      args: [],
    );
  }

  /// `合计 :`
  String get market_buy_total {
    return Intl.message(
      '合计 :',
      name: 'market_buy_total',
      desc: '',
      args: [],
    );
  }

  /// `《服务器购买协议》`
  String get market_buy_desc_more {
    return Intl.message(
      '《服务器购买协议》',
      name: 'market_buy_desc_more',
      desc: '',
      args: [],
    );
  }

  /// `《服务器升级协议》`
  String get market_update_desc_more {
    return Intl.message(
      '《服务器升级协议》',
      name: 'market_update_desc_more',
      desc: '',
      args: [],
    );
  }

  /// `《服务器托管协议》`
  String get market_hostings_desc_more {
    return Intl.message(
      '《服务器托管协议》',
      name: 'market_hostings_desc_more',
      desc: '',
      args: [],
    );
  }

  /// `输入数字支付密码`
  String get password_dialog_title {
    return Intl.message(
      '输入数字支付密码',
      name: 'password_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `设置密码`
  String get paddword_dailog_forget {
    return Intl.message(
      '设置密码',
      name: 'paddword_dailog_forget',
      desc: '',
      args: [],
    );
  }

  /// `优惠券`
  String get market_coupons_title {
    return Intl.message(
      '优惠券',
      name: 'market_coupons_title',
      desc: '',
      args: [],
    );
  }

  /// `未使用`
  String get market_coupons_item_1 {
    return Intl.message(
      '未使用',
      name: 'market_coupons_item_1',
      desc: '',
      args: [],
    );
  }

  /// `已使用`
  String get market_coupons_item_2 {
    return Intl.message(
      '已使用',
      name: 'market_coupons_item_2',
      desc: '',
      args: [],
    );
  }

  /// `已过期`
  String get market_coupons_item_3 {
    return Intl.message(
      '已过期',
      name: 'market_coupons_item_3',
      desc: '',
      args: [],
    );
  }

  /// `使用条件`
  String get market_coupons_about {
    return Intl.message(
      '使用条件',
      name: 'market_coupons_about',
      desc: '',
      args: [],
    );
  }

  /// `有效期至`
  String get market_coupons_time {
    return Intl.message(
      '有效期至',
      name: 'market_coupons_time',
      desc: '',
      args: [],
    );
  }

  /// `购买成功`
  String get market_end_title {
    return Intl.message(
      '购买成功',
      name: 'market_end_title',
      desc: '',
      args: [],
    );
  }

  /// `购买成功`
  String get market_end_desc {
    return Intl.message(
      '购买成功',
      name: 'market_end_desc',
      desc: '',
      args: [],
    );
  }

  /// `我的服务器`
  String get market_end_signed {
    return Intl.message(
      '我的服务器',
      name: 'market_end_signed',
      desc: '',
      args: [],
    );
  }

  /// `在线数量`
  String get machine_item_1 {
    return Intl.message(
      '在线数量',
      name: 'machine_item_1',
      desc: '',
      args: [],
    );
  }

  /// `矿机数量`
  String get machine_item_2 {
    return Intl.message(
      '矿机数量',
      name: 'machine_item_2',
      desc: '',
      args: [],
    );
  }

  /// `当前算力`
  String get machine_item_3 {
    return Intl.message(
      '当前算力',
      name: 'machine_item_3',
      desc: '',
      args: [],
    );
  }

  /// `有效容量`
  String get machine_item_4 {
    return Intl.message(
      '有效容量',
      name: 'machine_item_4',
      desc: '',
      args: [],
    );
  }

  /// `今日产币`
  String get machine_item_5 {
    return Intl.message(
      '今日产币',
      name: 'machine_item_5',
      desc: '',
      args: [],
    );
  }

  /// `累计产币`
  String get machine_item_6 {
    return Intl.message(
      '累计产币',
      name: 'machine_item_6',
      desc: '',
      args: [],
    );
  }

  /// `查看收益`
  String get machine_item_7 {
    return Intl.message(
      '查看收益',
      name: 'machine_item_7',
      desc: '',
      args: [],
    );
  }

  /// `购买服务器`
  String get machine_item_8 {
    return Intl.message(
      '购买服务器',
      name: 'machine_item_8',
      desc: '',
      args: [],
    );
  }

  /// `在线`
  String get machine_list_online {
    return Intl.message(
      '在线',
      name: 'machine_list_online',
      desc: '',
      args: [],
    );
  }

  /// `离线`
  String get machine_list_offline {
    return Intl.message(
      '离线',
      name: 'machine_list_offline',
      desc: '',
      args: [],
    );
  }

  /// `有效容量`
  String get machine_list_1 {
    return Intl.message(
      '有效容量',
      name: 'machine_list_1',
      desc: '',
      args: [],
    );
  }

  /// `当前算力`
  String get machine_list_2 {
    return Intl.message(
      '当前算力',
      name: 'machine_list_2',
      desc: '',
      args: [],
    );
  }

  /// `当前质押`
  String get machine_list_3 {
    return Intl.message(
      '当前质押',
      name: 'machine_list_3',
      desc: '',
      args: [],
    );
  }

  /// `到期时间`
  String get machine_list_4 {
    return Intl.message(
      '到期时间',
      name: 'machine_list_4',
      desc: '',
      args: [],
    );
  }

  /// `台`
  String get machine_tai {
    return Intl.message(
      '台',
      name: 'machine_tai',
      desc: '',
      args: [],
    );
  }

  /// `服务器详情`
  String get machine_info_title {
    return Intl.message(
      '服务器详情',
      name: 'machine_info_title',
      desc: '',
      args: [],
    );
  }

  /// `服务器编号`
  String get machine_info_1 {
    return Intl.message(
      '服务器编号',
      name: 'machine_info_1',
      desc: '',
      args: [],
    );
  }

  /// `设备状态`
  String get machine_info_2 {
    return Intl.message(
      '设备状态',
      name: 'machine_info_2',
      desc: '',
      args: [],
    );
  }

  /// `购买日期`
  String get machine_info_3 {
    return Intl.message(
      '购买日期',
      name: 'machine_info_3',
      desc: '',
      args: [],
    );
  }

  /// `上线时间`
  String get machine_info_4 {
    return Intl.message(
      '上线时间',
      name: 'machine_info_4',
      desc: '',
      args: [],
    );
  }

  /// `托管到期`
  String get machine_info_5 {
    return Intl.message(
      '托管到期',
      name: 'machine_info_5',
      desc: '',
      args: [],
    );
  }

  /// `设备型号`
  String get machine_info_6 {
    return Intl.message(
      '设备型号',
      name: 'machine_info_6',
      desc: '',
      args: [],
    );
  }

  /// `所属区域`
  String get machine_info_7 {
    return Intl.message(
      '所属区域',
      name: 'machine_info_7',
      desc: '',
      args: [],
    );
  }

  /// `当前算力`
  String get machine_info_8 {
    return Intl.message(
      '当前算力',
      name: 'machine_info_8',
      desc: '',
      args: [],
    );
  }

  /// `存储容量`
  String get machine_info_9 {
    return Intl.message(
      '存储容量',
      name: 'machine_info_9',
      desc: '',
      args: [],
    );
  }

  /// `有效容量`
  String get machine_info_10 {
    return Intl.message(
      '有效容量',
      name: 'machine_info_10',
      desc: '',
      args: [],
    );
  }

  /// `设备编号`
  String get machine_info_11 {
    return Intl.message(
      '设备编号',
      name: 'machine_info_11',
      desc: '',
      args: [],
    );
  }

  /// `已生产量`
  String get machine_info_12 {
    return Intl.message(
      '已生产量',
      name: 'machine_info_12',
      desc: '',
      args: [],
    );
  }

  /// `质押费`
  String get machine_info_13 {
    return Intl.message(
      '质押费',
      name: 'machine_info_13',
      desc: '',
      args: [],
    );
  }

  /// `GAS费`
  String get machine_info_14 {
    return Intl.message(
      'GAS费',
      name: 'machine_info_14',
      desc: '',
      args: [],
    );
  }

  /// `托管`
  String get machine_info_btn_1 {
    return Intl.message(
      '托管',
      name: 'machine_info_btn_1',
      desc: '',
      args: [],
    );
  }

  /// `升级`
  String get machine_info_btn_2 {
    return Intl.message(
      '升级',
      name: 'machine_info_btn_2',
      desc: '',
      args: [],
    );
  }

  /// `质押`
  String get machine_info_btn_3 {
    return Intl.message(
      '质押',
      name: 'machine_info_btn_3',
      desc: '',
      args: [],
    );
  }

  /// `区块收益`
  String get machine_total_title {
    return Intl.message(
      '区块收益',
      name: 'machine_total_title',
      desc: '',
      args: [],
    );
  }

  /// `区块总收益 (FIL)`
  String get machine_total_1 {
    return Intl.message(
      '区块总收益 (FIL)',
      name: 'machine_total_1',
      desc: '',
      args: [],
    );
  }

  /// `累计解锁`
  String get machine_total_2 {
    return Intl.message(
      '累计解锁',
      name: 'machine_total_2',
      desc: '',
      args: [],
    );
  }

  /// `当前冻结`
  String get machine_total_3 {
    return Intl.message(
      '当前冻结',
      name: 'machine_total_3',
      desc: '',
      args: [],
    );
  }

  /// `月收益`
  String get machine_total_4 {
    return Intl.message(
      '月收益',
      name: 'machine_total_4',
      desc: '',
      args: [],
    );
  }

  /// `区块收益 (FIL)`
  String get machine_total_list_1 {
    return Intl.message(
      '区块收益 (FIL)',
      name: 'machine_total_list_1',
      desc: '',
      args: [],
    );
  }

  /// `立即释放 25%`
  String get machine_total_list_2 {
    return Intl.message(
      '立即释放 25%',
      name: 'machine_total_list_2',
      desc: '',
      args: [],
    );
  }

  /// `线性释放`
  String get machine_total_list_3 {
    return Intl.message(
      '线性释放',
      name: 'machine_total_list_3',
      desc: '',
      args: [],
    );
  }

  /// `服务器收益`
  String get machine_earnings_title {
    return Intl.message(
      '服务器收益',
      name: 'machine_earnings_title',
      desc: '',
      args: [],
    );
  }

  /// `今日收益`
  String get machine_earnings_today {
    return Intl.message(
      '今日收益',
      name: 'machine_earnings_today',
      desc: '',
      args: [],
    );
  }

  /// `立即释放`
  String get machine_earnings_atonce {
    return Intl.message(
      '立即释放',
      name: 'machine_earnings_atonce',
      desc: '',
      args: [],
    );
  }

  /// `线性释放`
  String get machine_earnings_linear {
    return Intl.message(
      '线性释放',
      name: 'machine_earnings_linear',
      desc: '',
      args: [],
    );
  }

  /// `服务器ID`
  String get machine_earnings_item_1 {
    return Intl.message(
      '服务器ID',
      name: 'machine_earnings_item_1',
      desc: '',
      args: [],
    );
  }

  /// `产币收益`
  String get machine_earnings_item_2 {
    return Intl.message(
      '产币收益',
      name: 'machine_earnings_item_2',
      desc: '',
      args: [],
    );
  }

  /// `立即释放 25%`
  String get machine_earnings_item_3 {
    return Intl.message(
      '立即释放 25%',
      name: 'machine_earnings_item_3',
      desc: '',
      args: [],
    );
  }

  /// `线性释放 180天`
  String get machine_earnings_item_4 {
    return Intl.message(
      '线性释放 180天',
      name: 'machine_earnings_item_4',
      desc: '',
      args: [],
    );
  }

  /// `自选`
  String get quote_item_1 {
    return Intl.message(
      '自选',
      name: 'quote_item_1',
      desc: '',
      args: [],
    );
  }

  /// `市值`
  String get quote_item_2 {
    return Intl.message(
      '市值',
      name: 'quote_item_2',
      desc: '',
      args: [],
    );
  }

  /// `热搜`
  String get quote_item_3 {
    return Intl.message(
      '热搜',
      name: 'quote_item_3',
      desc: '',
      args: [],
    );
  }

  /// `排行榜`
  String get quote_item_4 {
    return Intl.message(
      '排行榜',
      name: 'quote_item_4',
      desc: '',
      args: [],
    );
  }

  /// `币种`
  String get quote_type {
    return Intl.message(
      '币种',
      name: 'quote_type',
      desc: '',
      args: [],
    );
  }

  /// `价格`
  String get quote_price {
    return Intl.message(
      '价格',
      name: 'quote_price',
      desc: '',
      args: [],
    );
  }

  /// `涨幅`
  String get quote_gains {
    return Intl.message(
      '涨幅',
      name: 'quote_gains',
      desc: '',
      args: [],
    );
  }

  /// `价格/CNY`
  String get quote_price_cny {
    return Intl.message(
      '价格/CNY',
      name: 'quote_price_cny',
      desc: '',
      args: [],
    );
  }

  /// `今日涨幅`
  String get quote_gains_today {
    return Intl.message(
      '今日涨幅',
      name: 'quote_gains_today',
      desc: '',
      args: [],
    );
  }

  /// `请输入搜索内容`
  String get quote_search_hint {
    return Intl.message(
      '请输入搜索内容',
      name: 'quote_search_hint',
      desc: '',
      args: [],
    );
  }

  /// `热门搜索`
  String get quote_search_recomend {
    return Intl.message(
      '热门搜索',
      name: 'quote_search_recomend',
      desc: '',
      args: [],
    );
  }

  /// `搜索历史`
  String get quote_search_history {
    return Intl.message(
      '搜索历史',
      name: 'quote_search_history',
      desc: '',
      args: [],
    );
  }

  /// `清空历史`
  String get quote_search_clean {
    return Intl.message(
      '清空历史',
      name: 'quote_search_clean',
      desc: '',
      args: [],
    );
  }

  /// `我的粉丝`
  String get fans_title {
    return Intl.message(
      '我的粉丝',
      name: 'fans_title',
      desc: '',
      args: [],
    );
  }

  /// `直推业绩`
  String get fans_item_1 {
    return Intl.message(
      '直推业绩',
      name: 'fans_item_1',
      desc: '',
      args: [],
    );
  }

  /// `总业绩`
  String get fans_item_2 {
    return Intl.message(
      '总业绩',
      name: 'fans_item_2',
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

  /// `设置支付密码`
  String get setting_change_pay_pwd {
    return Intl.message(
      '设置支付密码',
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

  /// `设置支付密码`
  String get pwd_pay_title {
    return Intl.message(
      '设置支付密码',
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
