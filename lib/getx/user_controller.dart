
import 'package:get/get.dart';
import 'package:ipfsnets/http/api_service.dart';
import 'package:ipfsnets/http/wallet_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/user_entity.dart';
import 'package:ipfsnets/models/wallet_home_entity.dart';
import 'package:ipfsnets/models/wallet_item_entiy.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/utils/string_util.dart';
import 'package:ipfsnets/utils/user_util.dart';

class UserController extends GetxController {

  late UserEntity user;

  late WalletHomeEntity walletHomeEntity;
  bool showAccount = false;

  inti() {
    walletHomeEntity = WalletHomeEntity(0,[],0);
    showAccount = false;
    user = UserUtil.getUserInfo();
    getAccountInfo();
  }


  void changeAccount(bool show){
    // print('UserController--onInit'+showAccount.toString());
    showAccount = show;
    // user.username = "111111111111";
    if(showAccount) {
      getAccountInfo();
    }

    update();
  }


  void changeUserHead(String url){
    if (StringUtil.isNotEmpty(url)) {
      user.avatar = url;
      UserUtil.saveUserInfo(user);
      LogUtil.e("changeUserHead"+user.avatar.toString());
      update();
    }
  }

  void changeUserNickNam(String nick) {
    if (StringUtil.isNotEmpty(nick)) {
      user.nickname = nick;
      UserUtil.saveUserInfo(user);
      update();
    }
  }

  void changeUserGender(String gender) {
    if (StringUtil.isNotEmpty(gender)) {
      user.sex = gender;
      UserUtil.saveUserInfo(user);
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
    }else{
      ToastUtil.show(baseEntity.msg);
    }

    return false;
  }

  getAccountInfo() async {
    BaseEntity baseEntity  = await WalletApi.getWalletHome(false);
    if (baseEntity.isOk()) {
      walletHomeEntity = baseEntity.data;
    }
    update();
  }
}