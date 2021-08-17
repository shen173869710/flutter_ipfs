import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/http/quote_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/quote/quote_controller.dart';
import 'package:ipfsnets/ui/pages/quote/quote_optional_rank_item.dart';
import 'package:ipfsnets/ui/widget/base_list_page.dart';


class QuoteOptionalSearchPage extends StatefulWidget {
  late num id;


  QuoteOptionalSearchPage(this.id);
  @override
  _QuoteOptionalState createState() => _QuoteOptionalState(id);
}

class _QuoteOptionalState extends BaseListPageState<QuoteOptionalSearchPage> with AutomaticKeepAliveClientMixin{

  final QuoteController controller = Get.put(QuoteController());

  late num id;
  _QuoteOptionalState(this.id);

  @override
  Widget build(BuildContext context) {

    setEnableLoadMore(false);
    return GetBuilder<QuoteController>(builder:(controller){
      return Scaffold(
          backgroundColor: Colours.bg_color,
          body: Column(
            children: [
              Visibility(child:buildItem(),visible: id == 3?false:true,),
              Expanded(child: buildRefreshView(context)),
            ],
          )
      );
    });
  }

  Container buildItem() {
    return Container(
      padding: EdgeInsets.only(top: 30.w, bottom: 10.w),
      alignment: Alignment.center,
      color: Colours.white,
      child: Row(
        children: [
          Expanded(child: Container(child: buildQuoteType(S.current.quote_type,true,0),alignment: Alignment.centerLeft,margin: EdgeInsets.only(left: 80.w),),flex: 1,),
          Expanded(child: Container(child: buildQuoteItem(S.current.quote_price, true,1),alignment: Alignment.centerLeft,),flex: 1,),
          Expanded(child: Container(child: buildQuoteGans(S.current.quote_gains, true,2),alignment: Alignment.centerRight,margin: EdgeInsets.only(right: 40.w)),flex: 1,),
        ],
      ),
    );
  }
  // 币种
  buildQuoteType(String title, bool show, int index) {
    return Row(
      children: [
        Text(title,style: ITextStyles.itemContent,),
        Gaps.hGap4,
        Visibility(child:Column(
          children: [
            Image.asset(R.assetsImgIcQuoteUp, width: 15.w,height: 15.w,),
            Image.asset(R.assetsImgIcQuoteDown, width: 15.w,height: 15.w,),
          ],
        ),visible: id == 2?true:false,),
        Expanded(child: SizedBox()),
      ],
    );
  }


  buildQuoteItem(String title, bool show, int index) {
    return Row(
      children: [
        Gaps.hGap26,
        Text(id == 4?S.current.quote_price_cny:title,style: ITextStyles.itemContent,),
        Gaps.hGap4,
        Visibility(child:Column(
          children: [
            Image.asset(R.assetsImgIcQuoteUp, width: 15.w,height: 15.w,),
            Image.asset(R.assetsImgIcQuoteDown, width: 15.w,height: 15.w,),
          ],
        ),visible: id == 4?false:true,),
        Expanded(child: SizedBox()),
      ],
    );
  }

  buildQuoteGans(String title, bool show, int index) {
    return Row(
      children: [
        Expanded(child: SizedBox()),
        Text(id == 4?S.current.quote_gains_today:title,style: TextStyle(fontSize: 14, color: id== 4?Colours.item_red:Colours.item_content_color),),
        Gaps.hGap4,
        Visibility(child:Column(
          children: [
            Image.asset(R.assetsImgIcQuoteUp, width: 15.w,height: 15.w,),
            Image.asset(R.assetsImgIcQuoteDown, width: 15.w,height: 15.w,),
          ],
        ),visible:id == 4?false:true,),
      ],
    );
  }

  @override
  Widget setListView(int index) {
    return QuoteOptionalRankItem(controller.list[index],index);
  }

  @override
  void onItemClick(BuildContext context, int index) {
    // TODO: implement onItemClick
  }

  @override
  int getListLength() {
    // TODO: implement getListSize
    return controller.list.length;
  }

  @override
  Future<BaseEntity> getData() async{
    BaseEntity entity = await QuoteApi.getQuoteHome(widget.id);
    if (entity.isOk()) {
      controller.addList(entity.data);
    }
    return entity;
  }

  @override
  void clearList() {
    controller.list.clear();
  }



  @override
  bool get wantKeepAlive => true;
}
