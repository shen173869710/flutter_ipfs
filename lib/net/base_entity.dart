
import 'package:ipfsnets/data/global_entiy.dart';

import 'entiy_factory.dart';

class BaseEntity <T> {
  late int code;
  late String msg;
  T?  data;
  late int total;

  BaseEntity(this.code, this.msg, this.data);
  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json[GlobalEntiy.CODE] as int;
    msg = json[GlobalEntiy.MSG] as String;
    if (json.containsKey("total")) {
      total = json["total"] as int;
    }

    if (json.containsKey(GlobalEntiy.DATA)) {
      data = EntityFactory.generateOBJ<T>(json[GlobalEntiy.DATA]);
    }
    if (json.containsKey("rows")) {
      data = EntityFactory.generateOBJ<T>(json["rows"]);
    }
  }

  bool isOk() {
    if (this != null && code == 200) {
      return true;
    }
    return false;
  }

}