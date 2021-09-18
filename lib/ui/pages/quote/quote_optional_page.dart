import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/http/quote_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/quote_optional_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/quote/quote_optional_hot_item.dart';
import 'package:ipfsnets/ui/pages/quote/quote_optional_item.dart';
import 'package:ipfsnets/ui/widget/base_list_page.dart';


class QuoteOptionalPage extends StatefulWidget {
  late num id;

  QuoteOptionalPage(this.id);
  @override
  _QuoteOptionalState createState() => _QuoteOptionalState(id);
}

class _QuoteOptionalState extends BaseListPageState<QuoteOptionalPage>{
  // final QuoteController controller = Get.put(QuoteController());
  late num id;
  // 价格排序   0 默认，1 涨  2 跌
  int price1 = 0;
  // 涨幅排序   0 默认，1 涨  2 跌
  int gains1 = 0;
  // 价格排序   0 默认，1 涨  2 跌
  int price2 = 0;
  // 涨幅排序   0 默认，1 涨  2 跌
  int gains2 = 0;

  _QuoteOptionalState(this.id);
  List<QuoteOptionalEntity> list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    price1 = 0;
    // 涨幅排序   0 默认，1 涨  2 跌
    gains1 = 0;
    // 价格排序   0 默认，1 涨  2 跌
    price2 = 0;
    // 涨幅排序   0 默认，1 涨  2 跌
    gains2 = 0;
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.e(" num = "+ id.toString());
    setEnableLoadMore(false);
    return Scaffold(
      backgroundColor: Colours.bg_color,
      body: Column(
        children: [
          Visibility(child:buildItem(),visible: id == 3?false:true,),
          Expanded(child: buildRefreshView(context)),
        ],
      )
    );
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
            GestureDetector(child: Image.asset(R.assetsImgIcQuoteUp, width: 15.w,height: 15.w,),onTap: (){

            },),
            GestureDetector(child: Image.asset(R.assetsImgIcQuoteDown, width: 15.w,height: 15.w,),onTap: (){

            },),
          ],
        ),visible:false,),
        Expanded(child: SizedBox()),
      ],
    );
  }


  buildQuoteItem(String title, bool show, int index) {
    return Row(
      children: [
        Gaps.hGap26,
        GestureDetector(child:Text(id == 4?S.current.quote_price_cny:title,style: ITextStyles.itemContent,),onTap: (){
          priceSort();
        },),

        Gaps.hGap4,
        Visibility(child:Column(
          children: [
            GestureDetector(child:Image.asset(getPriceUp(), width: 15.w,height: 15.w,),onTap: (){
              priceSort();
            },),
            GestureDetector(child:Image.asset(getPriceDown(), width: 15.w,height: 15.w,),onTap: (){
              priceSort();
            },)

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
        GestureDetector(child: Text(id == 4?S.current.quote_gains_today:title,style: TextStyle(fontSize: 14, color: id== 4?Colours.item_red:Colours.item_content_color),),onTap: (){
          gainsSort();
        },),
        Gaps.hGap4,
        Visibility(child:Column(
          children: [
            GestureDetector(child:Image.asset(getGainsUp(), width: 15.w,height: 15.w,),onTap: (){
              gainsSort();
            },),
            GestureDetector(child:Image.asset(getGainsDown(), width: 15.w,height: 15.w,),onTap: (){
              gainsSort();
            },)
          ],
        ),visible:id == 4?false:true,),
      ],
    );
  }

  @override
  Widget setListView(int index) {
    if (id == 3) {
      return QuoteOptionalHotItem(list[index],index);
    } else {
      return QuoteOptionalItem(list[index],index,(postion){
        addOp(list[index]);
      });
    }

  }

  Future<void> addOp(QuoteOptionalEntity data) async {
    if (data.optionalStatus == 1) {
      BaseEntity entity = await QuoteApi.quoteDel(data.name);
      if (entity.isOk()) {
        data.optionalStatus = 0;
        setState(() {
            if (id == 1) {
              list.remove(data);
            }
        });
      }
    }else{
      BaseEntity entity = await QuoteApi.quoteAdd(data.name);
      if (entity.isOk()) {
        data.optionalStatus = 1;
        setState(() {

        });
      }
    }
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
    BaseEntity entity;
    if (widget.id == 1) {
      entity = await QuoteApi.getQuoteHomeOb(0, 0);
    }else{
      entity = await QuoteApi.getQuoteHome(widget.id);
    }

    if (id == 1) {
      price1 = 0;
      gains1 = 0;
    }else if(id == 2) {
      price2 = 0;
      gains2 = 0;
    }
    if (entity.data != null) {
      list.clear();
      list.addAll(entity.data);
      if (entity.isOk()) {
        setState(() {

        });
      }
    }
    return entity;
  }

  @override
  void clearList() {
    list.clear();
  }

  //  价格 升
  void priceSort() {
    LogUtil.e("ric升级");
    if (id == 1) {
      if (price1 == 0) {
        price1 =1;
      }
      if (price1 == 1) {
        price1 = 2;
        list.sort((left,right)=>right.priceCny.compareTo(left.priceCny));
        LogUtil.e(" 1 价格升级 ");
      }else{
        price1 = 1;
        list.sort((left,right)=>left.priceCny.compareTo(right.priceCny));
        LogUtil.e(" 1 价格降");
      }
      gains1 = 0;
    }else if (id == 2) {
      if (price2 == 0) {
        price2 =1;
      }
      if (price2 == 1) {
        price2 = 2;
        list.sort((left,right)=>right.priceCny.compareTo(left.priceCny));
        LogUtil.e(" 2 价格升级");
      }else{
        price2 = 1;
        list.sort((left,right)=>left.priceCny.compareTo(right.priceCny));
        LogUtil.e(" 2 价格降");
      }
      gains2 = 0;
    }
    setState(() {

    });

  }

  // 涨幅
  void gainsSort() {
    if (id == 1) {
      if (gains1 == 0) {
        gains1 =1;
      }
      if (gains1 == 1) {
        gains1 = 2;
        list.sort((left,right)=>right.changeRate.compareTo(left.changeRate));
      }else{
        gains1 = 1;
        list.sort((left,right)=>left.changeRate.compareTo(right.changeRate));
        LogUtil.e(" 1 涨幅降");
      }
      price1 = 0;
    }else if (id == 2) {
      if (gains2 == 0) {
        gains2 =1;
      }
      if (gains2 == 1) {
        gains2 = 2;
        LogUtil.e(" 2 涨幅升级");
        list.sort((left,right)=>right.changeRate.compareTo(left.changeRate));
      }else{
        gains2 = 1;
        list.sort((left,right)=>left.changeRate.compareTo(right.changeRate));
        LogUtil.e(" 2 涨幅降");
      }
      price2 = 0;
    }
    setState(() {

    });
  }



  getPriceUp() {
    if (id == 1) {
      if (price1 == 1) {
        return R.assetsImgIcQuoteUpN;
      }else{
        return R.assetsImgIcQuoteUp;
      }
    }else if(id == 2) {
      if (price2 == 1) {
        return R.assetsImgIcQuoteUpN;
      }else{
        return R.assetsImgIcQuoteUp;
      }
    }else{
      return R.assetsImgIcQuoteUp;
    }

  }


  getPriceDown() {
    if (id == 1) {
      if (price1 == 2) {
        return R.assetsImgIcQuoteDownN;
      }else {
        return R.assetsImgIcQuoteDown;
      }
    }else if(id == 2) {
      if (price2 == 2) {
        return R.assetsImgIcQuoteDownN;
      }else{
        return R.assetsImgIcQuoteDown;
      }
    }else {
      return R.assetsImgIcQuoteDown;
    }
  }
  getGainsUp() {
    if (id == 1) {
      if (gains1 == 1) {
        return R.assetsImgIcQuoteUpN;
      }else{
        return R.assetsImgIcQuoteUp;
      }
    }else if(id == 2) {
      if (gains2 == 1) {
        return R.assetsImgIcQuoteUpN;
      }else{
        return R.assetsImgIcQuoteUp;
      }
    }else {
      return R.assetsImgIcQuoteUp;
    }
  }


  getGainsDown() {
    if (id == 1) {
      if (gains1 == 2) {
        return R.assetsImgIcQuoteDownN;
      }else{
        return R.assetsImgIcQuoteDown;
      }
    }else if(id == 2) {
      if (gains2 == 2) {
        return R.assetsImgIcQuoteDownN;
      }else{
        return R.assetsImgIcQuoteDown;
      }
    }else{
      return R.assetsImgIcQuoteDown;
    }
  }


}
