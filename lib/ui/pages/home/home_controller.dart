


import 'package:ipfsnets/models/market_entity.dart';

import '../../../include.dart';

class HomeController extends GetxController {

  String notice = "noticenoticenoticenoticenoticenoticenotice";

  String item3_1 = "3_1 FIl";
  String item3_2 = "3_2 FIl";
  String item3_3 = "3_3 FIl";

  String item4_1 = "4_1 FIl";
  String item4_2 = "4_2 FIl";
  String item4_3 = "4_3 FIl";
  String item4_4 = "4_4 FIl";
  String item4_5 = "4_5 FIl";

  String item5_1 = "5_1 CNY";
  String item5_2 = "5_2 CNY";
  String item5_3 = "5_3 CNY";
  String item5_4 = "5_4 TB";
  String item5_5 = "5_5 TB";
  //
  int btnSel = 0;

  onBtnClick(int index) {
    btnSel = 0;
    update();
  }
}
