import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ipfsnets/http/api_service.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/cny_account_entity.dart';
import 'package:ipfsnets/models/cny_acount_record_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';

class CnyAccountController extends GetxController{
  late num balance = 0;
  late int total;

  late List<CnyAcountRecordEntity> list = [];

  /**获取账户信息**/
   getAccount() async{
     BaseEntity baseEntity  = await ApiServer.getCny();
     CnyAccountEntity entity = baseEntity.data;
     balance = entity.balance;
     LogUtil.e("balance"+entity.balance.toString());

  }

   getList(int pageNum) async{
     BaseEntity baseEntity  = await ApiServer.getCnyList(pageNum);
     total = baseEntity.total!;
     list.addAll(baseEntity.data);
     update();
  }

  Future<bool> init() async{
    list.clear();
      await Future.wait<dynamic>([getAccount(),getList(1)]).then((value) => (){
      });
      update();
    return true;
  }


  getListMore(int pageNum) async{
    BaseEntity baseEntity  = await ApiServer.getCnyList(pageNum);
    total = baseEntity.total!;
    list.addAll(baseEntity.data);
    update();
    int max = (pageNum-1) * 10;
    if (max > total) {
      return false;
    }
    return true;
  }


}