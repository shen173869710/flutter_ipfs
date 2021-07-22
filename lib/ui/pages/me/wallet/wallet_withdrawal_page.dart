import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ipfsnets/data/global_entiy.dart';
import 'package:ipfsnets/dialog/wallet_account_dialog.dart';
import 'package:ipfsnets/dialog/wallet_address_dialog.dart';
import 'package:ipfsnets/http/wallet_api.dart';
import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/wallet_account_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/styles.dart';
import 'package:ipfsnets/ui/pages/me/wallet/wallet_withdrawal_controller.dart';
import 'package:ipfsnets/ui/widget/login_button.dart';
import 'package:ipfsnets/utils/LoadingUtils.dart';
import 'package:ipfsnets/utils/limit_formatter.dart';

class WalletWithdrawalPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _WalletWithdrawalState();
  }
}

class _WalletWithdrawalState extends State<WalletWithdrawalPage> {
  WalletWithdrawalController controller = Get.put(WalletWithdrawalController());
  // 提现输入的金币
  final  _inputMoneyController = TextEditingController();
  final  _addressController = TextEditingController();
  final  _markController = TextEditingController();

  FocusNode _address = FocusNode();
  FocusNode _money = FocusNode();
  FocusNode _mark = FocusNode();

  @override
  void initState() {
    controller.init();
    getInfo();
  }
  // 获取充币信息
  getInfo() async {
    LoadingUtils.show();
    BaseEntity entity = await WalletApi.getWalletWithdrawalList(2);
    List<WalletAccountEntity> list = entity.data;
    if (list != null && list.length > 0) {
      BaseEntity baseEntity = await WalletApi.getWalletWithdrawalHome(list[0].coinCode.toString(),false);
      controller.initData(list, baseEntity.data,0);
    }
    LoadingUtils.dismiss();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<WalletWithdrawalController>(builder:(controller){
      return Scaffold(
        backgroundColor: Colours.bg_color,
        appBar: AppBar(
          title: new Text(S.current.wallet_withdraw_title),
          centerTitle: true,
          backgroundColor: Colours.app_bar_bg,
          actions: [
            IconButton(icon: Icon(Icons.receipt_outlined,color: Colours.text_white,),onPressed: () {
              // NavigatorUtil.goRecordPage(context, BaseListFactory.WALLET_WITHDRAWAL_RECORD);
              NavigatorUtil.jump(context, Routes.walletWithdrawalRecordPage);

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
                      Visibility(child:Row(children: [
                        SizedBox(width: 20.w),
                        Text.rich(TextSpan(children: [
                          WidgetSpan(child: Image.asset(R.assetsImgIcNetAddress,
                            height: 30.w,
                            width: 30.w,
                          )),
                          TextSpan(text: "  "),
                          TextSpan(text: S.current.wallet_withdraw_money_name, style: TextStyle(color: Colours.item_title_color, fontSize: 16)),

                        ])),
                      ],
                      ), visible: controller.showMainAddress),
                      //
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
    });
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
              TextSpan(text: controller.type, style: TextStyle(color: Colours.item_title_color, fontSize: 16)),
              WidgetSpan(child: Image.asset(R.assetsImgIcArrow, height: 35.w, width: 35.w,))
            ])),
            onTap: (){
              showChooseWalletType();
            },
          )
        ],
      ),
    );
  }
  // 提币主链内容
  Container bulidInfo(BuildContext context) {
    return  Container(
        width: double.infinity,
        margin: ITextStyles.containerMargin,
        padding: EdgeInsets.fromLTRB(20.w, 30.w, 20.w, 30.w),
        decoration: ITextStyles.boxDecoration,
        child: Column(
          children: [
            Visibility(child: buildGrid(context),visible: controller.showMainAddress),
            Visibility(child: Gaps.vGap12,visible: controller.showMainAddress),
            Visibility(child: Gaps.line,visible: controller.showMainAddress),
            Gaps.vGap12,
            // 可提币数量
            Row(children: [
                Text(S.current.wallet_withdraw_num, style: ITextStyles.itemTitle16),
                Expanded(child: SizedBox()),
                Text(S.current.wallet_withdraw_out_hint+" "+controller.blance.toString()+" "+controller.type, style: ITextStyles.itemContent),
              ],
            ),
            Gaps.vGap12,
            buildNumAll(),
            Gaps.line,
            Gaps.vGap12,
            Row(
              children: [
                Text(S.current.wallet_withdraw_out_money+controller.poundage.toString(), style: ITextStyles.itemTitle),
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
              controller.withdrawalAddress(value);
            },
            controller: _addressController,
            maxLines: 1,
            focusNode: _address,
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

          GestureDetector(child: Image.asset(R.assetsImgIcWithdrawScan, width: 35.w,height: 35.w,),onTap: (){
            _money.canRequestFocus = false;
            _address.canRequestFocus = false;
            _mark.canRequestFocus = false;
            FocusScope.of(context).requestFocus(FocusNode());
            Future.delayed(Duration(milliseconds: 300),(){
              _money.canRequestFocus = true;
              _address.canRequestFocus = true;
              _mark.canRequestFocus = true;
              NavigatorUtil.pushResult(context, Routes.qrcodeScannerPage, (Object code) {
                _addressController.text = code.toString();
              });
            });
          },),
          Gaps.hGap12,
          GestureDetector(child: Image.asset(R.assetsImgIcWithdrawAddress, width: 35.w,height: 35.w,),onTap: (){
            showChooseWalletAddress();
          }),
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
                controller.withdrawalMark(value);
              },
              controller: _markController,
              focusNode: _mark,
              inputFormatters: [
                LengthLimitingTextInputFormatter(64)
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
            LoginButton(text: S.current.sure, endble: controller.enableButton, onPressed: (){
              controller.doWithdrawalSubmit();
            }),
            Gaps.vGap8,
            Text(controller.desc,style:ITextStyles.itemContent12)
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
              controller.withdrawalMoney(value);
            },
            controller: _inputMoneyController,
            inputFormatters: [
              LengthLimitingTextInputFormatter(GlobalEntiy.MONEY_MAX_INPUT),
              FilteringTextInputFormatter.allow(RegExp(r'^\d+(\.)?[0-9]{0,2}')),//数字包括小数
              LimitFormatter(2),
            ],
            maxLines: 1,
            focusNode: _money,
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: S.current.wallet_withdraw_min+controller.minBlance.toString()
            ),
          )),
          Expanded(child: SizedBox()),
          GestureDetector(child: Text(S.current.wallet_withdraw_all,
              style:TextStyle(fontSize:
              Dimens.font_sp14,color:
              Colours.button_sel)),onTap: (){
              _inputMoneyController.text = controller.blance.toString();
              controller.allClick(_inputMoneyController.text);

          },),

        ],
      ),
    );
  }

  Row buildGrid(BuildContext context){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gaps.hGap10,
        bulidItem0(),
        Gaps.hGap20,
        bulidItem1(),
        Gaps.hGap20,
        bulidItem2(),
        Gaps.hGap20,
        bulidItem3(),
      ],
    );
  }

  Visibility bulidItem0(){
    return Visibility(child: SizedBox(height: 60.w,width: 120.w,child:
    TextButton(onPressed:(){
      setState(() {
        _inputMoneyController.text = "";
       controller.onItemSel(0);
      });
    }, child: Text(controller.item0,style: TextStyle(fontSize: 14,color:controller.selItem0?Colours.item_title_color:Colours.item_content_color),),
        style:  controller.selItem0?IButtonStyle.chainButtonSel:IButtonStyle.chainButtonUnsel)),
      visible: controller.showItem0,);
  }
  Visibility bulidItem1(){
    return Visibility(child: SizedBox(height: 60.w,width: 120.w,child:
    TextButton(onPressed:(){
      setState(() {
        _inputMoneyController.text = "";
        controller.onItemSel(1);
      });
    }, child: Text(controller.item1,style: TextStyle(fontSize: 14,color:controller.selItem1?Colours.item_title_color:Colours.item_content_color),),
        style:controller.selItem1?IButtonStyle.chainButtonSel:IButtonStyle.chainButtonUnsel)),
      visible:controller.showItem1);
  }
  Visibility bulidItem2(){
    return Visibility(child: SizedBox(height: 60.w,width: 120.w,child:
    TextButton(onPressed:(){
      setState(() {
        _inputMoneyController.text = "";
        controller.onItemSel(2);
      });
    }, child: Text(controller.item2,style: TextStyle(fontSize: 14,color:controller.selItem2?Colours.item_title_color:Colours.item_content_color),),
        style:  controller.selItem2?IButtonStyle.chainButtonSel:IButtonStyle.chainButtonUnsel)),
      visible: controller.showItem2);
  }
  Visibility bulidItem3(){
    return Visibility(child: SizedBox(height: 60.w,width: 120.w,child:
    TextButton(onPressed:(){
      setState(() {
        _inputMoneyController.text = "";
        controller.onItemSel(3);
      });
    }, child: Text(controller.item3,style: TextStyle(fontSize: 14,color:controller.selItem3?Colours.item_title_color:Colours.item_content_color),),
        style:controller.selItem3?IButtonStyle.chainButtonSel:IButtonStyle.chainButtonUnsel)),
      visible: controller.showItem3);
  }


  // 选择币种
  void showChooseWalletType() {
    showModalBottomSheet(context: context,backgroundColor:Colours.transparent,builder:(BuildContext context) =>WalletAccountDialog(list:controller.listEntiy,onItemClickListener: (index, option) {
          setNewData(index);
    },));
  }

  setNewData(int index) async {
    BaseEntity baseEntity = await WalletApi.getWalletWithdrawalHome(controller.listEntiy[index].coinCode.toString(),true);
    if (baseEntity.isOk()) {
      controller.initData(controller.listEntiy, baseEntity.data, index);
    }
  }
  // 选择地址
  void showChooseWalletAddress() {
    showModalBottomSheet(context: context,backgroundColor:Colours.transparent,builder:(BuildContext context) =>WalletAddressDialog(onItemClickListener: (index, option, entiy) {
      if (option == GlobalEntiy.ADDRESS_SEL) {
        // 选中
        _addressController.text = entiy.address;
        controller.withdrawalAddress(entiy.address);
      }else  if (option == GlobalEntiy.ADDRESS_DEL) {
        // 删除
        controller.delAddress(entiy.id);
      } if (option == GlobalEntiy.ADDRESS_EDIT) {
        // 编辑
        entiy.coinCode = controller.coinCode;
        // 跳转去地址管理相关页面
        NavigatorUtil.push(context,'${Routes.walletWithdrawalAddressPage}',arguments: entiy);
      } if (option == GlobalEntiy.ADDRESS_ADD) {
        // 添加
        if(controller.typeIndex < controller.listEntiy.length) {
          entiy.coinIcon = controller.listEntiy[controller.typeIndex].coinIcon;
          entiy.coinName = controller.listEntiy[controller.typeIndex].coinName;
        }
        entiy.coinCode = controller.coinCode;
        // 跳转去地址管理相关页面
        NavigatorUtil.push(context,'${Routes.walletWithdrawalAddressPage}',arguments: entiy);
      }

    },id: controller.coinCode,));
  }

}
