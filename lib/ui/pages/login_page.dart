
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipfsnets/data/global_entiy.dart';
import 'package:ipfsnets/generated/l10n.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/res/dimens.dart';
import 'package:ipfsnets/res/styles.dart';
import 'package:ipfsnets/routes/navigatorUtil.dart';
import 'package:ipfsnets/routes/routers.dart';
import 'package:ipfsnets/ui/bloc/login/login_bloc.dart';
import 'package:ipfsnets/ui/bloc/login/login_repository.dart';
import 'package:ipfsnets/ui/widget/login_button.dart';
import 'package:ipfsnets/utils/log_util.dart';

import '../../r.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     return BlocProvider(create: (context)=> LoginBloc(LoginRepository()),child: _LoginPageState());
  }
}

class _LoginPageState extends StatelessWidget {
  final  _usernameController = TextEditingController();
  final  _passwordController = TextEditingController();
  final TapGestureRecognizer _registProtocolRecognizer = new TapGestureRecognizer();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.repository.state == 200) {
            NavigatorUtil.jumpRemove(context);
          }
        },
        builder: (context, state) {
          return new Scaffold(
              body: Form(child: ListView(
                children: <Widget>[
                  buildClose(),
                  buildTitle(),
                  buildTitlem(),
                  buildInput(),
                  // BlocBuilder<LoginBloc, LoginState>(builder: (context, state){
                  //   return  buildpro(context,state);
                  // }),
                  BlocBuilder<LoginBloc, LoginState>(builder: (context, state){
                    return buildLogin(context,state);
                  }),
                  buildRegisterAndForget(context)
                ],
              ),
              )
          );
        }
    );
  }

  Padding buildClose() {
    return Padding(padding: EdgeInsets.fromLTRB(0, 40.h, 40.w, 0),
        // child: Align(alignment: Alignment.topRight, child: Image.asset(R.assetsImgIconClose,width: 40.w,height: 40.w),));
    child: Text(""));
  }
  Padding buildTitle() {
    return Padding(padding: EdgeInsets.fromLTRB(50.w, 80.h, 0, 0),
      child: Text(S.current.login_title, style: ITextStyles.loginTitle));
  }
  Padding buildTitlem() {
    return Padding(padding: EdgeInsets.fromLTRB(50.w, 5.h, 0, 0),
      child: Text(S.current.login_title_1, style: ITextStyles.loginTitle));
  }
  Padding buildInput() {
    return Padding(padding: EdgeInsets.fromLTRB(50.w, 80.h, 50.w, 10.w),
      child: Column(
        children: [
          BlocBuilder<LoginBloc, LoginState>(builder: (context, state){
            return buildPhoneTextField(context,state);
          }),
          Divider(height:1.h,indent:0.0,color: Colours.line),
          BlocBuilder<LoginBloc, LoginState>(builder: (context, state){
            return buildPasswordTextField(context,state);
          }),
          Divider(height:1.h,indent:0.0,color: Colours.line),
        ],
      ),
    );
  }
  Padding buildLogin(BuildContext context,LoginState state) {
    return  Padding(padding: EdgeInsets.fromLTRB(50.w, 30.h, 50.w, 0),
      child: LoginButton(text: S.current.login_login,
          endble :state.repository.isCanLogin,
          onPressed: () {
            BlocProvider.of<LoginBloc>(context).add(LoginButtonPressEvent(state.repository));
      }),
    );
  }
  Padding buildRegisterAndForget(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(50.w, 10.h, 50.w, 0),
      child: Row(
        children: [
          GestureDetector(child: Text(S.current.login_register, style:TextStyle(fontSize: Dimens.font_sp14,color: Colours.button_sel)),onTap: (){
            NavigatorUtil.jump(context, Routes.register);
          },),

          Expanded(child: SizedBox()),
          GestureDetector(child: Text(S.current.login_find_pwd, style:TextStyle(fontSize: Dimens.font_sp14,color: Colours.item_content_color)),onTap: (){
            NavigatorUtil.jump(context, Routes.forget);
          },),

        ],
      ),
    );
  }

  /**构建用户名**/
  TextFormField buildPhoneTextField(BuildContext context,LoginState state) {
    return new TextFormField(onChanged: (value){
        state.repository.userName = value.trim();
        BlocProvider.of<LoginBloc>(context).add(PhoneChangeEvent(state.repository));
    },
      controller: _usernameController,
      style: TextStyle(fontSize: 16),
      inputFormatters: [LengthLimitingTextInputFormatter(GlobalEntiy.PHONE_MAX_INPUT)],
      decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: S.current.login_phone
      ),
    );
  }
  // 用户协议
  Padding buildpro(BuildContext context,LoginState state) {

    return Padding(
      padding: EdgeInsets.fromLTRB(30.w, 0, 50.w, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Checkbox(
              activeColor: Colours.button_sel,
              value: state.repository.isAggress,
              onChanged: (value) {
                state.repository.isAggress = value!;
                BlocProvider.of<LoginBloc>(context).add(LoginAgressEvent(state.repository));
              },
              shape: CircleBorder()),
          Text.rich(TextSpan(children: [
            TextSpan(text: S.current.register_desc,style: TextStyle(fontSize: 12)),
            TextSpan(
                text: S.current.register_desc_more,
                style: TextStyle(
                    color: Colours.button_sel,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid),
                recognizer:_registProtocolRecognizer..onTap=(){
                  LogUtil.e("打开网页");
                  NavigatorUtil.goWebViewPage(context, S.current.register_desc_more, GlobalEntiy.web_reigster);
                }
            ),

          ]))
        ],
      ),
    );
  }
  /**构建密码**/
  TextFormField buildPasswordTextField(BuildContext context,LoginState state) {
    return new TextFormField(onChanged: (value){
        state.repository.password = value.trim();
        BlocProvider.of<LoginBloc>(context).add(PasswordChangeEvent(state.repository));
    },
      controller: _passwordController,
      inputFormatters: [LengthLimitingTextInputFormatter(GlobalEntiy.PWD_MAX_INPUT)],
      style: TextStyle(fontSize: 16),
      obscureText: state.repository.isObscure,
      decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: S.current.login_pwd,
          suffixIcon: IconButton(
            icon: Image.asset(state.repository.isObscure?R.assetsImgIconDisplay:R.assetsImgIconHide,width: 32.w,height: 32.w,),
              onPressed: () {
                BlocProvider.of<LoginBloc>(context).add(PasswordEnableEvent(state.repository));
          },
          )
      ),
    );
  }

}