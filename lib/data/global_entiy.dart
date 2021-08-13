

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ipfsnets/generated/l10n.dart';
import 'package:ipfsnets/models/acount_entiy.dart';
import 'package:ipfsnets/models/acount_entiy2.dart';
import 'package:ipfsnets/models/cny_record_entiy.dart';
import 'package:ipfsnets/models/news_model.dart';
import 'package:ipfsnets/models/wallet_entiy.dart';
import 'package:ipfsnets/routes/application.dart';

import '../include.dart';
import '../r.dart';

class GlobalEntiy{
  // 注册协议
  static String web_reigster = "http://124.16.8.140:84/register-protocol";
  // 服务器购买协议
  static String web_market_buy = "http://124.16.8.140:84/purchase-protocol";
  // 服务器托管协议
  static String web_machine_hosting = "http://124.16.8.140:84/deposit-protocol";
  // 服务器升级协议
  static String web_machine_updete = "http://124.16.8.140:84/upgrade-protocol";
  // 推广二维码
  static String web_qrcode = "http://124.16.8.140:84/promo?code=";
  // 我的客服
  static String web_my_server= "http://chat.ahcdialogchat.com/chat/h5/chatLink.html?channelId=1NfXw7";


  static Future init(VoidCallback callback) async {
    // await SpUtil.getInstance();
    Routes.configureRoutes();
    Application.router = Routes.router;
    EasyLoading.init();
    callback();

  }

  // 多语言
  static String LANGUAGE_KEY = "language_key";
  static String LANGUAGE_ZH = "zh";
  static String LANGUAGE_EN = "en";

  // 用户名最大输入
  static int PHONE_MAX_INPUT = 32;
  // 密码最大输入
  static int PWD_MAX_INPUT = 16;
  // 密码最小输入
  static int PWD_MIN_INPUT = 6;
  static int MONEY_MAX_INPUT = 20;
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction  = false;

  static bool isDriverTest  = false;
  static bool isUnitTest  = false;

  static const String DATA = 'data';
  static const String MSG = 'msg';
  static const String CODE = 'code';

  static const String keyGuide = 'keyGuide';
  static const String phone = 'phone';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';

  static const String theme = 'AppTheme';
  static const String locale = 'locale';

  //修改密码相关
  static const String PASSWORD_ACCOUNT = '1';
  static const String PASSWORD_CHANGE = '2';
  static const String PASSWORD_APLAY = '3';

  // 我的订单
  static  List<String> ORDER_TITLE = [S.current.me_item_1, S.current.me_item_2, S.current.me_item_3,S.current.me_item_4];
  static  List<String> ORDER_IMAGE = [R.assetsImgMeItem1, R.assetsImgMeItem2, R.assetsImgMeItem3, R.assetsImgMeItem4];
  // 财富生活
  static  List<String> LIFE_TITLE = [S.current.me_item_5, S.current.me_item_6, S.current.me_item_7,S.current.me_item_8];
  static  List<String> LIFE_IMAGE = [R.assetsImgMeItem5, R.assetsImgMeItem6, R.assetsImgMeItem7, R.assetsImgMeItem8];
  // 财富生活
  static  List<String> SERVER_TITLE = [S.current.me_item_9,  S.current.me_item_11,
    S.current.me_item_12,S.current.me_item_14,
    S.current.me_item_15,S.current.me_item_17,
    S.current.me_item_18,S.current.me_item_19];
  static  List<String> SERVER_IMAGE = [R.assetsImgMeItem9, R.assetsImgMeItem11,
    R.assetsImgMeItem12, R.assetsImgMeItem14,
    R.assetsImgMeItem15, R.assetsImgMeItem17,
    R.assetsImgMeItem18,R.assetsImgMeItem19];

  // 更多应用

  static  List<String> MORE_TITLE_1 = [S.current.more_item_1, S.current.more_item_2, S.current.more_item_3,S.current.more_item_4,
    S.current.more_item_5, S.current.more_item_6];
  static  List<String> MORE_TITLE_2 = [S.current.more_item_7, S.current.more_item_8, S.current.more_item_9,S.current.more_item_10,
    S.current.more_item_11];
  static  List<String> MORE_TITLE_3 = [S.current.more_item_12, S.current.more_item_13, S.current.more_item_14];
  // S.current.more_item_7,S.current.more_item_9,
  //   S.current.more_item_9, S.current.more_item_10, S.current.more_item_11,S.current.more_item_12,
  //   S.current.more_item_13, S.current.more_item_14];

  static  List<String> MORE_IMAGE_1 = [R.assetsImgMoreItem1, R.assetsImgMoreItem2, R.assetsImgMoreItem3, R.assetsImgMoreItem4,
    R.assetsImgMoreItem5, R.assetsImgMoreItem6 ];
  static  List<String> MORE_IMAGE_2 = [R.assetsImgMoreItem1, R.assetsImgMoreItem8, R.assetsImgMoreItem9, R.assetsImgMoreItem10,
    R.assetsImgMoreItem11];
  static  List<String> MORE_IMAGE_3 = [R.assetsImgMoreItem12, R.assetsImgMoreItem13, R.assetsImgMoreItem14];

