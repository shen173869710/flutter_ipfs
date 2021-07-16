import 'package:flutter/cupertino.dart';
import 'package:ipfsnets/models/news_model.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/res/styles.dart';
import 'package:ipfsnets/utils/encrypt_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class NewsItem extends StatelessWidget {
  final NewsModel data;
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
                Text(this.data.title, maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: ITextStyles.itemTitle,
                ),
                Padding(padding: EdgeInsets.only(top: 3)),
                Row(
                  children: <Widget>[
                    Text(data.time,
                      style: ITextStyles.itemContent,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 16)),
          Image.network(
            this.data.imgUrl,
            width: 200.w,
            height: 120.w,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }


}

