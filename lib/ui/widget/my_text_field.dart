import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ipfsnets/res/dimens.dart';
import 'package:ipfsnets/ui/widget/code_button.dart';
import 'package:ipfsnets/utils/device_utils.dart';

import '../../include.dart';
import 'my_button.dart';

/// 验证码
class MyTextField extends StatefulWidget {
  const MyTextField(
      {required this.controller,
      this.maxLength = 16,
      this.autoFocus = false,
      this.keyboardType = TextInputType.text,
      this.hintText = '',
      this.focusNode,
      this.getVCode,
      this.keyName});

  final TextEditingController controller;
  final int maxLength;
  final bool autoFocus;
  final TextInputType keyboardType;
  final String hintText;
  final FocusNode? focusNode;
  final Future<bool> Function()? getVCode;

  /// 用于集成测试寻找widget
  final String? keyName;

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _clickable = true;

  /// 倒计时秒数
  final int _second = 60;

  /// 当前秒数
  late int _currentSecond;
  StreamSubscription? _subscription;

  Future _getVCode() async {
    final bool isSuccess = await widget.getVCode!();
    if (isSuccess != null && isSuccess) {
      setState(() {
        _currentSecond = _second;
        _clickable = false;
      });
      _subscription = Stream.periodic(const Duration(seconds: 1), (int i) => i)
          .take(_second)
          .listen((int i) {
        setState(() {
          _currentSecond = _second - i - 1;
          _clickable = _currentSecond < 1;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final bool isDark = themeData.brightness == Brightness.dark;

    Widget textField = TextField(
      focusNode: widget.focusNode,
      maxLength: widget.maxLength,
      autofocus: widget.autoFocus,
      controller: widget.controller,
      style: TextStyle(fontSize: 14),
      textInputAction: TextInputAction.done,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.hintText,
        counterText: '',
      ),
    );

    /// 个别Android机型（华为、vivo）的密码安全键盘不弹出问题（已知小米正常），临时修复方法：https://github.com/flutter/flutter/issues/68571 (issues/61446)
    /// 怀疑是安全键盘与三方输入法之间的切换冲突问题。
    if (Device.isAndroid) {
      textField = Listener(
        onPointerDown: (e) => FocusScope.of(context).requestFocus(widget.focusNode),
        child: textField,
      );
    }

    late Widget getVCodeButton;
    if (widget.getVCode != null) {
      getVCodeButton = CodeButton(
        onPressed: _clickable ? _getVCode : null,
        fontSize: Dimens.font_sp14,
        text: _clickable ? S.current.login_forgot_code : '（$_currentSecond s）',
        textColor: themeData.primaryColor,
        disabledTextColor: isDark ? Colours.button_sel : Colours.item_content_color,
        backgroundColor: Colors.transparent,
        disabledBackgroundColor:Colors.transparent,
        radius: 1.0,
        minHeight: 26.0,
        minWidth: 76.0,
      );
    }

    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        textField,
        Positioned(child: getVCodeButton,right: 0,)
      ],
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

}
