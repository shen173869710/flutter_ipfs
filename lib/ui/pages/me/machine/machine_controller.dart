

import 'package:ipfsnets/models/machine_entity.dart';
import 'package:ipfsnets/models/machine_top_entity.dart';

import '../../../../include.dart';


class MarketBuyController extends GetxController {

  late MachineTopEntity topEntity;
  late List<MachineEntity> list;


  init(){
    topEntity = MachineTopEntity();
    list = [];
  }

  initTop(MachineTopEntity machineTopEntit) {
    topEntity = machineTopEntit;
    update();
  }

  initList(List<MachineEntity> entiy) {
    list = entiy;
    update();
  }


}
