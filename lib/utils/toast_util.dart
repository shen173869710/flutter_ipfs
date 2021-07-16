

import 'package:fluttertoast/fluttertoast.dart';

import '../include.dart';

class ToastUtil {
  static void show(String msg, {int duration = 2000}) {
    if (msg == null) {
      return;
    }
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 16.0);

  }


}