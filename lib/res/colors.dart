import 'dart:ui';

import 'package:flutter/material.dart';

class Colours {
  static const Color bg_color = Color(0xfff1f1f1);
  static const Color dark_bg_color = Color(0xFF18191A);

  static const Color material_bg = Color(0xFFFFFFFF);
  static const Color dark_material_bg = Color(0xFF303233);

  static const Color text = Color(0xFF333333);
  static const Color dark_text = Color(0xFFB8B8B8);

  static const Color text_gray = Color(0xFF999999);
  static const Color dark_text_gray = Color(0xFF666666);

  static const Color text_gray_c = Color(0xFFcccccc);
  static const Color dark_button_text = Color(0xFFF2F2F2);

  static const Color bg_gray = Color(0xFFF6F6F6);
  static const Color dark_bg_gray = Color(0xFF1F1F1F);

  static const Color app_bar_bg = Color(0xFF2E1FC1);
  static const Color app_main = Color(0xFF666666);

  static const Color tab_sel = Color(0xFF516DFF);
  static const Color tab_nusel = Color(0xFF959595);

  static const Color transparent_80 = Color(0x80000000); //<!--204-->
  static const Color transparent = Color(0x00000000); //<!--204-->
  static const Color text_dark = Color(0xFF333333);
  static const Color text_normal = Color(0xFF666666);

  static const Color divider = Color(0xffe5e5e5);

  static const Color gray_33 = Color(0xFF333333); //51
  static const Color gray_66 = Color(0xFF666666); //102
  static const Color gray_99 = Color(0xFF999999); //153
  static const Color common_orange = Color(0XFFFC9153); //252 145 83
  static const Color gray_ef = Color(0XFFEFEFEF); //153

  static const Color gray_f0 = Color(0xfff0f0f0); //<!--204-->
  static const Color gray_f5 = Color(0xfff5f5f5); //<!--204-->
  static const Color gray_cc = Color(0xffcccccc); //<!--204-->
  static const Color gray_ce = Color(0xffcecece); //<!--206-->
  static const Color green_1 = Color(0xff009688); //<!--204-->
  static const Color green_62 = Color(0xff626262); //<!--204-->
  static const Color green_e5 = Color(0xffe5e5e5); //<!--204-->

  static const Color user_vip = Color(0xff0E0677); //<!--204-->
  static const Color text_white = Color(0xFFFFFFFF);
  static const Color white = Color(0xFFFFFFFF);
  // button选中
  static const Color button_sel = Color(0xff516DFF);
  // button没有选中
  static const Color button_unsel = Color(0xffCCCCCC);

  // 顶部title颜色
  static const Color title_bg = Color(0xff2D1EC0);
  // 顶部布局颜色
  static const Color layout_bg = Color(0xffF3F4F7);
  // 分割线颜色
  static const Color line = Color(0xffCCCCCC); //<!--204-->
  static const Color item_red = Color(0xffEF4033);
  static const Color item_green = Color(0xff1BDA58);
  static const Color item_title_color = Color(0xff323232); //<!--204-->
  static const Color item_content_color = Color(0xff959595); //<!--204-->

  static const Color text_disabled = Color(0xFFD4E2FA);
  static const Color dark_text_disabled = Color(0xFFCEDBF2);

  static const Color bg_gray_ = Color(0xFFFAFAFA);
  static const Color dark_bg_gray_ = Color(0xFF242526);

  static const Color chain_bg = Color(0xFFE6EAFF);

  static const Color lable_red = Color(0xFFFDEBEA);
  static const Color lable_red_txt = Color(0xFFEF4033);

  static const Color lable_yellow = Color(0xFFFEF7E6);
  static const Color lable_yellow_txt = Color(0xFFFAB606);

  static const Color start = Color(0xFF74D1FF);
  static const Color end = Color(0xFF516DFF);
}

Map<String, Color> circleAvatarMap = {
  'A': Colors.blueAccent,
  'B': Colors.blue,
  'C': Colors.cyan,
  'D': Colors.deepPurple,
  'E': Colors.deepPurpleAccent,
  'F': Colors.blue,
  'G': Colors.green,
  'H': Colors.lightBlue,
  'I': Colors.indigo,
  'J': Colors.blue,
  'K': Colors.blue,
  'L': Colors.lightGreen,
  'M': Colors.blue,
  'N': Colors.brown,
  'O': Colors.orange,
  'P': Colors.purple,
  'Q': Colors.black,
  'R': Colors.red,
  'S': Colors.blue,
  'T': Colors.teal,
  'U': Colors.purpleAccent,
  'V': Colors.black,
  'W': Colors.brown,
  'X': Colors.blue,
  'Y': Colors.yellow,
  'Z': Colors.grey,
  '#': Colors.blue,
};

Map<String, Color> themeColorMap = {
  'gray': Colours.gray_33,
  'blue': Colors.blue,
  'blueAccent': Colors.blueAccent,
  'cyan': Colors.cyan,
  'deepPurple': Colors.deepPurple,
  'deepPurpleAccent': Colors.deepPurpleAccent,
  'deepOrange': Colors.deepOrange,
  'green': Colors.green,
  'indigo': Colors.indigo,
  'indigoAccent': Colors.indigoAccent,
  'orange': Colors.orange,
  'purple': Colors.purple,
  'pink': Colors.pink,
  'red': Colors.red,
  'teal': Colors.teal,
  'black': Colors.black,
};
