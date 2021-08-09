
import 'package:get/get.dart';
import 'package:ipfsnets/http/api_service.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/user_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/utils/string_util.dart';
import 'package:ipfsnets/utils/user_util.dart';

class UserController extends GetxController {

  UserEntity user = UserUtil.getUserInfo();
  //https://img2.baidu.com/it/u=1325995315,4158780794&fm=26&fmt=auto&gp=0.jpg

  bool showAccount = false;

  void changeAccount(bool show){
    // print('UserController--onInit'+showAccount.toString());
    showAccount = show;
    // user.username = "111111111111";
    update();
  }


  void changeUserHead(String url){
    if (StringUtil.isNotEmpty(url)) {
      UserUtil.saveUserAvatarl(url);
      user.avatar = url;
      LogUtil.e("changeUserHead"+user.avatar.toString());
      update();
    }
  }

  void changeUserNickNam(String nick) {
    if (StringUtil.isNotEmpty(nick)) {
      UserUtil.saveUserNickName(nick);
      user.nickname = nick;
      update();
    }
  }

  void changeUserGender(String gender) {
    if (StringUtil.isNotEmpty(gender)) {
      user.sex = gender;
      UserUtil.saveUserSex(gender);
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    user = UserUtil.getUserInfo();
    print('UserController--onInit');
  }

  @override
  void onReady() {
    super.onReady();
    print('UserController--onReady');
  }

  @override
  void onClose() {
    super.onClose();
    print('UserController--onClose');
  }

  // 保存用户信息
   Future<bool> doUpdateUser(String headurl, String nickname, String sex) async {
    // LogUtil.e(headurl!+"  "+sex!+"  "+nickname!);
    if (headurl != null && headurl == user.avatar &&
        sex != null && sex == user.sex &&
        nickname != null && nickname == user.nickname) {
      LogUtil.e("用户信息相同 不更新");
      return false;
    }
    BaseEntity baseEntity  = await ApiServer.updateUserInfo(headurl,sex,nickname);
    if (baseEntity.isOk()) {
      UserEntity entity = baseEntity.data;
      if (entity != null) {
        return true;
      }
      return true;
    }
    return false;
  }
}