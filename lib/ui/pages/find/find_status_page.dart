import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/res/styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FindStatusPage extends StatefulWidget {
  @override

  _FindStatusPageState createState() => _FindStatusPageState();
}


class _FindStatusPageState extends State<FindStatusPage> {

  final Completer<WebViewController> _controller = Completer<WebViewController>();
  int _progressValue = 0;
  GlobalKey repaintWidgetKey = GlobalKey();

  final String url = "http://124.16.8.140:84/notice-list";

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
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
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          allowsInlineMediaPlayback: true,
          // navigationDelegate: (NavigationRequest request){
          //   if (request.url.contains("notice-list")) {
          //     NavigatorUtil.goWebViewNewPage(context, "title", request.url);
          //     return NavigationDecision.prevent;
          //   }
          //   return NavigationDecision.navigate;
          // },
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
}
