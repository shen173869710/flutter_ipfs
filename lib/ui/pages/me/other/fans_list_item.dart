import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipfsnets/models/fans_entity.dart';
import 'package:ipfsnets/res/styles.dart';

import '../../../../include.dart';

class FansListItem extends StatelessWidget {
  final FansEntity data;
  FansListItem(this.data);
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 10.w),
      decoration: new BoxDecoration(
          color: Colours.layout_bg,
          borderRadius: new BorderRadius.circular((10.w))
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(R.assetsImgIcPoint,width: 40.w,height: 40.w,),
              Text(data.createTime),
            ],
          ),
          Container(
            padding: ITextStyles.containerMargin,
            decoration: ITextStyles.boxDecoration,
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(clipper: _MyClipper(),child: ImageUtil.getFansFormNet(data.avatar)),
                Gaps.hGap4,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.vGap4,
                    Row(
                      children: [

                        Text(getUserName(data.nickname),style:TextStyle(fontSize: 20,color: Colours.item_title_color),maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Gaps.hGap2,
                        Image.asset(R.assetsImgIcVip,height: 28.w, width: 28.w,),
                        Gaps.hGap2,
                        Text(data.levelName == null?"":data.levelName,style:TextStyle(fontSize: 14,color: Color(0xfff4CB0B)))
                      ],
                    ),
                    Gaps.vGap8,
                    Row(
                      children: [
                        Text(S.current.fans_item_3,style:TextStyle(fontSize: 14,color: Colours.item_content_color)),
                        Gaps.hGap4,
                        Container(
                          width: 140.w,
                          child:Text(data.personalKpi.toStringAsFixed(0),style:TextStyle(fontSize: 14,color: Color(0xffEF4033)),maxLines: 1,overflow: TextOverflow.ellipsis,),
                        ),

                        Gaps.hGap4,
                        Text(S.current.fans_item_4,style:TextStyle(fontSize: 14,color: Colours.item_content_color)),
                        Gaps.hGap4,
                        Text(data.teamKpi.toStringAsFixed(0),style:TextStyle(fontSize: 14,color: Color(0xffEF4033))),
                      ],
                    ),
                  ],
                ),

              ],
            ),
          )
        ],
      )



    );
  }


  getUserName(String data) {
    if (data.length > 16) {
      return data.substring(0,16)+"..";
    }
    return data;
  }
}



class _MyClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    return new Rect.fromLTRB(0, 0, 100.h,100.h);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}

