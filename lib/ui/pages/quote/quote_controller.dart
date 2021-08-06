import 'dart:typed_data';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ipfsnets/http/quote_api.dart';
import 'package:ipfsnets/http/transfer_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/quote_optional_entity.dart';
import 'package:ipfsnets/models/transfer_entity.dart';
import 'package:ipfsnets/models/transfer_in_entiy.dart';
import 'package:ipfsnets/models/transfer_out_entiy.dart';
import 'package:ipfsnets/models/wallet_account_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/utils/num_util.dart';

class QuoteController extends GetxController{

  List<QuoteOptionalEntity> list = [];

  String result = "";

  setResule(String str){
    result = str;
    getResultData();
  }


  addList(List<QuoteOptionalEntity> entiy) {
    list.addAll(entiy);
    update();
  }

  // 模糊查询
  getResultData() async {
    BaseEntity entity = await QuoteApi.getQuoteSerach(result);
    if (entity.isOk()) {
      list.clear();
      list.addAll(entity.data);
      update();
    }else{
      ToastUtil.show("no data");
    }

  }

}