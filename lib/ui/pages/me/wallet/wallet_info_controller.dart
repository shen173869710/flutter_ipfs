
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ipfsnets/http/wallet_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/wallet_info_entity.dart';
import 'package:ipfsnets/models/wallet_info_list_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';

class WalletInfoController extends GetxController{

  WalletInfoEntity walletInfoEntity = new WalletInfoEntity();
  late List<WalletInfoListEntity> list1 = [];
  late List<WalletInfoListEntity> list2 = [];
  late List<WalletInfoListEntity> list3 = [];

  int page1 = 1;
  int page2 = 1;
  int page3 = 1;

  int total1 = 0;
  int total2 = 0;
  int total3 = 0;

  initData(){
    list1.clear();
    list2.clear();
    list3.clear();
    page1 = 1;
    page2 = 1;
    page3 = 1;
    total1 = 0;
    total2 = 0;
    total3 = 0;

  }


  getList1More(int pageNum, num coinCode) async{
    BaseEntity baseEntity  = await WalletApi.wallerInfNormal(pageNum,coinCode);
    total1 = baseEntity.total;
    list1.addAll(baseEntity.data);
    update();
    int max = (pageNum-1) * 10;
    if (max > total1) {
      return false;
    }
    return true;
  }


  getList2More(int pageNum,num coinCode) async{
    BaseEntity baseEntity  = await WalletApi.wallerInfForeeze(pageNum,coinCode);
    total2 = baseEntity.total;
    list2.addAll(baseEntity.data);
    update();
    int max = (pageNum-1) * 10;
    if (max > total2) {
      return false;
    }
    return true;
  }

  getList3More(int pageNum,num coinCode) async{
    BaseEntity baseEntity  = await WalletApi.wallerInfPledge(pageNum,coinCode);
    total3 = baseEntity.total;
    list3.addAll(baseEntity.data);
    update();
    int max = (pageNum-1) * 10;
    if (max > total3) {
      return false;
    }
    return true;
  }

  setWalletInfoEntity(WalletInfoEntity info){
    walletInfoEntity.freeze = info.freeze;
    walletInfoEntity.todayEarnings = info.todayEarnings;
    walletInfoEntity.pledge = info.pledge;
    walletInfoEntity.sum = info.sum;
    walletInfoEntity.txValue = info.txValue;

    LogUtil.e(info.toJson());

    LogUtil.e("walletInfoEntity  = "+walletInfoEntity.toJson().toString());
    update();
  }

}