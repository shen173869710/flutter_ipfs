import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/res/styles.dart';

import '../../include.dart';

class NextButton extends StatelessWidget {
  final String text;
  final bool endble;
  final VoidCallback? onPressed;

  const NextButton({
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
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
                return Colours.button_sel;
              },
            ),
            minimumSize: MaterialStateProperty.all(Size(200, 70.h)),
          ),
          onPressed: null,
          child: Text(text, style:ITextStyles.whiteTitle
          ),
        ),
      ),
    );
  }
}
