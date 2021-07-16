import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipfsnets/res/colors.dart';


// 输入框按钮
class TextEditInput extends StatelessWidget {
  final String? hintText;

// 监听输入改变事件
  final ValueChanged<String>? onChanged;
// 输入控制器
  final TextEditingController? controller;

  const TextEditInput({
    Key? key,
    this.hintText,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
