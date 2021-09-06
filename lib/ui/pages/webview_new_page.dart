import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/res/styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewNewPage extends StatefulWidget {
  const WebViewNewPage({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  final String title;
  final String url;

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewNewPage> {


  @override
  void initState() {
    super.initState();
    LogUtil.e(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: WebviewScaffold(
            //要打开的网址
            url: widget.url,
            withZoom: true,
            withLocalStorage: true,
            hidden: true,
          ),
        )
      );
  }


}
