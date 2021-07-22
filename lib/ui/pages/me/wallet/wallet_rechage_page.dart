import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ipfsnets/data/global_entiy.dart';
import 'package:ipfsnets/dialog/wallet_account_dialog.dart';
import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/wallet_entiy.dart';
import 'package:ipfsnets/res/styles.dart';

class WalletRechagePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WalletRechageState();
  }
}

class _WalletRechageState extends State<WalletRechagePage> {
  List<WalletEntiy> list = List.from(GlobalEntiy.walletList);
  int buttonSel = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colours.bg_color,
      appBar: AppBar(
        title: new Text(S.current.wallet_recharge_title),
        centerTitle: true,
        backgroundColor: Colours.app_bar_bg,
        actions: [
          IconButton(icon: Icon(Icons.receipt_outlined,color: Colours.text_white,),onPressed: () {
            NavigatorUtil.jump(context, Routes.walletRechageRecordPage);
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
                  style: TextStyle(color: Colours.button_sel, fontSize: 16)),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildItem(context),
            Gaps.vGap12,
            Gaps.line,
            Gaps.vGap12,
            Text(S.current.wallet_recharge_address,style: ITextStyles.itemTitle16,),
            Gaps.vGap8,
            Text("111111111111111111111111111111",style: TextStyle(fontSize: 14,color: Colours.button_sel),),
            Gaps.vGap8,
            Center(
              child:TextButton(onPressed:(){},
                  child: Text(S.current.wallet_recharge_copy,style: TextStyle(fontSize: 14,color:Colours.button_sel),),
                  style:ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {return Colours.chain_bg;
                      },
                    ),
                    shape: MaterialStateProperty.all(StadiumBorder(side: BorderSide(color:Colours.transparent,style: BorderStyle.solid))),
                    minimumSize: MaterialStateProperty.all(Size(250.w, 60.w)),
                  )),
            ),
            Gaps.vGap8,
            Gaps.line,
            Gaps.vGap12,
            Center(
              child: ImageUtil.loadImage("111", 300.w, 300.w),
            ),
            Gaps.vGap12,
            Center(child: Text(S.current.wallet_recharge_scan,style: ITextStyles.itemTitle)),

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
    showModalBottomSheet(context: context,backgroundColor:Colours.transparent,builder:(BuildContext context) =>WalletAccountDialog(list:[],onItemClickListener: (index, option) {
      LogUtil.e("index = "+index.toString()+ "   option"+option.toString());
      if (option == 4) {
        NavigatorUtil.jump(context, Routes.walletWithdrawalAddressPage);
      }

    },));

  }



}
