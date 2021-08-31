import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipfsnets/models/share_cion_entity.dart';

import '../../../../include.dart';

class MachineEraningsListItem extends StatelessWidget {
  final ShareCionEntity data;
  MachineEraningsListItem(this.data);
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
          buildTopItem(S.current.machine_earnings_item_1, data.sid.toString()),
          Gaps.vGap8,
          Gaps.line,
          Gaps.vGap8,
          buildItem(S.current.machine_earnings_item_2,data.total.toString()+" FIL",TextStyle(color: Colours.item_red, fontSize: 14)),
          Gaps.vGap8,
          buildItem(S.current.machine_earnings_item_3+" "+data.extraCut.toString()+"%",data.releaseNow.toString()+"FIL",ITextStyles.itemTitle),
          Gaps.vGap8,
          buildItem(S.current.machine_earnings_item_4+" "+data.releaseDay.toString()+S.current.day,data.freezeNum.toString()+"FIL",ITextStyles.itemTitle),
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

  Row buildTopItem(String title, String desc) {
    return Row(
      children: [
        Text(title, style: ITextStyles.itemTitle),
        Expanded(child: SizedBox(),),
        Text(desc, style: TextStyle(fontSize: 14, color: Colours.button_sel)),
      ],
    );
  }

}

