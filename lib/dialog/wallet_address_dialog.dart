import 'package:flutter/cupertino.dart';
import 'package:ipfsnets/models/acount_entiy2.dart';
import 'package:ipfsnets/ui/widget/login_button.dart';

import '../include.dart';

class WalletAddressDialog extends StatelessWidget {
  List<AccountEntiy2> list = List.from(GlobalEntiy.accountList2);

  final void Function(int index, int option) onItemClickListener;
  WalletAddressDialog({required this.onItemClickListener});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Container(
          padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 20.w),
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
                }, child: Container(child:getListItem(context,list[index], index) ),
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
        Text(S.current.wallet_withdraw_dialog_title,style: ITextStyles.itemTitle,),
      ],
    );
  }

  Container getListItem(BuildContext context,AccountEntiy2 entiy, int index) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
        child:Column(
          children: [
            Visibility(child: Row(
              children: [
                Checkbox(
                    activeColor: Colours.dark_bg_color,
                    value: entiy.isBlank,
                    onChanged: (value){
                      Navigator.of(context).pop();
                      onItemClickListener(index, 1);
                    },
                    shape: CircleBorder()),
                Image.asset(entiy.imgUrl, width: 40.w, height: 40.w,),
                Gaps.hGap4,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(entiy.title,
                      style: ITextStyles.itemTitle,
                    ),
                    Text("222222",
                      style: ITextStyles.itemContent12,
                    ),
                  ],
                ),
                Gaps.hGap4,
                Expanded(child: SizedBox()),
                GestureDetector(child:Image.asset(R.assetsImgIcDel, width: 35.w, height: 35.w,),onTap: (){
                  Navigator.of(context).pop();
                  onItemClickListener(index, 2);
                },),
                Gaps.hGap8,
                GestureDetector(child: Image.asset(R.assetsImgIcEdit, width: 35.w, height: 35.w,),onTap: (){
                  Navigator.of(context).pop();
                  onItemClickListener(index, 3);
                },)
              ],
            ),visible: entiy.type == 0 ? true:false,),
            Gaps.vGap8,
            Visibility(child: LoginButton(text: S.current.wallet_withdraw_dialog_add, endble: true, onPressed: (){
              Navigator.of(context).pop();
              onItemClickListener(index, 4);

            }),visible: entiy.type != 0 ? true:false,)
          ],
        )
    );
  }
}
