import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/http/market_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/market_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/widget/base_list_page.dart';

import 'machine_earnings_list_item.dart';

class MachineEarningsPage extends StatefulWidget {

  late num id;
  MachineEarningsPage(this.id);
  @override
  _MachineEarningsState createState() => _MachineEarningsState(id);
}

class _MachineEarningsState extends BaseListPageState<MachineEarningsPage> with AutomaticKeepAliveClientMixin{
  late num id;
  _MachineEarningsState(this.id);
  List<MarketEntity> list = [];
  @override
  Widget build(BuildContext context) {
    setEnableRefresh(false);
    setEnableLoadMore(false);

    return Scaffold(
        backgroundColor: Colours.bg_color,
        appBar: AppBar(
          title: new Text(S.current.machine_earnings_title),
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
                buildItem4(context),
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
    return MachineEraningsListItem(list[index]);
  }

  @override
  void onItemClick(BuildContext context, int index) {
    // TODO: implement onItemClick

  }

  @override
  void setEnableLoadMore(enable) {
    // TODO: implement setEnableLoadMore
    super.setEnableLoadMore(false);
  }

  @override
  int getListLength() {
    // TODO: implement getListSize
    return list.length;
  }


  @override
  Future<BaseEntity> getData() async{
    BaseEntity entity = await MarketApi.getMachineById(id, false);
    if (entity.isOk()) {
      list.addAll(entity.data);
      setState(() {

      });
    }
    return entity;
  }

  @override
  void clearList() {
    list.clear();
  }


  // 矿区收益
  buildItem4(BuildContext context){
    return Container(
      margin: EdgeInsets.all(20.w),
      padding: EdgeInsets.all(30.w),
      decoration: ITextStyles.boxDecoration,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(S.current.machine_earnings_today+"("+DateUtil.getTimeY(new DateTime.now().millisecondsSinceEpoch)+")", style: ITextStyles.itemContent),
              Gaps.vGap8,
              Text("123456", style: TextStyle(fontSize: 20,color: Color(0xffF23E2A)),),
            ],
          ),
          Gaps.vGap8,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child:buildItem3Desc(S.current.machine_earnings_atonce, S.current.machine_earnings_atonce),flex: 1,),
              Expanded(child:buildItem3Desc(S.current.machine_earnings_linear, S.current.machine_earnings_linear),flex: 1,)
            ],
          ),
        ],
      ),
    );
  }

  buildItem3Desc(String title, String dec) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(dec, style: ITextStyles.itemContent),
        Gaps.vGap4,
        Text(title, style: ITextStyles.itemTitle,),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
