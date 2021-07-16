
import 'dart:async';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/models/user_entity.dart';
import 'package:ipfsnets/routes/navigatorUtil.dart';
import 'package:ipfsnets/routes/routers.dart';
import 'package:ipfsnets/ui/pages/login_page.dart';
import 'package:ipfsnets/utils/user_util.dart';
import '../../include.dart';
import '../../r.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }

}
//启动页面
class _SplashPageState extends State<SplashPage> {
  void onDelayed() async{
    await Future.delayed(const Duration(milliseconds: 2000), () {
      UserUtil.initUserInfo(new UserEntity());
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }
  void navigationPage() {
    NavigatorUtil.jump(context,Routes.login);
   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onDelayed();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

     return Scaffold(
        body: new Center(
          child: new Image.asset(R.assetsImgIcWelcome,fit: BoxFit.fill,width: double.infinity,height: double.infinity,),
        ),

     );
  }

}