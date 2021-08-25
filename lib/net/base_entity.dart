
import 'package:ipfsnets/data/global_entiy.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/ui/pages/login_page.dart';

import 'entiy_factory.dart';

class BaseEntity <T> {
  late int code;
  late String msg;
  T?  data;
  late int total = 0;

  BaseEntity(this.code, this.msg, this.data);
  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json[GlobalEntiy.CODE] as int;
    LogUtil.e("BaseEntity---------- =="+code.toString());
    msg = json[GlobalEntiy.MSG] as String;

    if (code == 503) {
      toLogin();
      return;
    }else if (code != 200) {
      return;
    }
    if (json.containsKey("total")) {
      total = json["total"] as int;
    }
    if (json.containsKey(GlobalEntiy.DATA)) {
      data = EntityFactory.generateOBJ<T>(json[GlobalEntiy.DATA]);
    }
    if (json.containsKey("rows")) {
      data = EntityFactory.generateOBJ<T>(json["rows"]);
    }
  }

  bool isOk() {
    if (this != null && code == 200) {
      return true;
    }
    return false;
  }

  toLogin() async {
    ToastUtil.show(msg);
    await   Future.delayed(const Duration(milliseconds: 1000), () async {
      Routes.navigatorKey.currentState!.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage(),), (route) => route == null);
    });
  }

}