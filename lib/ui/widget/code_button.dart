import 'package:flutter/material.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/res/dimens.dart';


class CodeButton extends StatelessWidget {

  const CodeButton({
    this.text = '',
    this.fontSize = Dimens.font_sp18,
    this.textColor,
    this.disabledTextColor,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.minHeight = 48.0,
    this.minWidth = double.infinity,
    this.padding = const EdgeInsets.symmetric(horizontal: 0),
    this.radius = 2.0,
    this.side = BorderSide.none,
    required this.onPressed,
  });

  final String text;
  final double fontSize;
  final Color? textColor;
  final Color? disabledTextColor;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final double? minHeight;
  final double? minWidth;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final double radius;
  final BorderSide side;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text(text, style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.normal),),
        onPressed: onPressed,
        style: ButtonStyle(
          // 文字颜色
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (onPressed == null) {
              return Colours.item_content_color;
            }
            return Colours.button_sel;
          },
          ),
          // 背景颜色
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            // if (states.contains(MaterialState.disabled)) {
            //   return disabledBackgroundColor ?? (isDark ? Colours.button_sel : Colours.button_sel);
            // }
            return  Colours.transparent;
          }),
          // 水波纹
          // 按钮最小大小
          // minimumSize: (minWidth == null || minHeight == null) ? null : MaterialStateProperty.all<Size>(Size(minWidth!, minHeight!)),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          side: MaterialStateProperty.all<BorderSide>(side),
        )
    );
  }
}