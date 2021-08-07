
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/acount_entiy.dart';
import 'package:ipfsnets/ui/pages/me/cny/cny_withdrawal_end_controller.dart';
import 'package:ipfsnets/ui/widget/login_button.dart';
import 'package:ipfsnets/utils/toast_util.dart';

class CnyWithdrawalEndPage extends StatelessWidget {

  final CnyWithdrawalEndController controller = Get.put(CnyWithdrawalEndController());

  final _item1 = TextEditingController();
  final _item2 = TextEditingController();
  final _item3 = TextEditingController();
  final _item4 = TextEditingController();
  late String type;
  late String money;
  late AccountEntiy entiy;
   bool isBank = false;
  CnyWithdrawalEndPage({
    required this.type,
    required this.money,
  });


  @override
  Widget build(BuildContext context) {
    isBank = true;
    if ("1".endsWith(type)) {
      isBank = false;
    }
    controller.setType(type);
    controller.init();
    entiy = ModalRoute.of(context)!.settings.arguments as AccountEntiy;
    if (entiy != null) {
      if(isBank) {
        _item1.text = entiy.accountName;
        _item2.text = entiy.accountBank;
        _item3.text = entiy.accountNumber;
        controller.setitem1(entiy.accountName);
        controller.setitem2(entiy.accountBank);
        controller.setitem3(entiy.accountNumber);
      }else{
        _item1.text = entiy.accountName;
        _item2.text = entiy.accountNumber;
        controller.setitem1(entiy.accountName);
        controller.setitem2(entiy.accountNumber);
      }

    }
    
    
    return GetBuilder<CnyWithdrawalEndController>(builder:(controller){
      return   Scaffold(
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
    });

  }
  /**提现金额**/
  Padding buildMoney() {
    return Padding(padding: EdgeInsets.fromLTRB(0.w, 20.h, 50.w, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(money, style:TextStyle(fontSize:
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
              controller.changeItem1(value.toString());
            },
            controller: _item1,
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
              controller.changeItem2(value.toString());
            },
            controller: _item2,
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
              controller.changeItem3(value.toString());
            },
            controller: _item3,
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
              controller.changeItem4(value.toString());
            },
            controller: _item4,
            inputFormatters: [
              LengthLimitingTextInputFormatter(6)
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
          endble :controller.isEnable,
          onPressed: () async{
           bool ok =  await controller.putEnd(money);
           if (ok) {
             ToastUtil.show(S.current.option_success);
             Navigator.of(context).pop();
           }
          }),
    );
  }


}