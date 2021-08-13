import 'package:flutter/cupertino.dart';
import 'package:ipfsnets/models/wallet_account_entity.dart';

import '../include.dart';

class WalletAccountDialog extends StatelessWidget {
  List<WalletAccountEntity> list = [];

  final void Function(int index, int option) onItemClickListener;

  WalletAccountDialog({required this.list,required this.onItemClickListener});

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
                }, child: Container(child:getListItem(list[index], index,context)),
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
  Container getListItem(WalletAccountEntity entiy, int index,BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10.h, 0, 10.h),
      child:  Row(
        children: [
          ImageUtil.loadImage(entiy.coinIcon, 40.w, 40.w),
          Gaps.hGap8,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(entiy.coinName, style: ITextStyles.itemTitle,),
              Text(S.current.wallet_withdraw_money_has+" "+entiy.value.toString(), style: ITextStyles.itemContent,),
            ],
          ),
          Expanded(child: SizedBox()),
          Checkbox(
              activeColor: Colours.dark_bg_color,
              value: false,
              onChanged: (value){
                Navigator.of(context).pop();
                onItemClickListener(index, 1);

              },
              shape: CircleBorder()),
        ],
      ),
    );
  }


  String getImage(String type) {
    if (type == "1") {
      return R.assetsImgIconAlipay;
    }else{
      return R.assetsImgIconBank;
    }
  }
}
