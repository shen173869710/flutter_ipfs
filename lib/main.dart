
import 'dart:io';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipfsnets/routes/application.dart';
import 'package:ipfsnets/routes/routers.dart';
import 'package:ipfsnets/ui/pages/splash_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'data/global_entiy.dart';
import 'generated/l10n.dart';

Future<void> main() async {

    Routes.configureRoutes();
    Application.router = Routes.router;
    EasyLoading.init();
    runApp(new MyApp());
    if (Platform.isAndroid) {
      // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
      SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _initAsync();
  // }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(designSize: Size(750, 1334),
        builder:()=> RefreshConfiguration(
                headerBuilder: () => WaterDropHeader(),        // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
                footerBuilder:  () => ClassicFooter(),        // 配置默认底部指示器
                headerTriggerDistance: 80.0,        // 头部触发刷新的越界距离
                springDescription:SpringDescription(stiffness: 170, damping: 16, mass: 1.9),         // 自定义回弹动画,三个属性值意义请查询flutter api
                maxOverScrollExtent :100, //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
                maxUnderScrollExtent:0, // 底部最大可以拖动的范围
                enableScrollWhenRefreshCompleted: true, //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
                enableLoadingWhenFailed : true, //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
                hideFooterWhenNotFull: false, // Viewport不满一屏时,禁用上拉加载更多功能
                enableBallisticLoad: true, // 可以通过惯性滑动触发加载更多
                child:MaterialApp(
                    locale: Locale('zh'),
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: [
                      S.delegate,
                      RefreshLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    onGenerateRoute: Application.router!.generator,
                    builder: EasyLoading.init(),
                    home: new SplashPage()))
            );
  }

  // void _initAsync() async {
  //   await SpUtil.getInstance();
  //   String language = SpUtil.getString(GlobalEntiy.LANGUAGE_KEY, defValue: 'zh').toString();
  //   print("language = "+language);
  //   S.load(Locale(language));
  // }


}
