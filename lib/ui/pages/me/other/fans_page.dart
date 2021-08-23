import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/http/market_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/machine_entity.dart';
import 'package:ipfsnets/models/market_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/me/machine/machine_total_list_item.dart';
import 'package:ipfsnets/ui/widget/base_list_page.dart';



class FansPage extends StatefulWidget {
  @override
  _FansState createState() => _FansState();
}

class _FansState extends BaseListPageState<FansPage> {

  List<MarketEntity> list = [];
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
    return MachineTotalListItem(list[index]);
  }

  @override
  void onItemClick(BuildContext context, int index) {
    // TODO: implement onItemClick

  }


  @override
  int getListLength() {
    // TODO: implement getListSize
    return list.length;
  }


  @override
  Future<BaseEntity> getData() async{
    BaseEntity entity = await MarketApi.getMachineById(1, false);
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
          Expanded(child:buildItemTitle(S.current.fans_item_1, "123"),flex: 1,),
          SizedBox(
            width: 1.w,
            height: 70.h,
            child: VerticalDivider(),
          ),
          Gaps.hGap16,
          Expanded(child:buildItemTitle(S.current.fans_item_2, "12356"),flex: 1,)
        ],
      ),
    );
  }




  buildItem(String title, String dec) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(dec, style: ITextStyles.itemContent),
        Gaps.vGap4,
        Text(title, style: ITextStyles.itemTitle,),
      ],
    );
  }

  buildItemTitle(String title,String desc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(children: [
          WidgetSpan(child: Image.asset(R.assetsImgIconCny, height: 30.w, width: 30.w,)),
          TextSpan(text: " "),
          TextSpan(text: title,style: ITextStyles.itemContent),
        ])),
        Gaps.vGap8,
        Text(desc, style: TextStyle(color: Colours.item_red, fontSize: 18),),
      ],
    );
  }


}
