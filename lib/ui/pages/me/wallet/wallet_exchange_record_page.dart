import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/http/wallet_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/wallet_withdrawal_record_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/me/wallet/wallet_withdrawal_record_item.dart';
import 'package:ipfsnets/ui/widget/base_list_page.dart';



class WalletExchangeRecordPage extends StatefulWidget {
  @override
  _WalletExchangeRecordState createState() => _WalletExchangeRecordState();
}

class _WalletExchangeRecordState extends BaseListPageState<WalletExchangeRecordPage> {
  List<WalletWithdrawalRecordEntity> list = [];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colours.bg_color,
        appBar: AppBar(
          title: new Text(S.current.wallet_exchange_record_title),
          centerTitle: true,
          backgroundColor: Colours.app_bar_bg,
        ),
        body: buildRefreshView(context)
    );
  }

  @override
  Widget setListView(int index) {
    return WalletWithdrawalRecordItem(list[index]);
  }

  @override
  void onItemClick(BuildContext context, int index) {
    // TODO: implement onItemClick
  }

  @override
  int getListLength() {
    return 30;
  }

  @override
  Future<BaseEntity> getData() async {
    BaseEntity baseEntity  = await WalletApi.getWithdrawalRecordList(page);
    List<WalletWithdrawalRecordEntity> entity = baseEntity.data;
    if (entity != null) {
        setState(() {
        list.addAll(entity);
      });
    }
    int len = list.length;
    LogUtil.e("list "+len.toString());
    return baseEntity;
  }

  @override
  void clearList() {
    list.clear();
  }
}
