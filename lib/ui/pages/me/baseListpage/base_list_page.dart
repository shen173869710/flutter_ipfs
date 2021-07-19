import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/cny_withdrawal_record_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/widget/base_list_page.dart';

import 'base_list_factory.dart';

class BaseListPage extends StatefulWidget {
  const BaseListPage({Key? key,
    required this.type,
  });

  final String type;

  @override
  _BaseListState createState() => _BaseListState();
}

class _BaseListState extends BaseListPageState<BaseListPage> {
  late List<CnyWithdrawalRecordEntity> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list.addAll(BaseListFactory.getListItemData(widget.type));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.bg_color,
      appBar: AppBar(
        title: new Text(BaseListFactory.getListTitle(widget.type)),
        centerTitle: true,
        backgroundColor: Colours.app_bar_bg,
      ),
      body: buildRefreshView(context)
    );
  }

  @override
  Widget setListView(int index) {
    return BaseListFactory.getListItem(widget.type, index);
  }

  @override
  void onItemClick(BuildContext context, int index) {

  }


  @override
  int getListLength() {
    return list.length;
  }


  @override
  Future<BaseEntity> getData() {
    throw new Object();
  }

  @override
  void clearList() {
    list.clear();
  }
}
