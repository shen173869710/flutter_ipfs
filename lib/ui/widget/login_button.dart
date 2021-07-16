import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/res/styles.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final bool endble;
  final VoidCallback? onPressed;

  const LoginButton({
    required this.text,
    required this.endble,
    required this.onPressed
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ElevatedButton(
          // 按钮样式
          style: IButtonStyle.statusButton,
          onPressed: endble?onPressed:null,
          child: Text(text, style:ITextStyles.whiteTitle
          ),
        ),
      ),
    );
  }
}
