import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/rechage_record_model.dart';
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
  late List<RechageRecordModel> list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = BaseListFactory.getListItemData(widget.type);
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
  void requestListData() {
    LogUtil.e("----add"+list.length.toString());
    list.add(list[0]);
  }

  @override
  int getListLength() {
    return list.length;
  }
}
