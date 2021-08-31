import 'dart:typed_data';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ipfsnets/http/wallet_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/wallet_account_entity.dart';
import 'package:ipfsnets/models/wallet_rechage_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';

class IndexController extends GetxController{
  int currentIndex=0;
  /*切换页面*/
  void changePage(int index) {
    /*如果点击的导航项不是当前项  切换 */
    if (index != currentIndex) {
      currentIndex = index;
      update();
    }
  }

}