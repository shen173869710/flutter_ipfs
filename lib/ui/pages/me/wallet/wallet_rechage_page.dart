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
import 'package:ipfsnets/ui/pages/me/wallet/wallet_rechage_controller.dart';
import 'package:ipfsnets/utils/LoadingUtils.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WalletRechagePage extends StatefulWidget{

  String coinCode = "";
  WalletRechagePage({required this.coinCode,});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WalletRechageState();
  }
}

class _WalletRechageState extends State<WalletRechagePage> {

  WalletRechageController controller = Get.put(WalletRechageController());
  @override
  void initState() {
    controller.init();
    getInfo();
  }
  // 获取充币信息
  getInfo() async {
    LoadingUtils.show();
    BaseEntity entity = await WalletApi.getWalletWithdrawalList(1);
    List<WalletAccountEntity> list = entity.data;
    if (list != null && list.length > 0) {
      LogUtil.e("传递过来的ID ======"+widget.coinCode);
      int index = 0;
      if (StringUtil.isNotEmpty(widget.coinCode)) {
        num id = num.parse(widget.coinCode);
        int size = list.length;
        for(int i = 0; i < size; i++) {
          if (id == list[i].coinCode) {
            index  = i;
          }
        }
      }

      BaseEntity baseEntity = await WalletApi.getWalletRechageHome(list[index].coinCode.toString(),false);
      controller.initData(list, baseEntity.data,index);
    }
    LoadingUtils.dismiss();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<WalletRechageController>(builder:(controller){
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
                      Visibility(child: Row(
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
                      ),visible: controller.showMainAddress,),
                      bulidInfo(context),
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
            child:
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: controller.type,
                  style: TextStyle(color: Colours.button_sel, fontSize: 16)),
              WidgetSpan(
                  child: Image.asset(
                    R.assetsImgIcArrow,
                    height: 35.w,
                    width: 35.w,
                  ))
            ])),
            onTap: (){
              showChooseWalletType();
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
            Visibility(child: buildGrid(context),visible: controller.showMainAddress),
            Visibility(child: Gaps.vGap12,visible: controller.showMainAddress),
            Visibility(child: Gaps.line,visible: controller.showMainAddress),
            Gaps.vGap12,
            Text(S.current.wallet_recharge_address,style: ITextStyles.itemTitle16,),
            Gaps.vGap8,
            Text(controller.address,style: TextStyle(fontSize: 14,color: Colours.button_sel),),
            Gaps.vGap8,
            Center(
              child:TextButton(onPressed:(){
                Clipboard.setData(ClipboardData(text: controller.address)).then((value) => ToastUtil.show(S.current.copy_success));

              },
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
              child: QrImage(data: controller.address,size: 300.w,),
              // child: Image.memory(controller.bytes,width: 300.w,height: 300.w,),
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
            Text(controller.desc,style:ITextStyles.itemContent12)
          ],

        ));
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
    BaseEntity baseEntity = await WalletApi.getWalletRechageHome(controller.listEntiy[index].coinCode.toString(),true);
    if (baseEntity.isOk()) {
      controller.initData(controller.listEntiy, baseEntity.data, index);
    }
  }

  // 选择地址
  void showChooseWalletAddress() {
    showModalBottomSheet(context: context,backgroundColor:Colours.transparent,builder:(BuildContext context) =>WalletAddressDialog(onItemClickListener: (index, option, entiy) {

      if (option == GlobalEntiy.ADDRESS_SEL) {
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
