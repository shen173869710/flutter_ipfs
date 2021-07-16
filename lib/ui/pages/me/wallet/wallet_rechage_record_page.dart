import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/rechage_record_model.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/me/cny/cny_rechage_record_item.dart';
import 'package:ipfsnets/ui/widget/base_list_page.dart';


const List<RechageRecordModel> newsList = [
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

class WalletRechageRecordPage extends StatefulWidget {
  @override
  _WalletRechageRecordState createState() => _WalletRechageRecordState();
}

class _WalletRechageRecordState extends BaseListPageState<WalletRechageRecordPage> {
  List<RechageRecordModel> list = List.from(newsList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.bg_color,
      appBar: AppBar(
        title: new Text(S.current.cny_rechage_title),
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
  void requestListData() {
    // TODO: implement requestListData
    LogUtil.e("----add"+list.length.toString());
    list.add(list[0]);
  }

  @override
  int getListLength() {
    // TODO: implement getListSize
    LogUtil.e("----"+list.length.toString());

    return list.length;
  }
}
