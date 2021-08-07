import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ipfsnets/http/api_service.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/acount_entiy.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/utils/string_util.dart';
import 'package:ipfsnets/utils/toast_util.dart';

class CnyWithdrawalEndController extends GetxController{
  late String item1 ="";
  late String item2 ="";
  late String item3 ="";
  late String item4 ="";
  bool isEnable = false;
  String type = "1";

  init(){
    item1 ="";
    item2 ="";
    item3 ="";
    item4 ="";
    isEnable = false;
  }

  setitem1(String str){
    item1 = str;
  }

  setitem2(String str){
    item2 = str;
  }

  setitem3(String str){
    item3 = str;
  }

  void setType(String str) {
    LogUtil.e("setType"+str);
    type = str;

  }

  void changeItem1(String str) {
    item1 = str;
    enableButton();
    update();
  }

  void changeItem2(String str) {
    item2 = str;
    enableButton();
    update();
  }

  void changeItem3(String str) {
    item3 = str;
    enableButton();
    update();
  }

  void changeItem4(String str) {
    item4 = str;
    enableButton();
    update();
  }



  void enableButton() {
    LogUtil.e(isEnable.toString()+"type ="+type + " item1="+item1+ " item2="+item2+ " item3="+item3+ " item4="+item4);
    if (type == "1") {
      if (StringUtil.isNotEmpty(item1) && StringUtil.isNotEmpty(item2) && StringUtil.isNotEmpty(item4)) {
        isEnable = true;
      }else{
        isEnable = false;
      }
    }else {
      if (StringUtil.isNotEmpty(item1) && StringUtil.isNotEmpty(item2) && StringUtil.isNotEmpty(item3) &&StringUtil.isNotEmpty(item4)) {
        isEnable = true;
      }else{
        isEnable = false;
      }
    }
  }


  Future<bool> putEnd(String money) async {
    // String accountBank, String accountName, int accountNumber,String amount,String code, String type
    BaseEntity baseEntity  = await ApiServer.cnyWithdrawal(item3,item1,item2,money,item4,type);
    ToastUtil.show(S.current.option_success);
    return true;
  }
  //
  //  getList(int pageNum) async{
  //    BaseEntity baseEntity  = await ApiServer.getCnyList(pageNum);
  //    total = baseEntity.total!;
  //    list.addAll(baseEntity.data);
  //    update();
  // }






}