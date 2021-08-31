import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/res/styles.dart';
import 'package:ipfsnets/utils/LoadingUtils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RecomondPage extends StatefulWidget {
  final String title;
  const RecomondPage(this.title) ;

  @override
  _RecomondState createState() => _RecomondState();
}

class _RecomondState extends State<RecomondPage> {
  GlobalKey repaintWidgetKey = GlobalKey();
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    print(widget.title);
    return Scaffold(
        appBar: AppBar(
          title: Text(S.current.me_item_15),
          centerTitle: true,
          backgroundColor: Colours.app_bar_bg,
          actions: [
            Center(
                child:GestureDetector(child: Text(S.current.save_photo+"    ",style: ITextStyles.textWhite14,),onTap: () async {
                  Map<Permission, PermissionStatus> permission = await [Permission.photos].request();
                  if (await Permission.photos.isGranted) {
                    print("照片权限申请通过");
                    _capturePngToByteData();
                  } else {
                    print("照片权限申请失败");
                  }

                },)
            )

          ],
        ),
        body: RepaintBoundary(
          child: bulieWebView(),
          key: repaintWidgetKey,
        )
    );
  }

  bulieWebView() {
    return Stack(
      children: [
        Image.asset(R.assetsImgIcRecmmondBg,width: double.infinity,height: double.infinity,fit: BoxFit.fill,),
        Positioned(
          bottom: 50.w,
          left: 20.w,
          child: Text(widget.title, style: ITextStyles.textWhite14,),
        ),
        Positioned(
          bottom: 5.w,
          right: 15.w,
          child: QrImage(data: GlobalEntiy.web_qrcode+widget.title,size: 146.w,),
        )
      ],
    );
  }
  Future _capturePngToByteData() async {
    try {
      RenderRepaintBoundary? boundary = repaintWidgetKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      double dpr = ui.window.devicePixelRatio; // 获取当前设备的像素比
      ui.Image image = await boundary.toImage(pixelRatio: dpr);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      LoadingUtils.show();
      var result = await ImageGallerySaver.saveImage(pngBytes, quality: 60);
      if (result != null && result.toString().contains("true")) {
        ToastUtil.show(S.current.save_success);
      }else{
        ToastUtil.show(S.current.save_faile);
      }
      LoadingUtils.dismiss();
    } catch (e) {
      ToastUtil.show(S.current.save_faile);
      LoadingUtils.dismiss();
      print(e);
    }
    return null;
  }


}
