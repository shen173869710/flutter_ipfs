import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ipfsnets/data/global_entiy.dart';
import 'package:ipfsnets/generated/l10n.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/widget/login_button.dart';


class UserEditPage extends StatelessWidget {
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: new Text(S.current.edit_nick_name),
          centerTitle: true,
          // leading: Icon(Icons.arrow_back_ios,color: Colours.text_white),
          backgroundColor: Colours.app_bar_bg),
    backgroundColor:  Colours.bg_color,
    body: Container(
      padding: EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 40.h),
      width: double.infinity,
      margin: ITextStyles.containerMargin,
      child: Column(
        children: [
          buildPasswordTextField(context),
          Padding(
            padding: EdgeInsets.fromLTRB(0.w, 50.h, 0.w, 0),
            child: LoginButton(
                text: S.current.save, endble: true, onPressed: () {
              Navigator.of(context).pop(_passwordController.text);
            }),
          )

        ],
      ),
    ));
  }


  /**构建密码**/
  TextFormField buildPasswordTextField(BuildContext context) {
    return new TextFormField(
      onChanged: (value) {
      },
      controller: _passwordController,
      style: TextStyle(
          fontSize: 14
      ),
      maxLength: 16,
      inputFormatters: [
        LengthLimitingTextInputFormatter(GlobalEntiy.PWD_MAX_INPUT)
      ],
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colours.line)),
        hintText: S.current.edit_nick_input,
      ),
    );
  }


}
