import 'package:flutter/services.dart';
import "package:ipfsnets/include.dart";
import 'package:ipfsnets/ui/widget/login_button.dart';
import 'package:ipfsnets/utils/limit_formatter.dart';

class WalletExchangePage extends StatelessWidget {

  final  _inputFromController = TextEditingController();
  final  _inputToController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colours.bg_color,
      appBar: AppBar(
        title: new Text(S.current.wallet_exchange_title),
        centerTitle: true,
        backgroundColor: Colours.app_bar_bg,
        actions: [
          IconButton(icon: Icon(Icons.receipt_outlined,color: Colours.text_white,),onPressed: () {
            // NavigatorUtil.goRecordPage(context, BaseListFactory.WALLET_WITHDRAWAL_RECORD);
            NavigatorUtil.jump(context, Routes.walletExchangeRecordPage);

          },)
        ],
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child:
        Stack(
        children: [
          SizedBox(
              width: double.infinity,
              height: 70.h,
              child: Container(
                color: Colours.app_bar_bg,
              )),
          Column(
            children: [
              Container(
                width: double.infinity,
                margin: ITextStyles.containerMargin,
                padding: EdgeInsets.all(30.w),
                decoration: ITextStyles.boxDecoration,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildLeft(),
                    buildMiddle(),
                    buildRight(),

                  ],
                ),
              ),
              bulidBottom(context)
            ],
          )
        ],
      ),
      ),
    );
  }

  Column buildLeft() {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(children: [
          WidgetSpan(
              child: Image.asset(
                R.assetsImgIcFil,
                height: 40.w,
                width: 40.w,
              )),
          TextSpan(text: "  "),
          TextSpan(
              text: "11111",
              style: TextStyle(color: Colours.item_title_color, fontSize: 16)),

        ])),
        Gaps.vGap4,
        SizedBox(child:TextFormField(
          onChanged: (value) {
          },
          controller: _inputFromController,
          inputFormatters: [
            LengthLimitingTextInputFormatter(GlobalEntiy.MONEY_MAX_INPUT),
            LimitFormatter(2),
          ],
          maxLines: 1,
          style: TextStyle(fontSize: 14),
          decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: S.current.wallet_exchange_hint
          ),
        ),width: 250.w,),
        Gaps.vGap4,
        Text("1111",style: ITextStyles.itemContent,),
      ],
    );
  }

  Column buildRight() {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text.rich(TextSpan(children: [
          WidgetSpan(
              child: Image.asset(
                R.assetsImgIcFil,
                height: 40.w,
                width: 40.w,
              )),
          TextSpan(text: "  "),
          TextSpan(
              text: "11111",
              style: TextStyle(color: Colours.item_title_color, fontSize: 16)),
          TextSpan(text: "     "),
        ])),
        Gaps.vGap4,
        SizedBox(child:TextFormField(
          onChanged: (value) {
          },
          controller: _inputFromController,
          inputFormatters: [
            LengthLimitingTextInputFormatter(GlobalEntiy.MONEY_MAX_INPUT),
            LimitFormatter(2),
          ],
          textAlign: TextAlign.right,
          maxLines: 1,
          style: TextStyle(fontSize: 14),
          decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "111111111"
          ),
        ),width: 250.w,),
        Gaps.vGap4,
        Text("1111",style: ITextStyles.itemContent,textAlign: TextAlign.right,),
      ],
    );
  }

  Padding buildMiddle() {

    return Padding(padding: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 0),
      child: Image.asset(R.assetsImgIcExchange, width: 70.w,height: 70.w,)

      ,);
  }

  Container bulidBottom(BuildContext context) {
    return  Container(
        width: double.infinity,
        margin: ITextStyles.containerMargin,
        child: LoginButton(text: S.current.sure, endble: false, onPressed: (){
        }),);
  }
}
