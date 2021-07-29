import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ipfsnets/dialog/image_picker_dialog.dart';
import 'package:ipfsnets/dialog/qrcode_dialog.dart';
import 'package:ipfsnets/http/api_service.dart';
import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/image_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/ui/pages/me/cny/cny_rechage_controller.dart';
import 'package:ipfsnets/utils/string_util.dart';
import 'package:ipfsnets/utils/toast_util.dart';


class CnyRechagePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CnyRechageStatus();
  }
}


class _CnyRechageStatus extends State<CnyRechagePage> {


  File? _image;
// 实例化
  final picker = ImagePicker();
  String? _headUrl = "";
  CnyRechargeController controller = Get.put(CnyRechargeController());

  @override
  void initState() {
    controller.getAccountInfo();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CnyRechargeController>(
        builder:(controller)  {
          return
            Scaffold(
              backgroundColor: Colours.bg_color,
              appBar: AppBar(
                title: new Text(S.current.cny_rechage_title),
                centerTitle: true,
                backgroundColor: Colours.app_bar_bg,
                actions: [
                  IconButton(icon: Icon(Icons.receipt_outlined,color: Colours.text_white,),onPressed: () {
                    NavigatorUtil.jump(context, Routes.cnyRechageRecord);
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Gaps.vGap16,

                              GestureDetector(
                                child: StringUtil.isEmpty(_headUrl!)?Image.asset(R.assetsImgIcAddFile,width: 160.h,height: 160.h,fit: BoxFit.cover,):ImageUtil.loadImage(_headUrl!, 160.h, 160.h),
                                onTap: (){
                                  choosePhoto();
                                },
                              ),

                              Gaps.vGap12,
                              ElevatedButton(
                                // 按钮样式
                                  style: IButtonStyle.updateButton,
                                  onPressed: () {
                                    updateImage(context);
                                  },
                                  child: Text(S.current.cny_rechage_upload, style: TextStyle(
                                      color: Colours.text_white,fontSize: 14
                                  ))),
                              Gaps.vGap12,
                              Text(S.current.cny_rechage_desc, style: ITextStyles.itemContent,),
                              Gaps.vGap12,
                            ],
                          ),
                        ),
                        bulidInfo(context)
                      ],
                    )
                  ],
                ),
              ),
            );
        });
  }


  // 创建收款账户信息
  Container bulidInfo(BuildContext context) {
    return Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.w),
            margin: ITextStyles.containerMargin,
            decoration: ITextStyles.boxDecoration,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gaps.vGap8,
                Row(
                  children: [
                    Expanded(child: Text(S.current.cny_rechage_wallet, style: ITextStyles.mainTitle,))
                  ],
                ),
                Gaps.vGap12,
                buildNameAndAccount(S.current.cny_rechage_collection_card,controller.accountName,R.assetsImgIcCopy),
                Gaps.vGap12,
                buildNameAndAccount(S.current.cny_rechage_collection_number,controller.accountNumber,R.assetsImgIcCopy),
                Gaps.vGap12,
                buildAccountType(S.current.cny_rechage_collection_type,controller.accountType),
                Gaps.vGap12,
                buildAccountQrcode(S.current.cny_rechage_collection_qrcode,R.assetsImgIcErweima,context),
                Gaps.vGap12,
              ],
            ));
  }

  /**创建内容**/
  Row buildNameAndAccount(String title, String info, String image){
    return  Row(
      children: [
        Text(title, style: ITextStyles.itemContent,),
        Expanded(child: SizedBox()),
        Text.rich(TextSpan(
          children: [
            TextSpan(text:info, style: ITextStyles.itemTitle),
            TextSpan(text: " "),
            WidgetSpan(child: GestureDetector(child: Image.asset(image, height: 30.w, width: 30.w,),onTap: (){
                        copy(info);
            },),),
          ]
        ))
      ],
    );
  }

  Row buildAccountType(String title, String info){
    return  Row(
      children: [
        Text(title, style: ITextStyles.itemContent,),
        Expanded(child: SizedBox()),
        Text.rich(TextSpan(
            children: [
              TextSpan(text:info, style: ITextStyles.itemTitle),
            ]
        ))
      ],
    );
  }

  Row buildAccountQrcode(String title, String image,BuildContext context){
    return  Row(
      children: [
        Text(title, style: ITextStyles.itemContent,),
        Expanded(child: SizedBox()),
        Text.rich(TextSpan(
            children: [
              WidgetSpan(child: GestureDetector(child: Image.asset(image, height: 35.w, width: 35.w,),onTap: (){
                showQrcode(title);
              },)),
            ]
        ))
      ],
    );
  }

  // 选择图片
  void choosePhoto() async{
    LogUtil.e("choosePhoto() ");
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => ImagePickerDialog(onItemClickListener: (index){
         if(index == 1) {
            fromCamera();
         }else if (index == 2) {
            fromPhoteo();
         }
      },),
    ).then((value) {});
  }

  // 上传图片
  void updateImage(BuildContext context) {
    LogUtil.e("updateImage() ");
    _onButtonPressed(context);
  }

  // 点击复制
  void copy(String content) {
    LogUtil.e("copy() "+content);
    Clipboard.setData(ClipboardData(text: content));
    ToastUtil.show(S.current.save_success);
  }

  // 查看二维码
  void showQrcode(String url) {
    LogUtil.e("showQrcode() "+url);
    if (StringUtil.isNotEmpty(controller.qrCode)) {
      showCupertinoDialog(context: context, builder:(BuildContext context) =>QrcodeDialog(controller.qrCode,controller.accountType));
    }


  }

  void fromCamera() async{
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      LogUtil.e("=="+pickedFile.path.toString());

      BaseEntity baseEntity = await ApiServer.uploadFile(_image!);
      if (baseEntity != null && baseEntity.code == 200) {
        ImageEntity entity = baseEntity.data;
        LogUtil.e("url==" + entity.url!);
        if (entity != null) {
          setState(() {
            _headUrl = entity.url;
          });
          ToastUtil.show(S.current.option_success);
        }
      }
    }
  }

  void fromPhoteo() async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      LogUtil.e("==" + pickedFile.path.toString());
      // setState(() {
      _image = File(pickedFile.path);
      BaseEntity baseEntity = await ApiServer.uploadFile(_image!);
      if (baseEntity != null && baseEntity.code == 200) {
        ImageEntity entity = baseEntity.data;
        if (entity != null) {
          setState(() {
            _headUrl = entity.url;
            ToastUtil.show(S.current.option_success);
          });
        }
        LogUtil.e("fromPhoteo url==" + entity.url!);
      }
      LogUtil.e("code ==" + baseEntity.code.toString());
    }
  }

  void _onButtonPressed(BuildContext _context) {
    controller.putEvidence(_headUrl!);
  }


}
