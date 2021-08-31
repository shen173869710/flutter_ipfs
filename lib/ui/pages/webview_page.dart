import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
/// 保存文件或图片到本地
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/res/styles.dart';
import 'package:ipfsnets/utils/device_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  final String title;
  final String url;

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  final Completer<WebViewController> _controller = Completer<WebViewController>();
  int _progressValue = 0;
  GlobalKey repaintWidgetKey = GlobalKey();
  bool show = false;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    LogUtil.e(widget.url);
    if (Device.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.url.contains("?code=")) {
      show = true;
    }
    return FutureBuilder<WebViewController>(
      future: _controller.future,
      builder: (context, snapshot) {
        return WillPopScope(
          onWillPop: () async {
            if (snapshot.hasData) {
              final bool canGoBack = await snapshot.data!.canGoBack();
              if (canGoBack) {
                // 网页可以返回时，优先返回上一页
                await snapshot.data!.goBack();
                return Future.value(false);
              }
            }
            return Future.value(true);
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              centerTitle: true,
              backgroundColor: Colours.app_bar_bg,
              actions: [
                Center(
                  child:GestureDetector(child: Text("保存图片   ",style: ITextStyles.textWhite14,),onTap: (){
                    _capturePngToByteData();
                  },)
                )

              ],
            ),
            body: RepaintBoundary(
              child: bulieWebView(),
              key: repaintWidgetKey,
            )
          ),
        );
      }
    );
  }

  bulieWebView() {
    return Stack(
      children: [
        WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          allowsInlineMediaPlayback: true,

          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onProgress: (int progress) {
            print('WebView is loading (progress : $progress%)');
            setState(() {
              _progressValue = progress;
            });
          },
        ),
        if (_progressValue != 100) LinearProgressIndicator(
          value: _progressValue / 100,
          backgroundColor: Colors.transparent,
          minHeight: 2,
        ) else Gaps.empty,
      ],
    );
  }
  Future _capturePngToByteData() async {
    print("保存识别--------------_capturePngToByteData");
    try {
      RenderRepaintBoundary? boundary = repaintWidgetKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      double dpr = ui.window.devicePixelRatio; // 获取当前设备的像素比
      ui.Image image = await boundary.toImage(pixelRatio: dpr);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      // Uint8List sourceBytes = _byteData!.buffer.asUint8List();
      // final result = await ImageGallerySaver.saveImage(Uint8List.fromList(byteData!));
      // File file = File(result);
      // if (file.existsSync()) {
      //   print(file.path);
      // }else{
      //   print("保存识别");
      // }
    } catch (e) {
      print("保存识别--------------");
      print(e);
    }
    return null;
  }


}
