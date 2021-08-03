import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/http/wallet_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/transfer_record_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/me/transfer/transfer_record_item.dart';
import 'package:ipfsnets/ui/widget/base_list_page.dart';



class TransferRecordPage extends StatefulWidget {

  String coinCode = "";
  TransferRecordPage({required this.coinCode,});

  @override
  _TransferRecordState createState() => _TransferRecordState();
}

class _TransferRecordState extends BaseListPageState<TransferRecordPage> {
  List<TransferRecordEntity> list = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colours.bg_color,
        appBar: AppBar(
          title: new Text(S.current.transfer_record_title),
          centerTitle: true,
          backgroundColor: Colours.app_bar_bg,
        ),
        body: buildRefreshView(context),
    );
  }

  @override
  Widget setListView(int index) {
    return TransferRecordItem(list[index]);
  }

  @override
  void onItemClick(BuildContext context, int index) {
    // TODO: implement onItemClick
  }

  @override
  int getListLength() {
    return list.length;
  }

  @override
  Future<BaseEntity> getData() async {
    num id = 0;
    if (StringUtil.isNotEmpty(widget.coinCode)) {
      id = num.parse(widget.coinCode);
    }
    BaseEntity baseEntity  = await WalletApi.transferRecordList(page,id);
    List<TransferRecordEntity> entity = baseEntity.data;
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
