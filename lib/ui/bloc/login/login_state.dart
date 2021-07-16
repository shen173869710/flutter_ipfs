part of 'login_bloc.dart';


abstract class LoginState extends Equatable {

  final LoginRepository repository;
  const LoginState(this.repository);
  @override
  List<Object> get props => [repository];
}

class LoginInitial extends LoginState{
  LoginInitial(LoginRepository repository) : super(repository);
}
// 密码是否可见
class PasswordEnableState extends LoginState {
  PasswordEnableState(LoginRepository repository) : super(repository);
}
// 电话号码输入
class PhoneChangeState extends LoginState {
  PhoneChangeState(LoginRepository repository) : super(repository);
}

// 用户密码输入
class PasseordChangeState extends LoginState {
  PasseordChangeState(LoginRepository repository) : super(repository);
}

// 登录按钮点击
class LoginButtonPressState extends LoginState {
  LoginButtonPressState(LoginRepository repository) : super(repository);
}
// 登录是否可以点击
class LoginButtonEnableState extends LoginState {
  LoginButtonEnableState(LoginRepository repository) : super(repository);
}

class LoginAgressState extends LoginState {
  LoginAgressState(LoginRepository repository) : super(repository);
}


