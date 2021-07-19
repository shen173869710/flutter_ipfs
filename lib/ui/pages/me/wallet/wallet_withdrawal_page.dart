import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ipfsnets/data/global_entiy.dart';
import 'package:ipfsnets/dialog/wallet_account_dialog.dart';
import 'package:ipfsnets/dialog/wallet_address_dialog.dart';
import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/wallet_entiy.dart';
import 'package:ipfsnets/res/styles.dart';
import 'package:ipfsnets/ui/pages/me/baseListpage/base_list_factory.dart';
import 'package:ipfsnets/ui/widget/login_button.dart';

class WalletWithdrawalPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WalletWithdrawalState();
  }
}

class _WalletWithdrawalState extends State<WalletWithdrawalPage> {
  List<WalletEntiy> list = List.from(GlobalEntiy.walletList);
  int buttonSel = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colours.bg_color,
      appBar: AppBar(
        title: new Text(S.current.wallet_withdraw_title),
        centerTitle: true,
        backgroundColor: Colours.app_bar_bg,
        actions: [
          IconButton(icon: Icon(Icons.receipt_outlined,color: Colours.text_white,),onPressed: () {
            // NavigatorUtil.goRecordPage(context, BaseListFactory.WALLET_WITHDRAWAL_RECORD);
            NavigatorUtil.jump(context, Routes.cnyWithdrawalRecord);

          },)
        ],
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: false,
        child: Container(
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
                  bulidTop(),
                  Gaps.vGap12,
                  // 主链名称
                  Row(
                    children: [
                      SizedBox(width: 20.w),
                      Text.rich(TextSpan(children: [
                        WidgetSpan(
                            child: Image.asset(
                              R.assetsImgIcNetAddress,
                              height: 30.w,
                              width: 30.w,
                            )),
                        TextSpan(text: "  "),
                        TextSpan(
                            text: S.current.wallet_withdraw_money_name,
                            style: TextStyle(color: Colours.item_title_color, fontSize: 16)),

                      ])),
                    ],
                  ),
                  bulidInfo(context),
                  bulidAddress(context),
                  bulidBottom(context),
                ],
              )
            ],
          ),
        )

        ),
      );
  }
  // 创建顶部
  Container bulidTop() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20.w),
      padding: EdgeInsets.fromLTRB(30.w, 40.w, 30.w, 40.w),
      decoration: ITextStyles.boxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.current.wallet_withdraw_money_choose, style: ITextStyles.itemTitle),
          Expanded(child: SizedBox()),
          GestureDetector(
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: "USDT ",
                  style: TextStyle(color: Colours.item_title_color, fontSize: 16)),
              WidgetSpan(
                  child: Image.asset(
                    R.assetsImgIcArrow,
                    height: 35.w,
                    width: 35.w,
                  ))
            ])),
            onTap: (){
              showChooseWalletAddress();
            },
          )
        ],
      ),
    );
  }
  // 创建 主链名称
  Container bulidInfo(BuildContext context) {
    return  Container(
        width: double.infinity,
        margin: ITextStyles.containerMargin,
        padding: EdgeInsets.fromLTRB(20.w, 30.w, 20.w, 30.w),
        decoration: ITextStyles.boxDecoration,
        child: Column(
          children: [
            buildItem(context),
            Gaps.vGap12,
            Gaps.line,
            Gaps.vGap24,
            Row(
              children: [
                Text(S.current.wallet_withdraw_num, style: ITextStyles.itemTitle16),
                Expanded(child: SizedBox()),
                Text(S.current.wallet_withdraw_out_hint+"111 USDT", style: ITextStyles.itemContent),
              ],
            ),
            Gaps.vGap12,
            buildNumAll(),
            Gaps.line,
            Gaps.vGap12,
            Row(
              children: [
                Text(S.current.wallet_withdraw_out_money, style: ITextStyles.itemTitle),
              ],
            )
          ],

        ));
  }
  /**提币地址**/
  Padding buildAddress() {
    return Padding(padding: EdgeInsets.fromLTRB(0.w, 10.h, 0.w, 0),
      child: Row(
        children: [
          Expanded(child: TextFormField(
            onChanged: (value) {
            },
            controller: null,
            maxLines: 1,
            inputFormatters: [
              LengthLimitingTextInputFormatter(100)
            ],
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: S.current.wallet_withdraw_address_hint
            ),
          )),
          Expanded(child: SizedBox()),
          GestureDetector(child: Image.asset(R.assetsImgIcWithdrawScan, width: 35.w,height: 35.w,),onTap: (){},),
          Gaps.hGap12,
          GestureDetector(child: Image.asset(R.assetsImgIcWithdrawAddress, width: 35.w,height: 35.w,),onTap: (){},),
        ],
      ),
    );
  }
  // 提币地址输入
  Container bulidAddress(BuildContext context) {
    return  Container(
        width: double.infinity,
        margin: ITextStyles.containerMargin,
        padding: EdgeInsets.fromLTRB(20.w, 30.w, 20.w, 30.w),
        decoration: ITextStyles.boxDecoration,
        child: Column(
          children: [
            Gaps.vGap4,
            Row(
              children: [
                Text(S.current.wallet_withdraw_address, style: ITextStyles.itemTitle16),
              ],
            ),
            Gaps.vGap12,
            buildAddress(),
            Gaps.line,
            Gaps.vGap12,
            Row(
              children: [
                Text(S.current.wallet_withdraw_mark, style: ITextStyles.itemTitle),
              ],
            ),
            TextFormField(
              onChanged: (value) {
              },
              controller: null,
              inputFormatters: [
                LengthLimitingTextInputFormatter(32)
              ],
              maxLines: 1,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  hintText: S.current.wallet_withdraw_mark_hint
              ),
            ),
            Gaps.line,
          ],

        ));
  }

  // 底部
  Container bulidBottom(BuildContext context) {
    return  Container(
        width: double.infinity,
        margin: ITextStyles.containerMargin,
        child: Column(
          children: [
            LoginButton(text: S.current.sure, endble: false, onPressed: null),
            Gaps.vGap8,
            Text(S.current.wallet_withdraw_desc,style:ITextStyles.itemContent12)
          ],

        ));
  }
  /**提币数量输入**/
  Padding buildNumAll() {
    return Padding(padding: EdgeInsets.fromLTRB(0.w, 10.h, 0.w, 0),
      child: Row(
        children: [
          Expanded(child:
          TextFormField(
            onChanged: (value) {
            },
            controller: null,
            inputFormatters: [
              LengthLimitingTextInputFormatter(GlobalEntiy.MONEY_MAX_INPUT)
            ],
            maxLines: 1,
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: S.current.wallet_withdraw_min
            ),
          )),
          Expanded(child: SizedBox()),
          GestureDetector(child: Text(S.current.wallet_withdraw_all,
              style:TextStyle(fontSize:
              Dimens.font_sp14,color:
              Colours.button_sel)),onTap: (){
          },),

        ],
      ),
    );
  }

  Row buildItem(BuildContext context){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(height: 60.w,width: 120.w,child:
        TextButton(onPressed:(){
          buttonSel = 0;
          setState(() {
          });
        },child: Text(S.current.wallet_withdraw_erc20,style: TextStyle(fontSize: 14,color:buttonSel==0?Colours.item_title_color:Colours.item_content_color),),style: buttonSel==0?IButtonStyle.chainButtonSel:IButtonStyle.chainButtonUnsel)),
        Gaps.hGap20,
        SizedBox(height: 60.w,width: 120.w,child:
        TextButton(onPressed:(){
          buttonSel = 1;
          setState(() {

          });
        }, child: Text(S.current.wallet_withdraw_trc20,style: TextStyle(fontSize: 14,color:buttonSel==1?Colours.item_title_color:Colours.item_content_color),),style:  buttonSel==1?IButtonStyle.chainButtonSel:IButtonStyle.chainButtonUnsel)),
        Gaps.hGap20,
        SizedBox(height: 60.w,width: 120.w,child:
        TextButton(onPressed:(){
          buttonSel = 2;
          setState(() {

          });
        }, child: Text(S.current.wallet_withdraw_heco,style: TextStyle(fontSize: 14,color:buttonSel==2?Colours.item_title_color:Colours.item_content_color),),style:  buttonSel==2?IButtonStyle.chainButtonSel:IButtonStyle.chainButtonUnsel)),
        Gaps.hGap20,
        SizedBox(height: 60.w,width: 120.w,child:
        TextButton(onPressed:(){
          buttonSel = 3;
          setState(() {

          });
        }, child: Text(S.current.wallet_withdraw_omni,style: TextStyle(fontSize: 14,color:buttonSel==3?Colours.item_title_color:Colours.item_content_color),),style:  buttonSel==3?IButtonStyle.chainButtonSel:IButtonStyle.chainButtonUnsel)),
      ],
    );
  }


  // 选择币种
  void showChooseWalletAddress() {
    showModalBottomSheet(context: context,backgroundColor:Colours.transparent,builder:(BuildContext context) =>WalletAddressDialog(onItemClickListener: (index, option) {
      LogUtil.e("index = "+index.toString()+ "   option"+option.toString());
      if (option == 4) {
        NavigatorUtil.jump(context, Routes.walletWithdrawalAddressPage);
      }

    },));

  }



}
