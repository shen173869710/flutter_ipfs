import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipfsnets/models/news_model.dart';
import 'package:ipfsnets/res/styles.dart';

import '../../../r.dart';

class StatusItem extends StatelessWidget {
  final NewsModel data;

  StatusItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 10.w),
      padding: ITextStyles.containerMargin,
      decoration: ITextStyles.boxDecoration,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              this.data.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: ITextStyles.itemTitle,
            ),
            Gaps.vGap8,
            Stack(
              alignment:Alignment.center ,
              fit: StackFit.passthrough,
              children: [
                Image.network(
                  this.data.imgUrl,
                  width: double.infinity,
                  height: 200.h,
                  fit: BoxFit.cover,
                ),
                Container(
                  child: Image.asset(
                    R.assetsImgIcPlay,
                    height: 40.h,
                    width: 40.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Gaps.vGap8,
            Text(
              data.time,
              style: ITextStyles.itemContent,
            )
          ]),
    );
  }
}
