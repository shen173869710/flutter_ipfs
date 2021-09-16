


import 'package:ipfsnets/models/find__entity.dart';
import 'package:ipfsnets/models/home_entity.dart';
import 'package:ipfsnets/utils/num_util.dart';

import '../../../include.dart';

class HomeController extends GetxController {


  String item3_1 = "";
  String item3_2 = "";
  String item3_3 = "";

  String item4_1 = "";
  String item4_2 = "";
  String item4_3 = "";
  String item4_4 = "";
  String item4_5 = "";
  String item5_title = "";
  String item5_1 = "";
  String item5_2 = "";
  String item5_3 = "";
  String item5_4 = "";
  String item5_5 = "";
  //
  int btnSel = 0;

  HomeEntity? entity;

  List<FindEntity> noticeTag = [];

  init(){
    item3_1 = "";
    item3_2 = "";
    item3_3 = "";

    item4_1 = "";
    item4_2 = "";
    item4_3 = "";
    item4_4 = "";
    item4_5 = "";
    item5_title = "";
    item5_1 = "";
    item5_2 = "";
    item5_3 = "";
    item5_4 = "";
    item5_5 = "";
    entity = HomeEntity();

    FindEntity findEntity = FindEntity();
    findEntity.noticeTitle = "";
    noticeTag.add(findEntity);
    noticeTag.add(findEntity);
  }

  setHomeEntity(HomeEntity homeEntity) {
    entity = homeEntity;
    btnSel= 0;
    onBtnChange();
    setItem4();
    onCnyChange(S.current.home_item_5_cny);
    update();
  }

  onBtnClick(int index) {
    btnSel = index;
    onBtnChange();
    update();
  }
  // 24小时封装成本
  onBtnChange() {
    if (btnSel == 0) {
      if (entity!.oneDayCost != null){
        if (entity!.oneDayCost!.costTB != null) {
          item3_1 = NumUtil.prseeZero(entity!.oneDayCost!.cost32!.totalCost.toStringAsFixed(5))+" FIL";
          item3_2 = NumUtil.prseeZero(entity!.oneDayCost!.cost32!.pledgeDay.toStringAsFixed(5))+" FIL";
          item3_3 = NumUtil.prseeZero(entity!.oneDayCost!.cost32!.gasDay.toStringAsFixed(5))+" FIL";
        }
      }
    }else if (btnSel == 1) {
      if (entity!.oneDayCost != null){
        if (entity!.oneDayCost!.cost32 != null) {
          item3_1 = NumUtil.prseeZero(entity!.oneDayCost!.costTB!.totalCost.toStringAsFixed(5))+" FIL";
          item3_2 = NumUtil.prseeZero(entity!.oneDayCost!.costTB!.pledgeDay.toStringAsFixed(5))+" FIL";
          item3_3 = NumUtil.prseeZero(entity!.oneDayCost!.costTB!.gasDay.toStringAsFixed(5))+" FIL";
        }
      }
    }else if (btnSel == 2) {
      if (entity!.oneDayCost != null){
        if (entity!.oneDayCost!.costPB != null) {
          item3_1 = NumUtil.prseeZero(entity!.oneDayCost!.costPB!.totalCost.toStringAsFixed(5))+" FIL";
          item3_2 = NumUtil.prseeZero(entity!.oneDayCost!.costPB!.pledgeDay.toStringAsFixed(5))+" FIL";
          item3_3 = NumUtil.prseeZero(entity!.oneDayCost!.costPB!.gasDay.toStringAsFixed(5))+" FIL";
        }
      }
    }
  }
  // 矿池总收益
  setItem4() {
    if (entity!.totalEarnings != null) {
      item4_1 = NumUtil.prseeZero(entity!.totalEarnings!.total.toStringAsFixed(5))+" FIL";
      item4_2 = NumUtil.prseeZero(entity!.totalEarnings!.releaseNow.toStringAsFixed(5))+" FIL";
      item4_3 = NumUtil.prseeZero(entity!.totalEarnings!.freezeNum.toStringAsFixed(5))+" FIL";
    }
  }

  onCnyChange(String title) {

    if (title.contains(S.current.home_item_5_usdt)) {
      item5_title = S.current.home_item_5_cny;
      if (entity!.earningsView != null && entity!.earningsView!.USDT != null)  {
        item5_1 = NumUtil.prseeZero(entity!.earningsView!.USDT!.total.toStringAsFixed(5))+" USDT";
        item5_3 = NumUtil.prseeZero(entity!.earningsView!.USDT!.today.toStringAsFixed(5))+" USDT";
        item5_4 = NumUtil.prseeZero(entity!.earningsView!.USDT!.userRealCap.toStringAsFixed(5))+" TB";
        item5_5 = NumUtil.prseeZero(entity!.earningsView!.USDT!.teamRealCap.toStringAsFixed(5))+" TB";
      }
    }else {
      item5_title = S.current.home_item_5_usdt;
      if (entity!.earningsView != null && entity!.earningsView!.CNY != null) {
        item5_1 = NumUtil.prseeZero(entity!.earningsView!.CNY!.total.toStringAsFixed(5))+" CNY";
        item5_3 = NumUtil.prseeZero(entity!.earningsView!.CNY!.today.toStringAsFixed(5))+" CNY";
        item5_4 = NumUtil.prseeZero(entity!.earningsView!.CNY!.userRealCap.toStringAsFixed(5))+" TB";
        item5_5 = NumUtil.prseeZero(entity!.earningsView!.CNY!.teamRealCap.toStringAsFixed(5))+" TB";
      }
    }
    update();
  }

  /**
   *   设置消息通知
   */
  setNoticeTag(List<FindEntity> find) {

    int size = find.length;
    if(size > 0) {
      noticeTag.clear();
      noticeTag.addAll(find);
    }else{
      FindEntity findEntity = FindEntity();
      findEntity.noticeTitle = "暂无公告";
      noticeTag.add(FindEntity());
    }

    update();
  }
}
