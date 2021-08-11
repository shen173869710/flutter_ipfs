import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipfsnets/data/global_entiy.dart';
import 'package:ipfsnets/generated/l10n.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/res/styles.dart';
import 'package:ipfsnets/ui/pages/me/setting/password_conroller.dart';
import 'package:ipfsnets/ui/widget/login_button.dart';
import 'package:ipfsnets/ui/widget/my_text_field.dart';



class PasswordPage extends StatelessWidget {

  PasswordPage({
    required this.type,
  });

  String type;
  final _layout1 = TextEditingController();
  final _layout2 = TextEditingController();
  final _layout3 = TextEditingController();
  // 获取验证码
  final _codeController = TextEditingController();
  final FocusNode _nodeText2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    final PasswordController controller = Get.put(PasswordController());
    controller.type = type;
    controller.init();
    _codeController.addListener(() {
      controller.setCode(_codeController.text);
    });
    return GetBuilder<PasswordController>(builder: (controller) {
        return new Scaffold(
          appBar: AppBar(
            title: new Text(getTitle()),
            centerTitle: true,
            backgroundColor: Colours.app_bar_bg,
          ),
          body: Form(
            child: ListView(
              children: <Widget>[
                buildInput(context, controller),
                buildLogin(context, controller),
                // buildCode()
              ],
            ),
          ));
      });

  }


  Padding buildInput(BuildContext context, PasswordController controller) {
    return Padding(
      padding: EdgeInsets.fromLTRB(50.w, 10.h, 50.w, 10.w),
      child: Column(
        children: [
          Visibility(child: buildLagout_1(context,controller),visible: layoutVisible(1),),
          Visibility(child: Gaps.line,visible: layoutVisible(1),),

          Visibility(child: buildLagout_2(context,controller),visible: layoutVisible(2),),
          Visibility(child: Gaps.line,visible: layoutVisible(2),),
          
          Visibility(child: buildLagout_3(context,controller),visible: layoutVisible(3),),
          Visibility(child: Gaps.line,visible: layoutVisible(3),),

          Visibility(child: buildPhoneCode(context, controller),visible: layoutVisible(4),),
        ],
      ),
    );
  }

  Padding buildLogin(BuildContext context,PasswordController controller) {
    LogUtil.e("buildLogin"+controller.enableSure.toString());
    return Padding(
      padding: EdgeInsets.fromLTRB(50.w, 30.h, 50.w, 0),
      child: LoginButton(
          text: S.current.sure,
          endble: controller.enableSure,
          onPressed: () async {
            bool isSuc = await controller.doSubmit(context);
          }),
    );
  }

  /**构建用户名*/
  TextFormField buildLagout_1(BuildContext context, PasswordController controller) {
    return TextFormField(
      onChanged: (value) {
        controller.setValue1(value.toString());
      },
      controller: _layout1,
      inputFormatters: [
        LengthLimitingTextInputFormatter(GlobalEntiy.PHONE_MAX_INPUT)
      ],
      style: TextStyle(fontSize: 14),

      decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: layoutHint(1)
      )
    );
  }

  /**构建密码**/
  TextFormField buildLagout_2(BuildContext context,PasswordController controller) {
    return new TextFormField(
      onChanged: (value) {
        controller.setValue2(value.toString());
      },
      controller: _layout2,
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
        hintText: layoutHint(2),
      ),
    );
  }

  /**构建再次输入密码**/
  TextFormField buildLagout_3(BuildContext context, PasswordController controller) {
    return new TextFormField(
      onChanged: (value) {
        controller.setValue3(value.toString());
      },
      controller: _layout3,
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
        hintText:  layoutHint(3),
      ),
    );
  }
  
  /**构建手机验证码**/
  MyTextField buildPhoneCode(BuildContext context,PasswordController controller) {
    return MyTextField(
      focusNode: _nodeText2,
      controller: _codeController,
      maxLength: 6,
      keyboardType: TextInputType.number,
      hintText: layoutHint(4),
      getVCode: () {
        return Future<bool>.value(controller.getCode());
      },
    );
  }


  String getTitle() {
    if (type == GlobalEntiy.PASSWORD_ACCOUNT) {
      return S.current.pwd_account_title;
    }else if (type == GlobalEntiy.PASSWORD_CHANGE) {
      return S.current.pwd_login_title;
    }else if (type == GlobalEntiy.PASSWORD_APLAY) {
      return S.current.pwd_pay_title;
    }
    return "";
  }
  /**layout 是否可见**/
  bool layoutVisible(int postion){
    if (type == GlobalEntiy.PASSWORD_ACCOUNT){
      // 修改账户页面
      if (postion == 1) {
        return true;
      }else if (postion == 2) {
        return false;
      }else if (postion == 3) {
        return false;
      }else if (postion == 4) {
        return true;
      }
    }else if (type == GlobalEntiy.PASSWORD_CHANGE) {
      // 修改账登录密码
      if (postion == 1) {
        return true;
      }else if (postion == 2) {
        return true;
      }else if (postion == 3) {
        return true;
      }else if (postion == 4) {
        return false;
      }
    }else if (type == GlobalEntiy.PASSWORD_APLAY) {
      // 修改支付密码
      if (postion == 1) {
        return false;
      }else if (postion == 2) {
        return true;
      }else if (postion == 3) {
        return true;
      }else if (postion == 4) {
        return true;
      }
    }
    return false;
  }
  
  /**/
  /**每行默认显示**/
  String layoutHint(int postion){
    if (type == GlobalEntiy.PASSWORD_ACCOUNT){
      // 修改账户页面
      if (postion == 1) {
        return S.current.pwd_account_hint;
      }else if (postion == 4) {
        return S.current.pwd_account_code;
      }
    }else if (type == GlobalEntiy.PASSWORD_CHANGE) {
      // 修改账登录密码
      if (postion == 1) {
        return S.current.pwd_login_old;
      }else if (postion == 2) {
        return S.current.pwd_login_new;
      }else if (postion == 3) {
        return S.current.pwd_login_again;
      }
    }else if (type == GlobalEntiy.PASSWORD_APLAY) {
      // 修改支付密码
      if (postion == 2) {
        return S.current.pwd_pay_new;
      }else if (postion == 3) {
        return S.current.pwd_pay_new_again;
      }else if (postion == 4) {
        return S.current.pwd_pay_code;
      }
    }
    return "";
  }
  
  

}
