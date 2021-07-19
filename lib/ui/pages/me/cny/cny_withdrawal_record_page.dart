import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/http/api_service.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/cny_withdrawal_record_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/me/cny/cny_withdrawal_record_item.dart';
import 'package:ipfsnets/ui/widget/base_list_page.dart';



class CnyWithDrawalRecordPage extends StatefulWidget {
  @override
  _CnyWithdrawalRecordState createState() => _CnyWithdrawalRecordState();
}

class _CnyWithdrawalRecordState extends BaseListPageState<CnyWithDrawalRecordPage> {
  List<CnyWithdrawalRecordEntity> list = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colours.bg_color,
        appBar: AppBar(
          title: new Text(S.current.cny_withdrawal_record),
          centerTitle: true,
          backgroundColor: Colours.app_bar_bg,
        ),
        body: buildRefreshView(context)
    );
  }

  @override
  Widget setListView(int index) {
    return CnyWithdrawalRecordItem(list[index]);
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
    BaseEntity baseEntity  = await ApiServer.cnyWithdrawalList(1);
    List<CnyWithdrawalRecordEntity> entity = baseEntity.data;
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
