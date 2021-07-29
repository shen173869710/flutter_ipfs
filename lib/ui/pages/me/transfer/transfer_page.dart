import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ipfsnets/dialog/wallet_account_dialog.dart';
import 'package:ipfsnets/http/transfer_api.dart';
import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/transfer_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/styles.dart';
import 'package:ipfsnets/ui/pages/me/transfer/transfer_controller.dart';
import 'package:ipfsnets/ui/widget/login_button.dart';
import 'package:qr_flutter/qr_flutter.dart';


class TransferPage extends StatefulWidget{

  String coinCode = "";
  TransferPage({required this.coinCode,});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TransferState();
  }
}

class _TransferState extends State<TransferPage>  with TickerProviderStateMixin{

  List<String> ITEMS = [
    S.current.transfer_out_item_1,
    S.current.transfer_out_item_2,
    S.current.transfer_out_item_3,
    S.current.transfer_out_item_4,
    S.current.transfer_out_item_5,
    S.current.transfer_out_item_6
  ];
  List<String> ITEMS_HINE = [
    S.current.transfer_out_item_1_hint,
    S.current.transfer_out_item_2_hint,
    S.current.transfer_out_item_3_hint,
    S.current.transfer_out_item_4_hint,
    S.current.transfer_out_item_5_hint,
    S.current.transfer_out_item_6_hint
  ];


  final _item1Controller = TextEditingController();
  final _item2Controller = TextEditingController();
  final _item3Controller = TextEditingController();
  final _item4Controller = TextEditingController();
  final _item5Controller = TextEditingController();
  final _item6Controller = TextEditingController();

  TeansferController controller = Get.put(TeansferController());
  late TabController tabController;

