import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ipfsnets/dialog/withdrawal_account_dialog.dart';
import "package:ipfsnets/include.dart";
import 'package:ipfsnets/ui/widget/login_button.dart';


class CnyWithdrawalPage extends StatelessWidget {

  final _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colours.bg_color,
      appBar: AppBar(
        title: new Text(S.current.cny_withdrawal_title),
        centerTitle: true,
        backgroundColor: Colours.app_bar_bg,
        actions: [
          IconButton(icon: Icon(Icons.receipt_outlined,color: Colours.text_white,),onPressed: () {
            NavigatorUtil.jump(context, Routes.cnyWithdrawalRecord);
          },)
        ],
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
                      Text(S.current.cny_withdrawal_money, style: TextStyle(
                        color: Colours.item_title_color,fontSize: 16
                      )),
                      Gaps.vGap8,
                      buildPhoneCode(context),
                      Gaps.line,
                      Gaps.vGap12,
                      Text(S.current.cny_withdrawal_commission, style: TextStyle(
                          color: Colours.item_title_color,fontSize: 14
                      )),
                    ],
                  ),
                ),
                buildLogin(context),
                Gaps.vGap8,
                Text(S.current.cny_withdrawal_record, style: TextStyle(
                    color: Colours.item_content_color,fontSize: 14
                )),
              ],
            )
          ],
        ),
      ),
    );
  }

  /**构建手机验证码**/
  Padding buildPhoneCode(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(0.w, 10.h, 50.w, 0),
      child: Row(
        children: [
          Expanded(child:  TextFormField(
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
                ),
          )),
          Expanded(child: SizedBox()),
          GestureDetector(child: Text(S.current.cny_withdrawal_all,
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
            showChoostAccountDialog(context);
          }),
    );
  }

  void showChoostAccountDialog(BuildContext context) {
    showModalBottomSheet(context: context,backgroundColor:Colours.transparent,builder:(BuildContext context) =>WithDrawalAccountDialog(onItemClickListener: (int index) {  },));
  }
}