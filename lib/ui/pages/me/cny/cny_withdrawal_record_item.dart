import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/cny_record_entiy.dart';
import 'package:ipfsnets/models/rechage_record_model.dart';
/**
 *  CNY 充值记录
 */
class CnyWithdrawalRecordItem extends StatelessWidget {
  final RechageRecordModel data;
  CnyWithdrawalRecordItem(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 10.w),
      padding: ITextStyles.containerMargin,
      decoration: ITextStyles.boxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            children: [
              Text(data.title,style: ITextStyles.itemTitle,),
              Expanded(child: SizedBox()),
              Text(data.source,style: ITextStyles.itemTitle,),
            ],
          ),
          Gaps.vGap8,
          Row(
            children: [
              Text(data.time,style: ITextStyles.itemContent,),
              Expanded(child: SizedBox()),
              Text(getStatus(data.status),style: TextStyle(
                fontSize: 14,
                color: getStatusColor(data.status),
              ),),
            ],
          ),
          Gaps.vGap8,
          Text(data.time,style: ITextStyles.itemContent,),
        ],
      ),
    );
  }

  String getStatus(int status) {
    if (status == 0) {
      return S.current.cny_rechage_record_suc;
    }else if (status == 1) {
      return S.current.cny_rechage_record_fail;
    }
    return S.current.cny_rechage_record_ing;
  }

  Color getStatusColor(int status) {
    if (status == 0) {
      return Colours.item_green;
    }else if (status == 1) {
      return Colours.item_red;
    }
    return Colours.item_content_color;
  }

}

