import 'package:flutter/cupertino.dart';
import 'package:ipfsnets/models/acount_entiy.dart';

import '../include.dart';

class WithDrawalAccountDialog extends StatelessWidget {

  List<AccountEntiy> list = List.from(GlobalEntiy.accountList);
  final void Function(int index) onItemClickListener;
  WithDrawalAccountDialog({required this.onItemClickListener});

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
            Gaps.vGap12,
            ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(height: 1.0, color: Colours.line),
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index)=>InkWell(onTap: () {
                      LogUtil.e("==="+index.toString());
                      Navigator.of(context).pop();
                      NavigatorUtil.push(context,  '${Routes.cnyWithdrawalEnd}?type=${Uri.encodeComponent(index.toString())}');

                    }, child: Container(child:getListItem(list[index]) ),
                ),

               ),

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
                      Image.asset(R.assetsImgIconAlipay, width: 80.w,height: 80.w,),
                      Gaps.vGap8,
                      Text(S.current.withdrawal_dialog_alipay,style: ITextStyles.itemTitle,)
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(R.assetsImgIconBank, width: 80.w,height: 80.w,),
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


  CupertinoActionSheetAction getSheetAction(BuildContext context) {
    return CupertinoActionSheetAction(
        onPressed: () {      Navigator.of(context).pop();},
        child: Column(
          children: [

          ],
        ));
  }

  Container getListItem(AccountEntiy entiy) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10.h, 0, 10.h),
      child: Row(
        children: [
          Image.asset(entiy.imgUrl, width: 60.w, height: 60.w,),
          Gaps.hGap8,
          Text(entiy.title,
            style: ITextStyles.itemTitle,
          ),
          Expanded(child: SizedBox()),
          Checkbox(
              activeColor: Colours.dark_bg_color,
              value: false,
              onChanged: (value) {},
              shape: CircleBorder()) //这里就是实现圆形的设置
        ],
      ),
    );


  }
}
