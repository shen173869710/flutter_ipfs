import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ipfsnets/dialog/withdrawal_account_dialog.dart';
import "package:ipfsnets/include.dart";
import 'package:ipfsnets/ui/widget/login_button.dart';


class CnyWithdrawalEndPage extends StatelessWidget {
  final _usernameController = TextEditingController();
  late String type;
   bool isBank = false;
  CnyWithdrawalEndPage({
    required this.type,
  });


  @override
  Widget build(BuildContext context) {
    isBank = false;
    if ("1".endsWith(type)) {
      isBank = true;
    }

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colours.bg_color,
      appBar: AppBar(
        title: new Text(isBank?S.current.cny_withdrawal_end_bank_title:S.current.cny_withdrawal_end_alipay_title),
        centerTitle: true,
        backgroundColor: Colours.app_bar_bg,
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
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
                Container(
                  width: double.infinity,
                  margin: ITextStyles.containerMargin,
                  padding: EdgeInsets.all(20.w),
                  decoration: ITextStyles.boxDecoration,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.current.cny_withdrawal_end_money, style: TextStyle(
                        color: Colours.item_title_color,fontSize: 16
                      )),
                      buildMoney(),
                    ],
                  ),
                ),
                buildInpuInfo(),
                buildLogin(context),
                Gaps.vGap8,
                Text(isBank?S.current.cny_withdrawal_end_band_desc:S.current.cny_withdrawal_end_alipay_desc, style: TextStyle(
                    color: Colours.item_content_color,fontSize: 14
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
  /**提现金额**/
  Padding buildMoney() {
    return Padding(padding: EdgeInsets.fromLTRB(0.w, 20.h, 50.w, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("11111", style:TextStyle(fontSize:
              Dimens.font_sp18,color:
              Colours.item_red)),
          Gaps.hGap4,
          Text("CNY",style:TextStyle(fontSize:
          Dimens.font_sp12,color:
          Colours.item_title_color)),
        ],
      ),
    );
  }

  /***提现的用户信息***/
  Container buildInpuInfo() {
    return   Container(
      width: double.infinity,
      margin: ITextStyles.containerMargin,
      padding: EdgeInsets.all(20.w),
      decoration: ITextStyles.boxDecoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            onChanged: (value) {
            },
            controller: _usernameController,
            inputFormatters: [
              LengthLimitingTextInputFormatter(20)
            ],
            decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: S.current.cny_withdrawal_end_bank_name,
            ),
          ),
          Gaps.line,
          TextFormField(
            onChanged: (value) {
            },
            controller: _usernameController,
            inputFormatters: [
              LengthLimitingTextInputFormatter(20)
            ],
            decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: isBank?S.current.cny_withdrawal_end_bank_account:S.current.cny_withdrawal_end_alipay_account,
            ),
          ),
          Gaps.line,
          Visibility(visible: isBank, child: TextFormField(
            onChanged: (value) {
            },
            controller: _usernameController,
            inputFormatters: [
              LengthLimitingTextInputFormatter(20)
            ],
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: S.current.cny_withdrawal_end_bank_address,
            ),
          )),
          Visibility(visible: isBank,child: Gaps.line),
          buildPhoneCode(),
        ],
      ),
    );
  }

  /**构建手机验证码**/
  Padding buildPhoneCode() {
    return Padding(padding: EdgeInsets.fromLTRB(0.w, 10.h, 0.w, 0),
      child: Row(
        children: [
          Expanded(child:
          TextFormField(
            onChanged: (value) {
            },
            controller: _usernameController,
            inputFormatters: [
              LengthLimitingTextInputFormatter(20)
            ],
            decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: S.current.login_forgot_code_hint
                ),
          )),
          Expanded(child: SizedBox()),
          GestureDetector(child: Text(S.current.login_forgot_code,
              style:TextStyle(fontSize:
              Dimens.font_sp14,color:
              Colours.button_sel)),onTap: (){
          },),

        ],
      ),
    );
  }

  Padding buildLogin(BuildContext context) {
    return  Padding(padding: EdgeInsets.fromLTRB(30.w, 30.h, 30.w, 0),
      child: LoginButton(text: S.current.sure,
          endble :true,
          onPressed: () {

          }),
    );
  }


}