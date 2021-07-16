import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ipfsnets/dialog/image_picker_dialog.dart';
import 'package:ipfsnets/dialog/qrcode_dialog.dart';
import "package:ipfsnets/include.dart";
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.bg_color,
      appBar: AppBar(
        title: new Text(S.current.cny_rechage_record_title),
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
                        child: _image==null?Image.asset(
                          R.assetsImgIcAdd,
                          width: 160.h,
                          height: 160.h,
                          fit: BoxFit.cover,
                        ):Image.file(_image!,width: 160.h,
                          height: 160.h,
                          fit: BoxFit.cover,),
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
                buildNameAndAccount(S.current.cny_rechage_collection_card,S.current.cny_rechage_collection_card,R.assetsImgIcCopy),
                Gaps.vGap12,
                buildNameAndAccount(S.current.cny_rechage_collection_number,S.current.cny_rechage_collection_number,R.assetsImgIcCopy),
                Gaps.vGap12,
                buildAccountType(S.current.cny_rechage_collection_type,S.current.cny_rechage_collection_type),
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
    showCupertinoDialog(context: context, builder:(BuildContext context) =>QrcodeDialog());

  }

  void fromCamera() async{
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      LogUtil.e("=="+pickedFile.path.toString());
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void fromPhoteo() async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      LogUtil.e("=="+pickedFile.path.toString());
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _onButtonPressed(BuildContext _context) {
    showModalBottomSheet(
        context: _context,
        builder: (__context) {
          return Container(
            color: Color(0xff737373),
            child: Container(
              margin: EdgeInsets.fromLTRB(8, 0, 8, 8),
              decoration: BoxDecoration(
                  color: Theme.of(__context).canvasColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10),
                    topRight: const Radius.circular(10),
                    bottomLeft: const Radius.circular(10),
                    bottomRight: const Radius.circular(10),
                  )),
              child: Column(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.share),
                      title: Text("分享"),
                      onTap: (){

                      }),
                  Divider(height: 0),
                  ListTile(
                      leading: Icon(Icons.favorite),
                      title: Text("收藏"),
                      onTap: () {

                  }),
                  Divider(height: 0),
                  ListTile(
                      leading: Icon(Icons.favorite),
                      title: Text("收藏"),
                      onTap: () {

                      }),
                ],
              ),
            ),
          );
        });
  }
}
