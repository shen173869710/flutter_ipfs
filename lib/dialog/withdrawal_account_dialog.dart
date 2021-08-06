import 'package:flutter/cupertino.dart';
import 'package:ipfsnets/http/api_service.dart';
import 'package:ipfsnets/models/acount_entiy.dart';
import 'package:ipfsnets/net/base_entity.dart';
import '../include.dart';
import 'dart:convert' as convert;


class WithDrawalAccountDialog extends StatefulWidget {
  late String money;
  final void Function(int index) onItemClickListener;
  WithDrawalAccountDialog({required this.onItemClickListener,required this.money});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WithDrawalAccountState(onItemClickListener: onItemClickListener,money: money);
  }

}

class _WithDrawalAccountState extends State<WithDrawalAccountDialog> {
  late String money;
  List<AccountEntiy> list = [];
  final void Function(int index) onItemClickListener;
  _WithDrawalAccountState({required this.onItemClickListener,required this.money});

  /**获取账户信息**/
  getAccount() async{
    BaseEntity baseEntity  = await ApiServer.cnyWithdrawalhistory(1);
    List<AccountEntiy> entity = baseEntity.data;
    list.clear();
    setState(() {
      list.addAll(entity);
      LogUtil.e("list"+entity.length.toString());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: ITextStyles.containerMargin,
        decoration: new BoxDecoration(
            color: Colours.text_white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.w),
                topRight: Radius.circular(30.w))
          // borderRadius: new BorderRadius.circular((10.w)),
        ),
        child: Column(
          children: [
            getTopLayout(context),
            Expanded(child:  ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(height: 1.0, color: Colours.line),
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index)=>InkWell(onTap: () {
                LogUtil.e("==="+index.toString());
                Navigator.of(context).pop();
                NavigatorUtil.push(context,'${Routes.cnyWithdrawalEnd}?type=${Uri.encodeComponent(list[index].type)}&money=${Uri.encodeComponent(money)}',arguments: list[index]);

              }, child: Container(child:getListItem(list[index]) ),
              ),

            )),
          ],
        ));
  }


  Column getTopLayout(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(S.current.withdrawal_dialog_title,style: ITextStyles.itemTitle,),
            Gaps.vGap16,
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        child:Image.asset(R.assetsImgIconAlipay, width: 80.w,height: 80.w,),
                      onTap: (){
                        Navigator.of(context).pop();
                        NavigatorUtil.push(context,'${Routes.cnyWithdrawalEnd}?type=${Uri.encodeComponent("1")}&money=${Uri.encodeComponent(money)}');

                      },),
                      Gaps.vGap8,
                      Text(S.current.withdrawal_dialog_alipay,style: ITextStyles.itemTitle,)
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(child:  Image.asset(R.assetsImgIconBank, width: 80.w,height: 80.w,),onTap: (){
                        Navigator.of(context).pop();
                        NavigatorUtil.push(context,'${Routes.cnyWithdrawalEnd}?type=${Uri.encodeComponent("2")}&money=${Uri.encodeComponent(money)}');

                      },),
                      Gaps.vGap8,
                      Text(S.current.withdrawal_dialog_bank,style: ITextStyles.itemTitle,)
                    ],
                  )
                ]),
            Gaps.vGap12,
            Gaps.line,
            Gaps.vGap12,
            Row(
              children: [
                Text(S.current.withdrawal_dialog_near,style: TextStyle(
                  color: Colours.item_title_color,
                  fontSize: 14
                ),),
              ],
            )
          ],
        );
  }


  Container getListItem(AccountEntiy entiy) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10.h, 0, 10.h),
      child: Row(
        children: [
          Image.asset(getImageUrl(entiy.type), width: 60.w, height: 60.w,),
          Gaps.hGap8,
          Text(getTitle(entiy),
            style: ITextStyles.itemTitle,
          ),
          Expanded(child: SizedBox()),
          Checkbox(
              activeColor: Colours.dark_bg_color,
              value: false,
              onChanged: (value) {
                Navigator.of(context).pop();
                NavigatorUtil.push(context,'${Routes.cnyWithdrawalEnd}?type=${Uri.encodeComponent(entiy.type)}&money=${Uri.encodeComponent(money)}',arguments: entiy);
              },
              shape: CircleBorder()) //这里就是实现圆形的设置
        ],
      ),
    );
  }


  String getImageUrl (String type) {
    if(type == "1") {
      return R.assetsImgIconAlipay;
    }else{
      return R.assetsImgIconBank;
    }
  }


  String getTitle (AccountEntiy entiy) {
    if(entiy.type == "1") {
      return entiy.accountName+" "+entiy.accountNumber;
    }else{
      return entiy.accountName+" "+entiy.accountBank;
    }
  }

}
