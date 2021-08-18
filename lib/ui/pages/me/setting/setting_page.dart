import 'dart:convert';
import 'dart:io';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xupdate/flutter_xupdate.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/app_info_entity.dart';
import 'package:ipfsnets/models/user_entity.dart';
import 'package:ipfsnets/ui/widget/click_item.dart';
import 'package:ipfsnets/ui/widget/login_button.dart';
import 'package:ipfsnets/utils/user_util.dart';
import 'package:package_info/package_info.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SettingState();
  }
}

class _SettingState extends State<SettingPage> {
  late UserEntity userEntity;
  String version = "";
  String buildNumber = "1";

  @override
  void initState() {
    userEntity = UserUtil.getUserInfo();
    initXUpdate();
    getPackinfo();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: new Text(S.current.setting_title),
          centerTitle: true,
          backgroundColor: Colours.app_bar_bg,
        ),
        body: Form(
          child: Column(
            children: <Widget>[
              ClickItem(
                  title: S.current.setting_change_phone,
                  content: userEntity.username,
                  onTap: () {
                    NavigatorUtil.goPasswordPage(context,GlobalEntiy.PASSWORD_ACCOUNT);
                  }),
              ClickItem(
                  title: S.current.setting_change_logig_pwd, onTap: () {
                    NavigatorUtil.goPasswordPage(context,GlobalEntiy.PASSWORD_CHANGE);
              }),
              ClickItem(title: S.current.setting_change_pay_pwd, onTap: () {
                      NavigatorUtil.goPasswordPage(context,GlobalEntiy.PASSWORD_APLAY);
              }),
              ClickItem(title: S.current.setting_language, onTap: () {
                NavigatorUtil.jump(context, Routes.languagePage);
              }),
              ClickItem(
                  title: S.current.setting_version,
                  content: version,
                  onTap: () {
                      checkVersion();

                  }),
              buildLogin(context)
            ],
          ),
        ));
  }

  Padding buildLogin(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(50.w, 50.h, 50.w, 0),
      child: LoginButton(
          text: S.current.setting_logout,
          endble: true,
          onPressed: () {
            SpUtil.putString(GlobalEntiy.accessToken, "");
            UserUtil.loginout();
            NavigatorUtil.jumpLogin(context);
          }),
    );
  }

  getPackinfo() async {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        version = packageInfo.version;
        buildNumber = packageInfo.buildNumber;
        print("buildNumber = "+buildNumber);
      });
    });
  }

  checkVersion() {
    FlutterXUpdate.checkUpdate(url: "http://124.16.8.140:8081/wallet/app/version",isCustomParse: true);
  }

  ///初始化
  void initXUpdate() {
    if (Platform.isAndroid) {
      FlutterXUpdate.init(
        ///是否输出日志
          debug: true,
          ///是否使用post请求
          isPost: false,
          ///post请求是否是上传json
          isPostJson: false,
          ///请求响应超时时间
          timeout: 25000,
          ///是否开启自动模式
          isWifiOnly: false,
          ///是否开启自动模式
          isAutoMode: false,
          ///需要设置的公共参数
          supportSilentInstall: false,
          ///在下载过程中，如果点击了取消的话，是否弹出切换下载方式的重试提示弹窗
          enableRetry: false)
          .then((value) {
        print('初始化成功: $value');
      }).catchError((error) {
        print(error);
      });

      FlutterXUpdate.setCustomParseHandler(onUpdateParse: (String? data) async {
        final Map<String, dynamic> map = json.decode(data!) as Map<String, dynamic>;
        late AppInfoEntiy appInfo;
        if (map.containsKey(GlobalEntiy.DATA)) {
          appInfo = AppInfoEntiy.fromJson(map[GlobalEntiy.DATA]);
        }

        print('appInfo: $appInfo');
        if (appInfo == null) {
          return UpdateEntity(
              hasUpdate: false,
              isIgnorable: false,
              versionCode: 1,
              versionName: "",
              updateContent: "",
              downloadUrl: "",
              apkSize: 1);
        }

        bool update = false;
        int code = num.parse(buildNumber).toInt();

        print('当前版本: $code'+"appInfo.versionCode"+appInfo.versionCode.toString());
        if (appInfo.versionCode > code) {
          update = true;
        }
        return UpdateEntity(
            hasUpdate: update,
            isIgnorable: false,
            versionCode: code,
            versionName: appInfo.versionName,
            updateContent: appInfo.modifyContent,
            downloadUrl: appInfo.downloadUrl,
            apkSize: appInfo.apkSize);
      });
    }

  }


}
