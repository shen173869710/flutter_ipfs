
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ipfsnets/http/quote_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/quote_optional_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';

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

  Future<void> addOp(QuoteOptionalEntity data) async {
    if (data.optionalStatus == 1) {
      BaseEntity entity = await QuoteApi.quoteDel(data.name);
      if (entity.isOk()) {
        data.optionalStatus = 0;
        update();
      }else{
        ToastUtil.show(entity.msg);
      }
    }else{
      BaseEntity entity = await QuoteApi.quoteAdd(data.name);
      if (entity.isOk()) {
        data.optionalStatus = 1;
        update();
      }else{
        ToastUtil.show(entity.msg);
      }
    }
  }

}