  @override
  void initState() {
    this.tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      controller.setItemSel(tabController.index);
    });
    controller.init();
    getInfo();

  }
  // 获取充币信息
  getInfo() async {
    BaseEntity entity = await TransferApi.transferList();
    List<TransferEntity> list = entity.data;
    if (list != null && list.length > 0) {
      int index = 0;
      if (StringUtil.isNotEmpty(widget.coinCode)) {
        num code = num.parse(widget.coinCode);
        for(int i = 0; i < list.length; i++) {
          if (code == list[i].coinCode) {
            index = i;
          }
        }
      }
      controller.initData(list, index);
    }else{
      ToastUtil.show(entity.msg);
    }


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<TeansferController>(builder:(controller){
      return Scaffold(
        backgroundColor: Colours.bg_color,
        appBar: AppBar(
          title: new Text(S.current.transfer_title),
          centerTitle: true,
          backgroundColor: Colours.app_bar_bg,
          actions: [
            IconButton(icon: Icon(Icons.receipt_outlined,color: Colours.text_white,),onPressed: () {
              NavigatorUtil.jump(context, Routes.transferRecordPage);
            },)
          ],
        ),
        body:Container(
          child: Stack(
            children: [
              SizedBox(
                  width: double.infinity,
                  height: 70.h,
                  child: Container(
                    color: Colours.app_bar_bg,
                  )),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  bulidTop(),
                  buildItem(),
                  Expanded(child: TabBarView(
                    controller: tabController,
                    children: [
                      bulidOut(context),
                      bulidIn(context),
                    ],)),
                  bulidBottom(context),
                  Gaps.vGap10
                ],
              )
            ],
          ),
        )

      );
    });
  }
  // 创建顶部
  // 创建标题
  Container buildItem() {
    return Container(
      alignment: Alignment.topLeft,
      child: TabBar(
        controller: tabController,
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: Colours.item_title_color,
        unselectedLabelColor: Colours.item_content_color,
        tabs: [
          Tab(text: S.current.transfer_item_1),
          Tab(text: S.current.transfer_item_2)
        ],
      ),
    );
  }
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
  // 创建 收款收账
  Container bulidIn(BuildContext context) {
    return  Container(
        width: double.infinity,
        margin: ITextStyles.containerMargin,
        padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 30.w),
        decoration: ITextStyles.boxDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.vGap12,
            Text(S.current.transfer_out_item_in_account,style: ITextStyles.itemTitle16,),
            Gaps.vGap8,
            Text(controller.inAccount,style: TextStyle(fontSize: 14,color: Colours.button_sel),),
            Gaps.vGap8,
            Center(child:TextButton(onPressed:(){
              Clipboard.setData(ClipboardData(text: controller.inAccount)).then((value) => ToastUtil.show(S.current.copy_success));
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
              child: QrImage(data: controller.inAccount,size: 300.w,),
              // child: Image.memory(controller.bytes,width: 300.w,height: 300.w,),
            ),
            Gaps.vGap12,
            Center(child: Text(S.current.transfer_out_item_in_qrcode,style: ITextStyles.itemTitle)),

          ],

        ));
  }
  // 创建 内网转出
  Container bulidOut(BuildContext context) {
    return  Container(
        width: double.infinity,
        margin: ITextStyles.containerMargin,
        padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 30.w),
        decoration: ITextStyles.boxDecoration,
        child: Column(
          children: [
            // buildInput(context, title, hint)
            buildInput(context, ITEMS[0],ITEMS_HINE[0],_item1Controller,1),
            // buildInput(context, ITEMS[1],ITEMS_HINE[1],_item2Controller,2),
            buildMoney(context, ITEMS[2],ITEMS_HINE[2],_item3Controller,3),
            Gaps.vGap10,
            builtOther(context, ITEMS[3]),
            Gaps.vGap8,
            buildPhoneCode(context,ITEMS[4],ITEMS_HINE[4],_item5Controller,5),
            buildInput(context, ITEMS[5],ITEMS_HINE[5],_item6Controller,6),
          ],

        ));
  }
  // 底部
  Container bulidBottom(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: ITextStyles.containerMargin,
        child: Visibility(
          visible: controller.itemSel==0?true:false,
            child: LoginButton(
                text: S.current.sure,
                endble: controller.enableButton,
                onPressed: () async {
                   bool ok =  await controller.doTransfer();
                   if(ok) {
                     ToastUtil.show(S.current.option_success);
                   }
                })));
  }

  // 选择币种
  void showChooseWalletType() {
    showModalBottomSheet(context: context,backgroundColor:Colours.transparent,builder:(BuildContext context) =>WalletAccountDialog(list:controller.listEntiy,onItemClickListener: (index, option) {
      controller.initView(index);
    },));
  }

  /**构建手机验证码**/
  Padding buildPhoneCode(BuildContext context,String title, String hint,TextEditingController _controller,int index) {
    return Padding(padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0),
      child: Row(
        children: [
          Text(title, style: ITextStyles.itemTitle,),
          Gaps.hGap4,
          Expanded(child:  TextFormField(
            onChanged: (value) {
              controller.setValue(value.toString(), index);
            },
            style: ITextStyles.itemTitle,
            controller: _controller,
            inputFormatters: [
              LengthLimitingTextInputFormatter(6),
              FilteringTextInputFormatter.allow(RegExp("[0-9]")),
            ],
            decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: hint
            ),
          )),

          Expanded(child: SizedBox()),
          GestureDetector(child: Text(S.current.login_forgot_code, style:TextStyle(fontSize:
              Dimens.font_sp14,color:
              Colours.button_sel)),onTap: (){
          },),

        ],
      ),
    );
  }
  /**内网转出item**/
  Row buildInput(BuildContext context, String title, String hint,TextEditingController _controller,int index) {
    return Row(
      children: [
        Text(title, style: ITextStyles.itemTitle,),
        Expanded(child: TextFormField(
          onChanged: (value) {
            controller.setValue(value.toString(), index);
          },
          style: ITextStyles.itemTitle,
          controller: _controller,
          textAlign: TextAlign.right,
          maxLines: 1,
          inputFormatters: [
            LengthLimitingTextInputFormatter(32),
          ],
          decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: hint
          ),
        )),
      ],
    );
  }

  /**内网转出item**/
  Row buildMoney(BuildContext context, String title, String hint,TextEditingController _controller,int index) {
    return Row(
      children: [
        Text(title, style: ITextStyles.itemTitle,),
        Expanded(child: TextFormField(
          onChanged: (value) {
            controller.setValue(value.toString(), index);
          },
          style: ITextStyles.itemTitle,
          controller: _controller,
          textAlign: TextAlign.right,
          maxLines: 1,
          inputFormatters: [
            LengthLimitingTextInputFormatter(18),
          ],
          decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: hint
          ),
        )),
      ],
    );
  }
  /**内网转出item**/
  Row builtOther(BuildContext context, String title) {
    return Row(
      children: [
        Text(title, style: ITextStyles.itemTitle,),
        Expanded(child: SizedBox()),
        Text(controller.poundage, style: ITextStyles.itemContent,),
      ],
    );
  }
}
