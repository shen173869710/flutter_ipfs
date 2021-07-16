import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/cny_record_entiy.dart';
/**
 *  CNY 充值提现记录
 */
class CnyRecordItem extends StatelessWidget {
  final CnyRecordEntiy data;
  CnyRecordItem(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 10.w),
      padding: ITextStyles.containerMargin,
      decoration: ITextStyles.boxDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Text(data.from,
                style: ITextStyles.itemTitle),
            flex: 1,
          ),
          Expanded(
            child: Text((data.income>0?"+"+data.income.toString():data.income.toString()),
                style: TextStyle(
                    fontSize: Dimens.font_sp16,
                  color: data.income>0?Colours.item_red:Colours.item_green)),
            flex: 1,
          ),
          Expanded(
            child: Text(data.time,
                style: ITextStyles.itemContent),
            flex: 1,
          ),


        ],
      ),
    );
  }


}

