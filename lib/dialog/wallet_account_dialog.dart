import 'package:flutter/cupertino.dart';
import 'package:ipfsnets/models/acount_entiy.dart';
import 'package:ipfsnets/models/acount_entiy2.dart';
import 'package:ipfsnets/ui/widget/login_button.dart';
import 'package:ipfsnets/ui/widget/nex_button.dart';

import '../include.dart';

class WalletAccountDialog extends StatelessWidget {
  List<AccountEntiy3> list = List.from(GlobalEntiy.accountList3);

  final void Function(int index, int option) onItemClickListener;
  WalletAccountDialog({required this.onItemClickListener});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Container(
          padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 40.w),
          decoration: new BoxDecoration(
              color: Colours.text_white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30.w), topRight: Radius.circular(30.w))
            // borderRadius: new BorderRadius.circular((10.w)),
          ),
          child: Column(
            children: [
              getTopLayout(context),
              Gaps.vGap12,
              SizedBox(child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(height: 1.0, color: Colours.line),
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index)=>InkWell(onTap: () {
                }, child: Container(child:getListItem(list[index], index) ),
                ),
              ),height: 380,),

            ],
          )) ,
    );


  }



  Column getTopLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(S.current.wallet_withdraw_money_choose,style: ITextStyles.itemTitle,),
      ],
    );
  }
  Container getListItem(AccountEntiy3 entiy, int index) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10.h, 0, 10.h),
      child:  Row(
        children: [
          Image.asset(entiy.imgUrl, width: 40.w, height: 40.w,),
          Gaps.hGap4,
          Column(
            children: [
              Text(entiy.title,
                style: ITextStyles.itemTitle,
              ),
              Text("222222",
                style: ITextStyles.itemContent12,
              ),
            ],
          ),
          Expanded(child: SizedBox()),
          Checkbox(
              activeColor: Colours.dark_bg_color,
              value: entiy.isBlank,
              onChanged: (value){
                onItemClickListener(index, 1);
              },
              shape: CircleBorder()),
        ],
      ),
    );
  }
}
