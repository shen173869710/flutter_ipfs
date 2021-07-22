import 'package:flutter/cupertino.dart';
import 'package:ipfsnets/http/wallet_api.dart';
import 'package:ipfsnets/models/wallet_address_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/ui/widget/login_button.dart';

import '../include.dart';

class WalletAddressDialog extends StatefulWidget {
  final void Function(int index, int option,WalletAddressEntity entity) onItemClickListener;
  late num id;
  WalletAddressDialog({required this.onItemClickListener,required this.id});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WalletAddressState(onItemClickListener: onItemClickListener,id: id, );
  }

}

class _WalletAddressState extends State<WalletAddressDialog> {
  List<WalletAddressEntity> list = [];
  late num id;
  final void Function(int index, int option,WalletAddressEntity entity) onItemClickListener;
  _WalletAddressState({required this.onItemClickListener,required this.id});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAccount();
  }


  /**获取账户信息**/
  getAccount() async{
    BaseEntity baseEntity  = await WalletApi.getWalletAccountAddress(1,id);
    List<WalletAddressEntity> entity = baseEntity.data;
    list.clear();
    setState(() {
      WalletAddressEntity end = new WalletAddressEntity();
      end.type = 1;
      list.addAll(entity);
      list.add(end);
      LogUtil.e("list"+entity.length.toString());
    });
  }



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

  Container getListItem(BuildContext context,WalletAddressEntity entiy, int index) {
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
                      onItemClickListener(index, GlobalEntiy.ADDRESS_SEL, list[index]);
                    },
                    shape: CircleBorder()),
                ImageUtil.loadImage(entiy.coinIcon, 40.w, 40.w),
                Gaps.hGap4,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(entiy.coinName,
                      style: ITextStyles.itemTitle,
                    ),
                    Text(entiy.aliasName,
                      style: ITextStyles.itemContent12,
                    ),
                  ],
                ),
                Gaps.hGap4,
                Expanded(child: SizedBox()),
                GestureDetector(child:Image.asset(R.assetsImgIcDel, width: 35.w, height: 35.w,),onTap: (){
                  Navigator.of(context).pop();
                  onItemClickListener(index, GlobalEntiy.ADDRESS_DEL, list[index]);
                },),
                Gaps.hGap8,
                GestureDetector(child: Image.asset(R.assetsImgIcEdit, width: 35.w, height: 35.w,),onTap: (){
                  Navigator.of(context).pop();
                  onItemClickListener(index, GlobalEntiy.ADDRESS_EDIT, list[index]);
                },)
              ],
            ),visible: entiy.type == 0 ? true:false,),
            Gaps.vGap8,
            Visibility(child: LoginButton(text: S.current.wallet_withdraw_dialog_add, endble: true, onPressed: (){
              Navigator.of(context).pop();
              onItemClickListener(index, GlobalEntiy.ADDRESS_ADD,list[index]);

            }),visible: entiy.type != 0 ? true:false,)
          ],
        )
    );
  }
}
