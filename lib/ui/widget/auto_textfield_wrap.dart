import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipfsnets/res/colors.dart';

class AuthTextFieldWrap extends StatelessWidget {
  final Widget child;

  const AuthTextFieldWrap({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colours.text_white,
      ),
      child: child,
    );
  }
}
