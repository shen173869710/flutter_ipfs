

import 'dart:convert';

import 'package:flustars/flustars.dart';
import 'package:ipfsnets/include.dart';

class StringUtil{



  static bool equal(String start, String end) {
    if(start != null && end != null && start == end){
      return true;
    }
    return false;
  }


  static bool isEmpty(String str) {
    if(str == null || str.isEmpty || str.trim().length == 0){
      return true;
    }
    return false;
  }


  static bool isNotEmpty(String str) {
    if(str != null && str.trim().length > 0){
      return true;
    }
    return false;
  }
  // 大于
  static bool greateLength(String str, int length) {
    if (str != null && str.trim().length > length) {
      return true;
    }
    return false;
  }
  // 小于
  static bool lessLength(String str, int length) {
    if (str != null && str.trim().length < length) {
      return true;
    }
    return false;
  }
  // 等于
  static bool equalLenght(String str, int length) {
    if (str != null && str.trim().length == length) {
      return true;
    }
    return false;
  }

  static String chageNum(num value) {
    num price = 0;
    if (value > 999999999999){
      price = value / 1000000000000;
      return price.toStringAsFixed(1)+"万亿";
    }else if(value > 99999999){
      price = value / 100000000;
      return price.toStringAsFixed(1)+"亿";
    }else if(value > 9999){
      price = value / 10000;
      return price.toStringAsFixed(1)+"万";
    }else{
      return value.toStringAsFixed(1);
    }
  }

  //
  static String addCoin(String str) {
    return "¥"+str;
  }


  /**
   *   list 对象转string
   */

  static String listToString(List<String>str) {
    return JsonEncoder().convert(str);
  }

  static List<String> stringToList(String str) {
    List<String> list = <String>[];
    for (var value in JsonDecoder().convert(str)) {
      list.add(value);
    };
    return list;
  }

  // 保存list
  static saveList(List<String>str) {
    SpUtil.putString("list", listToString(str));
  }
  // 获取list
  static List<String> getList() {
    String str = SpUtil.getString("list",defValue: "").toString();
    if (isEmpty(str)) {
      return [];
    }
    return stringToList(str);
  }

}