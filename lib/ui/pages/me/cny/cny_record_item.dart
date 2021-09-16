import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/cny_acount_record_entity.dart';
import 'package:ipfsnets/models/cny_record_entiy.dart';
import 'package:ipfsnets/utils/date_util.dart';
import 'package:ipfsnets/utils/num_util.dart';
/**
 *  CNY 充值提现记录
 */
class CnyRecordItem extends StatelessWidget {
  final CnyAcountRecordEntity data;
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
            child: Text(data.source.toString(),
                style: ITextStyles.itemTitle),
            flex: 1,
          ),
          Expanded(
            child: Text((data.amount!>0?"+"+NumUtil.prseeZero(data.amount!.toString()):NumUtil.prseeZero(data.amount!.toString())),
                style: TextStyle(
                    fontSize: Dimens.font_sp16,
                  color: data.amount!>0?Colours.item_green:Colours.item_red)),
            flex: 1,
          ),
          Expanded(
            child: Text(DateUtil.getTime(data.createTime),
                style: ITextStyles.itemContent),
            flex: 1,
          ),


        ],
      ),
    );
  }


}

