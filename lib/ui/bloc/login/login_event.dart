part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  final LoginRepository repository;
  const LoginEvent(this.repository);
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class PhoneChangeEvent extends LoginEvent{
  PhoneChangeEvent(LoginRepository repository) : super(repository);
}
class PasswordChangeEvent extends LoginEvent{
  PasswordChangeEvent(LoginRepository repository) : super(repository);
}
class PasswordEnableEvent extends LoginEvent{
  PasswordEnableEvent(LoginRepository repository) : super(repository);
}
class LoginButtonEnableEvent extends LoginEvent{
  LoginButtonEnableEvent(LoginRepository repository) : super(repository);
}
class LoginButtonPressEvent extends LoginEvent{
  LoginButtonPressEvent(LoginRepository repository) : super(repository);
}

class LoginAgressEvent extends LoginEvent{
  LoginAgressEvent(LoginRepository repository) : super(repository);
}
