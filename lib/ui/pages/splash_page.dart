

import 'package:flustars/flustars.dart';
import 'package:ipfsnets/utils/user_util.dart';
import '../../include.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}
//启动页面
class _SplashPageState extends State<SplashPage> {
  void onDelayed() async{
      // await SpUtil.getInstance();
      await SpUtil.getInstance();
      String language = SpUtil.getString(GlobalEntiy.LANGUAGE_KEY, defValue: 'zh').toString();
      print("language = "+language);
      S.load(Locale(language));
      if (UserUtil.hasUserInfo()) {
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => IndexPage()),);
        NavigatorUtil.jumpRemove(context);
      }else{
        NavigatorUtil.jumpLogin(context);
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()),);
      }
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