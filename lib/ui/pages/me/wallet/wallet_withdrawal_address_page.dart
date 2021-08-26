import 'package:flutter/cupertino.dart';
import 'package:ipfsnets/http/wallet_api.dart';
import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/wallet_address_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/styles.dart';
import 'package:ipfsnets/ui/pages/me/wallet/wallet_withdrawal_address_controller.dart';
import 'package:ipfsnets/ui/widget/login_button.dart';

class WalletWithdrawalAddressPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WalletWithdrawalAddressState();
  }
}

class _WalletWithdrawalAddressState extends State<WalletWithdrawalAddressPage> {

  final  _addressController = TextEditingController();
  final  _nameController = TextEditingController();
  FocusNode _address = FocusNode();
  FocusNode _name = FocusNode();
  late WalletAddressEntity entity;
  WalletWithdrawalAddressController controller = Get.put(WalletWithdrawalAddressController());


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    entity = ModalRoute.of(context)!.settings.arguments as WalletAddressEntity;
    controller.intit(entity);
    if (entity.id != 0) {
      _addressController.text = entity.address;
      _nameController.text = entity.aliasName;
      controller.enable = true;
    }else{
      controller.enable = false;
    }

    return GetBuilder<WalletWithdrawalAddressController>(builder:(controller){
      return Scaffold(
          backgroundColor: Colours.bg_color,
          appBar: AppBar(
            title: new Text(getTitle()),
            centerTitle: true,
            backgroundColor: Colours.app_bar_bg,
          ),
          body: Container(
            child:  Column(
              children: [
                buildCoinTextField(context),
                Gaps.vGap12,
                buildAddressTextField(context),
                Gaps.line,
                buildNameTextField(context),
                Gaps.line,
                Gaps.vGap32,
                buildLogin(context)
              ],
            ),
          ));
    });


  }

  /**币种**/
  Container buildCoinTextField(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 30.w, 30.w, 30.w),
      color: Colours.white,
      child:Row(
        children: [
          Text(entity.coinName, style: ITextStyles.itemTitle),
          Expanded(child: SizedBox()),
          ImageUtil.loadImage(entity.coinIcon, 40.w, 40.w),
        ],
      ),
    );
  }

  /**地址**/
  Container buildAddressTextField(BuildContext context) {
    return Container(
      color: Colours.white,
      padding: EdgeInsets.fromLTRB(20.w, 10.w, 0, 5.w),
      child: new TextFormField(onChanged: (value){
        controller.onAddressInpiut(value);
      },
        controller: _addressController,
        style: TextStyle(fontSize: 14),
        focusNode: _address,
        decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: S.current.withdraw_address_hitn,
            suffixIcon: IconButton(
              icon: Image.asset(R.assetsImgIcWithdrawScan,width: 32.w,height: 32.w,),
              onPressed: () {
                _name.canRequestFocus = false;
                _address.canRequestFocus = false;
                FocusScope.of(context).requestFocus(FocusNode());
                Future.delayed(Duration(milliseconds: 300),(){
                  _name.canRequestFocus = true;
                  _address.canRequestFocus = true;
                  NavigatorUtil.pushResult(context, Routes.qrcodeScannerPage, (Object code) {
                    _addressController.text = code.toString();
                  });
                });

              },
            )
        ),
      ),
    );
  }

  /**名称**/
  Container buildNameTextField(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 5.w),
      color: Colours.white,
      child: new TextFormField(onChanged: (value){
        controller.onNameInpiut(value);
      },
        focusNode: _name,
        controller: _nameController,
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: S.current.withdraw_address_name,
        ),
      ),
    );
  }

  Padding buildLogin(BuildContext context) {
    return  Padding(padding: EdgeInsets.fromLTRB(50.w, 30.h, 50.w, 0),
      child: LoginButton(text: S.current.save,
          endble :controller.enable,
          onPressed: () {
                putData();
          }),
    );
  }

  // 顶部标题
  String getTitle() {
    if (entity.id == 0) {
      return S.current.withdraw_address_title;
    }else {
      return S.current.wallet_withdraw_address_edit_title;
    }
  }

  Future<void> putData() async {
    BaseEntity entity = await WalletApi.getWalletAccountAddressAdd(controller.entity.address, controller.entity.aliasName, controller.entity.coinName,controller.entity.coinCode, controller.entity.id);
    if (entity.isOk()) {
      ToastUtil.show(S.current.option_success);
    }
    NavigatorUtil.goBack(context);

  }


}
