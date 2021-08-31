import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipfsnets/models/share_cion_entity.dart';

import '../../../../include.dart';

class MachineTotalListItem extends StatelessWidget {
  final ShareCionEntity data;
  MachineTotalListItem(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 10.w),
      padding: ITextStyles.containerMargin,
      decoration: ITextStyles.boxDecoration,
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildTopItem(context,S.current.machine_total_list_1, ""),
          Gaps.vGap4,
          buildItem1(data.total.toString()+" FIL", data.createTime),
          Gaps.vGap8,
          Gaps.line,
          Gaps.vGap8,
          buildItem(S.current.machine_total_list_2+data.extraCut.toString()+"%",data.releaseNow.toString()+" FIL",ITextStyles.itemTitle),
          Gaps.vGap8,
          buildItem(S.current.machine_total_list_3+data.releaseDay.toString()+S.current.day,data.freezeNum.toString()+" FIL",ITextStyles.itemTitle),
        ],
      ),
    );
  }


  Row buildItem(String title, String desc, TextStyle textStyle) {
    return Row(
      children: [
        Text(title, style: ITextStyles.itemContent),
        Expanded(child: SizedBox(),),
        Text(desc, style: textStyle),
      ],
    );
  }

  Row buildTopItem(BuildContext context,String title, String desc) {
    return Row(
      children: [
        Text(title, style: ITextStyles.itemTitle),
        Expanded(child: SizedBox(),),
        GestureDetector(child:Image.asset(R.assetsImgMore, width: 35.w,height: 35.w,),onTap: (){
          NavigatorUtil.push(context, '${Routes.machineEarningsPage}?time=${Uri.encodeComponent(data.createTime)}');
        },)

      ],
    );
  }

  Row buildItem1(String title, String desc) {
    return Row(
      children: [
        Text(title, style: ITextStyles.itemTitleRed),
        Expanded(child: SizedBox(),),
        Text(desc, style: ITextStyles.itemTitle),
      ],
    );
  }
}

