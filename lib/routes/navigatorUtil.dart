import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/routes/application.dart';
import 'package:ipfsnets/routes/routers.dart';
import 'package:ipfsnets/ui/pages/index_page.dart';
import 'package:ipfsnets/ui/pages/login_page.dart';

class NavigatorUtil {
  // 返回
  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  // 带参数返回
  static void goBackWithParams(BuildContext context, result) {
    Navigator.pop(context, result);
  }

  // 路由返回指定页面
  static void goBackUrl(BuildContext context, String title) {
    Navigator.popAndPushNamed(context, title);
  }

  // 路由跳转到主页面
  static void goHomePage(BuildContext context) {
    Application.router!.navigateTo(context, Routes.root, replace: true,transition: TransitionType.inFromRight); // 如果有给路由赋值就用Routes.root  root是routes文件定义的字符串路径，没有直接用"/"等路由
  }


  // 跳转到转场动画页面
  static Future jump(BuildContext context, String title) {
    return Application.router!.navigateTo(context, title, transition: TransitionType.inFromRight);
  }


  /// 框架自带的有 native，nativeModal，inFromLeft，inFromRight，inFromBottom，fadeIn，custom

  static Future jumpLeft(BuildContext context, String title) {
    return Application.router!.navigateTo(context, title, transition: TransitionType.inFromLeft);
  }


  static Future jumpRemove(BuildContext context) {
    return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => IndexPage(),), (route) => route == null);
  }

  static Future jumpLogin(BuildContext context) {
    return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage(),), (route) => route == null);
  }

//  自定义转场动画
  static Future gotransitionCustomDemoPage(BuildContext context, String title) {
    var transition = (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return new ScaleTransition(
          scale: animation,
          child: new RotationTransition(
            turns: animation,
            child: child,
          )
      );
    };
    return Application.router!.navigateTo(context, title,
        transition: TransitionType.custom,
//    指定自定义动画
        transitionBuilder: transition,
//    自定义动画
        transitionDuration: const Duration(milliseconds: 600));

  }


  /// 使用 IOS 的 Cupertino 的转场动画，这个是修改了源码的 转场动画
  /// /// Fluro本身不带，但是 Flutter自带
  // static Future gotransitionCupertinoDemoPage(
  //     BuildContext context, String title) {
  //   return Application.router.navigateTo(context, title, transition: TransitionType.cupertino);
  // }

// 跳转到主页面并删除当前路由
  static void goToHomeRemovePage(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => IndexPage(),
        ), (route) => route == null);
  }
//
// 跳转到登陆页并删除当前路由
  static void goToLoginRemovePage(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => IndexPage(),
        ), (route) => route == null);

  }

  // 跳转到登陆页并删除当前路由
  static void goToLogin(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ), (route) => route == null);

  }

  /// 跳到WebView页
  static void goWebViewPage(BuildContext context, String title, String url) {
    //fluro 不支持传中文,需转换
    push(context, '${Routes.webViewPage}?title=${Uri.encodeComponent(title)}&url=${Uri.encodeComponent(url)}');
  }


  /// 跳到WebView页
  static void goPasswordPage(BuildContext context, String type) {
    //fluro 不支持传中文,需转换
    push(context, '${Routes.passwordPage}?type=${Uri.encodeComponent(type)}');
  }

  static void goWithdrawal(BuildContext context,String type) {
    //fluro 不支持传中文,需转换
    push(context, '${Routes.cnyWithdrawal}?type=${Uri.encodeComponent(type)}');
  }

  /// 跳到记录相关页面
  static void goRecordPage(BuildContext context, String type) {
    //fluro 不支持传中文,需转换
    push(context, '${Routes.baseListPage}?type=${Uri.encodeComponent(type)}');
  }

  static void push(BuildContext context, String path,
      {bool replace = false, bool clearStack = false, Object? arguments}) {
    unfocus();
    Routes.router.navigateTo(context, path,
      replace: replace,
      clearStack: clearStack,
      transition: TransitionType.inFromRight,
      routeSettings: RouteSettings(
        arguments: arguments,
      ),
    );
  }
  // static Future close(BuildContext context) {
  //   Navigator.of(context).p
  // }

  static void unfocus() {
    // 使用下面的方式，会触发不必要的build。
    // FocusScope.of(context).unfocus();
    // https://github.com/flutter/flutter/issues/47128#issuecomment-627551073
    FocusManager.instance.primaryFocus?.unfocus();
  }


  static void pushResult(BuildContext context, String path, Function(Object) function,
      {bool replace = false, bool clearStack = false, Object? arguments}) {
    unfocus();
    Routes.router.navigateTo(context, path,
      replace: replace,
      clearStack: clearStack,
      transition: TransitionType.native,
      routeSettings: RouteSettings(
        arguments: arguments,
      ),
    ).then((Object? result) {
      // 页面返回result为null
      if (result == null) {
        return;
      }
      function(result);
    }).catchError((dynamic error) {
      print('$error');
    });
  }
}