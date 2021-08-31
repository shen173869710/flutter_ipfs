import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/http/market_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/share_day_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/widget/base_list_page.dart';

import 'machine_earnings_list_item.dart';

class MachineEarningsPage extends StatefulWidget {

  late String time;
  MachineEarningsPage(this.time);
  @override
  _MachineEarningsState createState() => _MachineEarningsState();
}

class _MachineEarningsState extends BaseListPageState<MachineEarningsPage> with AutomaticKeepAliveClientMixin{
  ShareDayEntity shareDayEntity = ShareDayEntity();

  @override
  void initState() {
    print(widget.time);
    shareDayEntity.init();
    super.initState();

  }
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
    return MachineEraningsListItem(shareDayEntity.servEarnings[index]!);
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
    return shareDayEntity.servEarnings == null?0:shareDayEntity.servEarnings.length;
  }


  @override
  Future<BaseEntity> getData() async{
    BaseEntity entity = await MarketApi.shareCoinDay(widget.time);
    if (entity.isOk()) {

      setState(() {
          if (entity != null) {
            shareDayEntity = entity.data;
          }
      });
    }
    return entity;
  }

  @override
  void clearList() {
    if (shareDayEntity.servEarnings != null) {
      shareDayEntity.servEarnings.clear();
    }

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
              Text(S.current.machine_earnings_today+"("+widget.time+")", style: ITextStyles.itemContent),
              Gaps.vGap8,
              Text(shareDayEntity.todayEarning.toString()+" FIL", style: TextStyle(fontSize: 20,color: Color(0xffF23E2A)),),
            ],
          ),
          Gaps.vGap8,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child:buildItem3Desc(shareDayEntity.releaseNow.toString()+" FIL", S.current.machine_earnings_atonce),flex: 1,),
              Expanded(child:buildItem3Desc(shareDayEntity.freezeNum.toString()+" FIL", S.current.machine_earnings_linear),flex: 1,)
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
