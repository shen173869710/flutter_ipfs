import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipfsnets/include.dart';
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

  @override
  void initState() {
    userEntity = UserUtil.getUserInfo();
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
                  content: userEntity.username!,
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
                  onTap: () {}),
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
            NavigatorUtil.jumpLogin(context);
          }),
    );
  }

  getPackinfo() async {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        version = packageInfo.version;
      });
    });
  }
}