  static List<NewsModel> newsList = [
    NewsModel(
        "中方将派军舰赴马六甲海峡护航本国船只？外交部：那是谣言', 环球网",
        "111",
        "https://p3.pstatp.com/list/190x124/pgc-image/RGSD09itseweQ",
        "2021-1-1"),
    NewsModel('211高校被误认野鸡大学发怒，名气还没“野鸡”大', '中国新闻周刊',
        'https://p1.pstatp.com/list/190x124/pgc-image/7026a3edfe2b47f59eea94f2b8cd86a4',"2021-1-1"),
    NewsModel(
        '广西矿王黎东明去世：瞒报81死矿难，把记者逼到悬崖边，遭售货员白眼后买下整柜台皮鞋',
        '大河看法',
        'https://p1.pstatp.com/list/190x124/pgc-image/c14366a3b7ab4a3384e3485697d103fe',
        "2021-1-1"),
    NewsModel(
        '六旬父亲“为儿追凶”16年：“赔多少钱都不要，就要他偿命”',
        '中国新闻周刊',
        'https://p3.pstatp.com/list/190x124/pgc-image/c55f17d3a3ac4efe8eaedafdab111079',
        "2021-1-1"),
    NewsModel(
        '五问玛莎拉蒂追尾案：肇事女孩有何背景？或面临死刑？',
        '环球网',
        'https://p1.pstatp.com/list/190x124/pgc-image/RVi866A4f9cVK2',
        "2021-1-1"),
    NewsModel(
        '李若彤：当年为爱作出任性选择，如今看来都是最好的安排',
        '新京报',
        'https://p3.pstatp.com/list/190x124/pgc-image/RVLwKBq5IQMvCW',
        "2021-1-1"),
    NewsModel(
        '好惨一首都！“史诗级”暴雨把华盛顿淹成了……这个样子',
        '环球网',
        'https://p1.pstatp.com/list/190x124/pgc-image/RVic5NyDDeVAi0',
        "2021-1-1"),
    NewsModel(
        '原子弹爆炸半衰期动不动几万年，为何广岛和长崎现在就能居住了？',
        '怪罗科普',
        'https://p1.pstatp.com/list/190x124/pgc-image/317a92302937426c999ea9a5b52121b1',
        "2021-1-1"),
    NewsModel(
        '马超和关羽到底谁强？古书记载颠覆历史，学者：根本不是一个级别',
        '田君良',
        'https://p3.pstatp.com/list/190x124/pgc-image/470fb21c5c884b119116179813b82d2b',
        "2021-1-1")
  ];

  static List<CnyRecordEntiy> cnyList = [
    CnyRecordEntiy("兑换现金",7.1,"03-24 12:24"),
    CnyRecordEntiy("兑换商品",-400,"03-24 12:24"),
    CnyRecordEntiy("兑换现金",-20.12,"03-24 12:24"),
    CnyRecordEntiy("充值",711.1,"03-24 12:24"),
    CnyRecordEntiy("兑换现金",28,"03-24 12:24"),
  ];

  static List<WalletEntiy> walletList = [
    WalletEntiy(R.assetsImgMyWalletNets,"NETS","0","=0 CNY"),
    WalletEntiy(R.assetsImgMyWalletFil,"FIL","0","=0 CNY"),
    WalletEntiy(R.assetsImgMyWalletUsdt,"USDT","0","=0 CNY"),
    WalletEntiy(R.assetsImgMyWalletBtc,"BTC","0","=0 CNY"),
    WalletEntiy(R.assetsImgMyWalletEth,"ETH","0","=0 CNY"),
    WalletEntiy(R.assetsImgMyWalletEos,"EOS","0","=0 CNY"),
  ];

  static List<AccountEntiy2> accountList2 = [
    AccountEntiy2(R.assetsImgIconAlipay,"1",false,0),
    AccountEntiy2(R.assetsImgIconBank,"2",false,0),
    AccountEntiy2(R.assetsImgIconBank,"3",false,0),
    AccountEntiy2(R.assetsImgIconBank,"4",false,0),
    AccountEntiy2(R.assetsImgIconAlipay,"5",false,0),
    AccountEntiy2(R.assetsImgIconBank,"6",false,0),
    AccountEntiy2(R.assetsImgIconBank,"7",false,0),
    AccountEntiy2(R.assetsImgIconBank,"8",false,0),
    AccountEntiy2(R.assetsImgIconAlipay,"9",false,0),
    AccountEntiy2(R.assetsImgIconBank,"10",false,0),
    AccountEntiy2(R.assetsImgIconBank,"11",false,0),
    AccountEntiy2(R.assetsImgIconBank,"12",false,1),
  ];

  static List<AccountEntiy3> accountList3 = [
    AccountEntiy3(R.assetsImgMyWalletNets,"NETS","100",false,0),
    AccountEntiy3(R.assetsImgMyWalletFil,"FIL","200",false,0),
    AccountEntiy3(R.assetsImgMyWalletUsdt,"USDT","300",false,0),
    AccountEntiy3(R.assetsImgMyWalletBtc,"BTC","400",false,0),
    AccountEntiy3(R.assetsImgMyWalletEth,"ETH","500",false,0),
    AccountEntiy3(R.assetsImgMyWalletEos,"EOS","600",false,0),
  ];

  // 货币通讯录  相关操作
  static final int ADDRESS_SEL = 1;
  static final int ADDRESS_DEL = 2;
  static final int ADDRESS_EDIT = 3;
  static final int ADDRESS_ADD = 4;


  static List<String> recomend = [
    "NETS",
    "FIL",
    "BTC",
    "ETH",
    "EOS",
    "VET",
    "ADA",
    "BCD",
    "LINK",
    "DOGE",
    "AOFEX",
    "TEP",
    "DOT",
    "BRC",
    "BTM",
    "ATOM",
  ];

  static List<String> history = [];
}