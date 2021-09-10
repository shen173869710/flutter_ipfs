import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipfsnets/models/find__entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/res/styles.dart';
class NewsItem extends StatelessWidget {
  final FindEntity data;
  NewsItem(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 10.w),
      padding: ITextStyles.containerMargin,
      decoration: ITextStyles.boxDecoration,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(this.data.noticeTitle, maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18, color: Colours.item_title_color),
                ),
                Gaps.vGap8,
                Text(data.createTime,
                  style: ITextStyles.itemContent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}

