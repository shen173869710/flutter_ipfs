import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/http/api_service.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/cny_recharge_record_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/me/cny/cny_rechage_record_item.dart';
import 'package:ipfsnets/ui/widget/base_list_page.dart';



class CnyRechageRecordPage extends StatefulWidget {
  @override
  _CnyRechageRecordState createState() => _CnyRechageRecordState();
}

class _CnyRechageRecordState extends BaseListPageState<CnyRechageRecordPage> {
  List<CnyRechargeRecordEntity> list = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.bg_color,
      appBar: AppBar(
        title: new Text(S.current.cny_rechage_record_title),
        centerTitle: true,
        backgroundColor: Colours.app_bar_bg,
      ),
      body: buildRefreshView(context)
    );
  }

  @override
  Widget setListView(int index) {
    return CnyRechageRecordItem(list[index]);
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
    BaseEntity baseEntity  = await ApiServer.getCnyRechargeList(page);
    List<CnyRechargeRecordEntity>  entitys = baseEntity.data;
    if (entitys != null) {
      setState(() {
        list.addAll(entitys);
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
