import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flustars/flustars.dart';
import 'package:ipfsnets/data/global_entiy.dart';
import 'package:ipfsnets/http/api_service.dart';
import 'package:ipfsnets/models/access_token_entity.dart';
import 'package:ipfsnets/models/user_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/utils/LoadingUtils.dart';
import 'package:ipfsnets/utils/toast_util.dart';
import 'package:ipfsnets/utils/user_util.dart';
import 'login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;

  LoginBloc(this.repository) : super(LoginInitial(repository));

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    // TODO: implement mapEventToState
    isLoginButtonEnable(event.repository);
    if (event is PhoneChangeEvent) {
      // 账户输入
      yield* _mapPhoneChangeEventToState(event);
    }else if (event is PasswordChangeEvent){
      // 密码输入
      yield* _mapPasswordChangeToState(event);
    }else if (event is PasswordEnableEvent){
      // 密码可见
      yield* _mapPasswordEnableToState(event);
    }else if (event is LoginButtonPressEvent){
      // 登录按钮点击
      // event.repository.state == 200;
      yield* _mapLoginButtonPressToState(event);
    } else if (event is LoginAgressEvent) {
      yield* _mapLoginAgressToState(event);
      LogUtil.e("同意协议1111"+event.repository.isAggress.toString());
    }

  }

  Stream<LoginState> _mapPhoneChangeEventToState(PhoneChangeEvent event) async* {
    yield PhoneChangeState(copyObject(event.repository));
  }

  Stream<LoginState> _mapPasswordChangeToState(PasswordChangeEvent event) async* {
    yield PasseordChangeState(copyObject(event.repository));
  }

  Stream<LoginState> _mapPasswordEnableToState(PasswordEnableEvent event) async* {
    event.repository.isObscure = !event.repository.isObscure;
    yield PasswordEnableState(copyObject(event.repository));
  }

  Stream<LoginState> _mapLoginAgressToState(LoginAgressEvent event) async* {

    // LogUtil.e("同意协议"+event.repository.isAggress.toString());
    yield LoginAgressState(copyObject(event.repository));
  }

  Stream<LoginState> _mapLoginButtonPressToState(LoginButtonPressEvent event) async* {


    LoadingUtils.show();
    BaseEntity baseEntity  = await ApiServer.login(event.repository.userName!,event.repository.password!);
    if (baseEntity.code != 200) {
      ToastUtil.show(""+baseEntity.msg);
      LoadingUtils.dismiss();
      return;
    }

    if (baseEntity != null && baseEntity.data != null) {
      AccessTokenEntity entity = baseEntity.data;
      LogUtil.e("token==="+entity.accessToken.toString());

      if (entity.accessToken!.isNotEmpty) {
        SpUtil.putString(GlobalEntiy.accessToken, entity.accessToken!);
        final String? accessToken = SpUtil.getString(GlobalEntiy.accessToken);
        LogUtil.e("保存之后 ==="+accessToken!);
        baseEntity =  await ApiServer.getuserInfo();
        LoadingUtils.dismiss();
        if (baseEntity.data != null) {
          UserEntity userEntity = baseEntity.data;
          UserUtil.saveUserInfo(userEntity);
          event.repository.state = 200;
          yield LoginButtonPressState(copyObject(event.repository));
        }

      }
    }

    LoadingUtils.dismiss();
  }

  void isLoginButtonEnable (LoginRepository repository) {
    if (repository.isAggress
        && repository.userName != null
        && repository.password != null
        && repository.userName!.isNotEmpty
        && repository.userName!.length >= 6
        && repository.password!.isNotEmpty
        && repository.password!.length >= 6) {
        repository.isCanLogin = true;
    }else {
      repository.isCanLogin = false;
    }
    // LogUtil.e("用户名"+repository.userName.toString());
    // LogUtil.e("密码"+repository.password.toString());
  }

  LoginRepository copyObject(LoginRepository repository) {
    LoginRepository lr = new LoginRepository();
    lr.password = repository.password;
    lr.userName = repository.userName;
    lr.isCanLogin = repository.isCanLogin;
    lr.isObscure = repository.isObscure;
    lr.state = repository.state;
    lr.isAggress = repository.isAggress;
    return lr;
  }


}
