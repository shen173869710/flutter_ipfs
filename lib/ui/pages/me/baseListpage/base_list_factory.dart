
import 'package:ipfsnets/models/rechage_record_model.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/ui/pages/me/baseListpage/base_list_item.dart';
import 'package:ipfsnets/ui/pages/me/cny/cny_rechage_record_item.dart';
import 'package:ipfsnets/ui/pages/me/wallet/wallet_recharge_record_item.dart';

class BaseListFactory{

  // 钱包提现记录
  static String WALLET_RECHARGE_RECORD = "walletRechargeRecord";
  // 钱包充币记录
  static String WALLET_WITHDRAWAL_RECORD = "walletWithDRAWALRecord";

  static List<RechageRecordModel> newsList = [
    RechageRecordModel(
        "充值金额:100",
        "111",
        "https://p3.pstatp.com/list/190x124/pgc-image/RGSD09itseweQ",
        "2021-1-1",1),
    RechageRecordModel('充值金额:100','11',
        'https://p1.pstatp.com/list/190x124/pgc-image/7026a3edfe2b47f59eea94f2b8cd86a4',"2021-1-1",1),
    RechageRecordModel(
        '充值金额:100',
        '大河看法',
        'https://p1.pstatp.com/list/190x124/pgc-image/c14366a3b7ab4a3384e3485697d103fe',
        "2021-1-1",0),
    RechageRecordModel(
        '充值金额:100',
        '中国新闻周刊',
        'https://p3.pstatp.com/list/190x124/pgc-image/c55f17d3a3ac4efe8eaedafdab111079',
        "2021-1-1",0),
    RechageRecordModel(
        '充值金额:100',
        '环球网',
        'https://p1.pstatp.com/list/190x124/pgc-image/RVi866A4f9cVK2',
        "2021-1-1",0),
    RechageRecordModel(
        '充值金额:100',
        '新京报',
        'https://p3.pstatp.com/list/190x124/pgc-image/RVLwKBq5IQMvCW',
        "2021-1-1",1),
    RechageRecordModel(
        '充值金额:100',
        '环球网',
        'https://p1.pstatp.com/list/190x124/pgc-image/RVic5NyDDeVAi0',
        "2021-1-1",1),
    RechageRecordModel(
        '充值金额:100',
        '怪罗科普',
        'https://p1.pstatp.com/list/190x124/pgc-image/317a92302937426c999ea9a5b52121b1',
        "2021-1-1",1),
    RechageRecordModel(
        '充值金额:100',
        '田君良',
        'https://p3.pstatp.com/list/190x124/pgc-image/470fb21c5c884b119116179813b82d2b',
        "2021-1-1",0)
  ];

  // 获取list页面的标题
  static getListTitle(String type) {
    if(type == WALLET_RECHARGE_RECORD) {
      return S.current.wallet_withdraw_record_title;
    }else if (type == WALLET_RECHARGE_RECORD) {
      return S.current.wallet_recharge_record_title;
    }
  }

  /**
   *   获取列表数量的数据源
   */
  static getListItemData(String type) {
    return newsList;
  }


  static Widget getListItem(String type, int intex){
    if(type == WALLET_RECHARGE_RECORD) {
      return WalleRchargeRecordItem(getListItemData(type)[intex]);
    }
    return WalleRchargeRecordItem(getListItemData(type)[intex]);
  }

}