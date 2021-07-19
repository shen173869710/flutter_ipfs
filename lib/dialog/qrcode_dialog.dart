import 'dart:core';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import '../include.dart';

class QrcodeDialog extends StatelessWidget {

  late String url;
  late String title;

  QrcodeDialog(this.url, this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: EdgeInsets.all(40.w),
            decoration: ITextStyles.boxDecoration,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title),
                Gaps.vGap12,

                ImageUtil.loadImage(url, 400.h, 400.h),
                Gaps.vGap12,
                // Text("钱包地址", style: TextStyle(
                //   color: Colours.item_content_color,
                //   fontSize: 12,
                // ),),
                // Gaps.vGap4,
                // Text("111111111111111", style: TextStyle(
                //   color: Colours.item_title_color,
                //   fontSize: 12,
                // ),),
                Gaps.vGap12,
                GestureDetector(
                  child:Text("关闭", style: TextStyle(
                    color: Colours.item_content_color,
                    fontSize: 14,
                  ),),
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                )

              ],
            ))
      ],
    );
  }
}
