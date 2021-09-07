import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/http/market_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/fans_entity.dart';
import 'package:ipfsnets/models/machine_entity.dart';
import 'package:ipfsnets/models/market_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/me/machine/machine_total_list_item.dart';
import 'package:ipfsnets/ui/widget/base_list_page.dart';

import 'fans_list_item.dart';



class FansPage extends StatefulWidget {
  @override
  _FansState createState() => _FansState();
}

class _FansState extends BaseListPageState<FansPage> {

  late FansEntity fansEntity;
  List<FansEntity> list = [];
  @override
  Widget build(BuildContext context) {

    setEnableRefresh(false);
    setEnableLoadMore(false);
    return Scaffold(
        backgroundColor: Colours.bg_color,
        appBar: AppBar(
          title: Text(S.current.fans_title),
          centerTitle: true,
          backgroundColor: Colours.app_bar_bg,
        ),
      body:ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: [
            SizedBox(
                width: double.infinity,
                height: 70.h,
                child: Container(
                  color: Colours.app_bar_bg,
                )),
            Column(
              children: [
                buildTop(context),
                Expanded(child: buildRefreshView(context),),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget setListView(int index) {
    return FansListItem(list[index]);
  }

  @override
  void onItemClick(BuildContext context, int index) {
    // TODO: implement onItemClick

  }

  @override
  void initState() {
    super.initState();
    fansEntity = new FansEntity();
    fansEntity.teamKpi = 0;
    fansEntity.personalKpi = 0;
    fansEntity.unit = "";
    getInfo();
  }


  @override
  int getListLength() {
    // TODO: implement getListSize
    return list.length;
  }


  @override
  Future<BaseEntity> getData() async{
    BaseEntity entity = await MarketApi.getFansList();
    if (entity.isOk()) {
      list.addAll(entity.data);
      setState(() {

      });
    }
    return entity;
  }

  getInfo() async{
    BaseEntity entity = await MarketApi.getFansInfo();
    if (entity.isOk()) {
      fansEntity = entity.data;
      setState(() {

      });
    }
    return entity;
  }

  @override
  void clearList() {
    list.clear();
  }


  buildTop(BuildContext context){
    return Container(
      margin: EdgeInsets.all(20.w),
      padding: EdgeInsets.all(30.w),
      decoration: ITextStyles.boxDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Gaps.hGap16,
          Expanded(child:buildItemTitle(S.current.fans_item_1+"("+fansEntity.unit+")", fansEntity.personalKpi.toStringAsFixed(0)),flex: 1,),
          SizedBox(
            width: 1.w,
            height: 70.h,
            child: VerticalDivider(),
          ),
          Gaps.hGap16,
          Expanded(child:buildItemTitle(S.current.fans_item_2+"("+fansEntity.unit+")", fansEntity.teamKpi.toStringAsFixed(0)),flex: 1,)
        ],
      ),
    );
  }


  buildItemTitle(String title,String desc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(children: [
          TextSpan(text: title,style: ITextStyles.itemContent),
        ])),
        Gaps.vGap8,
        Text(desc, style: TextStyle(color: Colours.item_red, fontSize: 18),),
      ],
    );
  }


}
