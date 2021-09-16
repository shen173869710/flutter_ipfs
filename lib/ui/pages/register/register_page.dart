import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipfsnets/data/global_entiy.dart';
import 'package:ipfsnets/generated/l10n.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/res/dimens.dart';
import 'package:ipfsnets/res/styles.dart';
import 'package:ipfsnets/routes/navigatorUtil.dart';
import 'package:ipfsnets/ui/pages/register/register_controller.dart';
import 'package:ipfsnets/ui/widget/login_button.dart';
import 'package:ipfsnets/ui/widget/my_text_field.dart';
import 'package:ipfsnets/utils/log_util.dart';
import 'package:ipfsnets/utils/toast_util.dart';

import '../../../r.dart';


class RegisterPage extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordAgainController = TextEditingController();
  // 获取验证码
  final _codeController = TextEditingController();
  // 邀请码
  final _agreementController = TextEditingController();
  final FocusNode _nodeText2 = FocusNode();
  // 用户协议
  final _registProtocolRecognizer = new TapGestureRecognizer();

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());
    _codeController.addListener(() {
      controller.setCode(_codeController.text);
    });
    controller.init();
    return GetBuilder<RegisterController>(builder: (controller) {
      return new Scaffold(
          body: Form(
        child: ListView(
          children: <Widget>[
            buildClose(context),
            buildTitle(),
            buildTitlem(),
            buildInput(context, controller),
            buildRegisterAndForget(context, controller),
            buildLogin(context, controller),
            buildGoLogin(context),
            // buildCode()
          ],
        ),
      ));
    });
  }

  Padding buildClose(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 40.h, 40.w, 0),
        child: Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: (){
              NavigatorUtil.goBack(context);
            },
            child: Image.asset(R.assetsImgIconClose, width: 40.w, height: 40.w),
          )
        ));
  }

  Padding buildTitle() {
    return Padding(
        padding: EdgeInsets.fromLTRB(50.w, 80.h, 0, 0),
        child: Text(S.current.login_title, style: ITextStyles.loginTitle));
  }

  Padding buildTitlem() {
    return Padding(
        padding: EdgeInsets.fromLTRB(50.w, 5.h, 0, 0),
        child: Text(S.current.login_title_1, style: ITextStyles.loginTitle));
  }

  Padding buildInput(BuildContext context, RegisterController controller) {
    return Padding(
      padding: EdgeInsets.fromLTRB(50.w, 80.h, 50.w, 10.w),
      child: Column(
        children: [
          buildPhoneTextField(context,controller),
          Gaps.line,
          buildPhoneCode(context, controller),
          Gaps.line,
          buildPasswordTextField(context, controller),
          Gaps.line,
          buildPasswordAgainField(context, controller),
          Gaps.line,
          buildShareCode(context, controller),
          Gaps.line,
        ],
      ),
    );
  }

  Padding buildLogin(BuildContext context,RegisterController controller) {
    return Padding(
      padding: EdgeInsets.fromLTRB(50.w, 30.h, 50.w, 0),
      child: LoginButton(
          text: S.current.login_register,
          endble: controller.enableRgister,
          onPressed: () async {
            bool ok = await controller.doRegister();
            if (ok) {
              ToastUtil.show(S.current.register_success);
              NavigatorUtil.jumpLogin(context);
            }
          }),
    );
  }

  /**构建用户名 密码**/
  Row buildPhoneTextField(BuildContext context, RegisterController controller) {
    return Row(
      children: [
        Expanded(child:TextFormField(
          onChanged: (value) {

            controller.setUserName(value);
          },
          controller: _usernameController,
          inputFormatters: [
            LengthLimitingTextInputFormatter(GlobalEntiy.PHONE_MAX_INPUT)
          ],
          style: TextStyle(fontSize: 14),

          decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: controller.isPhone?S.current.register_email_hint:S.current.register_phone_hint),
        )),

        Expanded(child: SizedBox()),
        GestureDetector(
          child: Text(controller.isPhone?S.current.register_phone:S.current.register_email,
              style: TextStyle(fontSize: Dimens.font_sp14, color: Colours.button_sel)),
          onTap: () {
            _usernameController.clear();
            _passwordController.clear();
            _passwordAgainController.clear();
            controller.changeRegister();
          },
        ),
      ],
    );
  }

  /**构建手机验证码**/
  MyTextField buildPhoneCode(BuildContext context,RegisterController controller) {
    return MyTextField(
      focusNode: _nodeText2,
      controller: _codeController,
      maxLength: 6,
      keyboardType: TextInputType.number,
      hintText: S.current.login_forgot_code_hint,
      getVCode: () {
        return Future<bool>.value(controller.getCode());
      },
    );
  }

  /**构建密码**/
  TextFormField buildPasswordTextField(BuildContext context,RegisterController controller) {
    return new TextFormField(
      onChanged: (value) {
        controller.setPassword(value);
      },
      controller: _passwordController,
      obscureText:true,
      style: TextStyle(
          fontSize: 14
      ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(GlobalEntiy.PWD_MAX_INPUT)
      ],
      decoration: InputDecoration(
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        border: InputBorder.none,
        hintText: S.current.register_pwd,
      ),
    );
  }

  /**构建再次输入密码**/
  TextFormField buildPasswordAgainField(BuildContext context, RegisterController controller) {
    return new TextFormField(
      onChanged: (value) {
        controller.setPasswordAgain(value);
      },
      controller: _passwordAgainController,
      obscureText:true,
      style: TextStyle(
          fontSize: 14
      ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(GlobalEntiy.PWD_MAX_INPUT)
      ],
      decoration: InputDecoration(
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        border: InputBorder.none,
        hintText: S.current.register_pwd_again,
      ),
    );
  }

  /**邀请码**/
  TextFormField buildShareCode(BuildContext context, RegisterController controller) {
    return new TextFormField(
      onChanged: (value) {
        controller.setShareCode(value);
      },
      controller: _agreementController,
      style: TextStyle(
          fontSize: 14
      ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(GlobalEntiy.PWD_MAX_INPUT)
      ],

      decoration: InputDecoration(
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        border: InputBorder.none,
        hintText: S.current.register_share_hint,
      ),
    );
  }

  // 用户协议
  Padding buildRegisterAndForget(BuildContext context, RegisterController controller) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.w, 0, 50.w, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Checkbox(
              activeColor: Colours.button_sel,
              value: controller.agreeMent,
              onChanged: (value) {
                controller.setAgreeMent();
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

  // 去登录
  Padding buildGoLogin(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(50.w, 20.h, 50.w, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          verticalDirection: VerticalDirection.down,
          children: [
            GestureDetector(
              child: Text.rich(TextSpan(
                  text: S.current.register_login,
                  style: TextStyle(color: Colours.button_sel,
                      decorationStyle: TextDecorationStyle.solid))),
              onTap: (){
                NavigatorUtil.jumpLogin(context);
              },
            )
          ],
        ));
  }



}
