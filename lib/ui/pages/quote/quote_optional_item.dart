import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipfsnets/models/quote_optional_entity.dart';

import '../../../include.dart';

class QuoteOptionalItem extends StatelessWidget {
  final QuoteOptionalEntity data;
  QuoteOptionalItem(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 30.w),
      decoration: ITextStyles.boxDecoration,
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Gaps.vGap8,
          Row(children: [
            buildItem1(),
            Expanded(child: Container(child: Text(S.current.quote_type),alignment: Alignment.center,),flex: 3,),
            Expanded(child: Container(child: Text(S.current.quote_type),alignment: Alignment.centerRight,),flex: 2,),
          ],),
          Gaps.vGap8,
          Gaps.line,
        ],
      ),
    );
  }

  Expanded buildItem1() {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: SizedBox()),
            Image.asset(R.assetsImgIcLike,width: 20.w,height: 20.w,),
            Gaps.hGap16,
            Column(
              children: [
                Text.rich(TextSpan(children: [
                  WidgetSpan(child: Image.asset(R.assetsImgIcFil, height: 20.w, width: 20.w,)),
                  TextSpan(text: "BTC",style: TextStyle(fontSize: 10)),
                ])),
                Gaps.vGap4,
                Text.rich(TextSpan(children: [
                  WidgetSpan(child: Image.asset(R.assetsImgIcFil, height: 20.w, width: 20.w,)),
                  TextSpan(text: "BTC",style: TextStyle(fontSize: 10)),
                ]))
              ],
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
      flex: 3,
    );
  }
}

