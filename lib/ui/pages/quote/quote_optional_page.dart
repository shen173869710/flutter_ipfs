import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/http/quote_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/quote_optional_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/quote/quote_optional_item.dart';
import 'package:ipfsnets/ui/widget/base_list_page.dart';


class QuoteOptionalPage extends StatefulWidget {

  late num id;
  QuoteOptionalPage(this.id);
  @override
  _QuoteOptionalState createState() => _QuoteOptionalState(id);
}

class _QuoteOptionalState extends BaseListPageState<QuoteOptionalPage> with AutomaticKeepAliveClientMixin{
  late num id;
  _QuoteOptionalState(this.id);
  List<QuoteOptionalEntity> list = [];
  @override
  Widget build(BuildContext context) {

    setEnableLoadMore(false);
    return Scaffold(
      backgroundColor: Colours.bg_color,
      body: Column(
        children: [
          buildItem(),
          Expanded(child: buildRefreshView(context)),

        ],
      )
      
    
    );
  }

  Container buildItem() {
    return Container(
      padding: EdgeInsets.only(top: 30.w, bottom: 30.w),
      alignment: Alignment.center,
      color: Colours.white,
      child: Row(
        children: [
          Expanded(child: Container(child: Text(S.current.quote_type),alignment: Alignment.centerLeft,margin: EdgeInsets.only(left: 80.w),),flex: 1,),
          Expanded(child: Container(child: buildQuotetype(),alignment: Alignment.center,),flex: 1,),
          Expanded(child: Container(child: Text(S.current.quote_type),alignment: Alignment.centerRight,margin: EdgeInsets.only(right: 40.w)),flex: 1,),
        ],
      ),
    );
  }

  buildQuotetype() {
    return Row(
      children: [
        Expanded(child: SizedBox()),
        Text(S.current.quote_price,style: ITextStyles.itemContent,),
        Gaps.hGap4,
        Column(
          children: [
            Image.asset(R.assetsImgIcQuoteUp, width: 25.w,height: 25.w,),
            Image.asset(R.assetsImgIcDown, width: 25.w,height: 25.w,),
          ],
        ),

        Expanded(child: SizedBox()),
      ],
    );
  }

  @override
  Widget setListView(int index) {
    return QuoteOptionalItem(list[index]);
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
    BaseEntity entity = await QuoteApi.getQuoteHome();
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



  @override
  bool get wantKeepAlive => true;
}
