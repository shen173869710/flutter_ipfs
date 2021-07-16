
import 'package:ipfsnets/data/global_entiy.dart';

import 'entiy_factory.dart';

class BaseEntity <T> {
  int? code;
  late String msg;
  T?  data;

  BaseEntity(this.code, this.msg, this.data);
  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json[GlobalEntiy.CODE] as int?;
    msg = json[GlobalEntiy.MSG] as String;
    if (json.containsKey(GlobalEntiy.DATA)) {
      data = EntityFactory.generateOBJ(json[GlobalEntiy.DATA]);
    }
  }

  bool isOk() {
    if (this != null && code == 200) {
      return true;
    }
    return false;
  }



}