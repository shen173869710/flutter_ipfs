

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
}