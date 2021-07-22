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
import 'package:ipfsnets/ui/widget/login_button.dart';
import 'package:ipfsnets/ui/widget/my_text_field.dart';
import 'package:ipfsnets/utils/toast_util.dart';

import '../../../r.dart';
import 'forget_controller.dart';


class ForgetPage extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordAgainController = TextEditingController();
  // 获取验证码
  final _codeController = TextEditingController();


  final FocusNode _nodeText2 = FocusNode();


  @override
  Widget build(BuildContext context) {
    final ForgetController controller = Get.put(ForgetController());
    _codeController.addListener(() {
      controller.setCode(_codeController.text);
    });
    return GetBuilder<ForgetController>(builder: (controller) {
      return new Scaffold(
        appBar: AppBar(
          title: new Text(S.current.login_forgot_pwd),
          centerTitle: true,
          backgroundColor: Colours.button_sel,
        ),
          body: Form(
        child: ListView(
          children: <Widget>[
            buildInput(context, controller),
            // buildRegisterAndForget(context, controller),
            buildLogin(context, controller),

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


  Padding buildInput(BuildContext context, ForgetController controller) {
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

        ],
      ),
    );
  }

  Padding buildLogin(BuildContext context,ForgetController controller) {
    return Padding(
      padding: EdgeInsets.fromLTRB(50.w, 30.h, 50.w, 0),
      child: LoginButton(
          text: S.current.sure,
          endble: controller.enableRgister,
          onPressed: () async {
            bool ok = await controller.findPwd();
            if (ok) {
              ToastUtil.show(S.current.option_success);
              NavigatorUtil.jumpLogin(context);
            }
          }),
    );
  }

  /**构建用户名 密码**/
  Row buildPhoneTextField(BuildContext context, ForgetController controller) {
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
              hintText: controller.isPhone?S.current.register_email_hint:S.current.login_phone),
        )),

        Expanded(child: SizedBox()),
        GestureDetector(
          child: Text(controller.isPhone?S.current.forgot_by_phone:S.current.forget_by_email,
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
  MyTextField buildPhoneCode(BuildContext context,ForgetController controller) {
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
  TextFormField buildPasswordTextField(BuildContext context,ForgetController controller) {
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
        hintText: S.current.login_forgot_pwd,
      ),
    );
  }

  /**构建再次输入密码**/
  TextFormField buildPasswordAgainField(BuildContext context, ForgetController controller) {
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
        hintText: S.current.login_forgot_pwd_again,
      ),
    );
  }


}
