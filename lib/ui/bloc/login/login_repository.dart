

class LoginRepository{
  String? userName = "";
  String? password = "";
  // 登录按钮是否可以点击
  bool isCanLogin = false;
  // 密码是否可见
  bool isObscure = true;
  /******/
  int state = 0;
  bool isAggress = true;
  LoginRepository();

}