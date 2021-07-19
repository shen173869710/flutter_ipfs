import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/cny_recharge_record_entity.dart';
import 'package:ipfsnets/models/cny_record_entiy.dart';
import 'package:ipfsnets/models/rechage_record_model.dart';
import 'package:ipfsnets/utils/date_util.dart';
import 'package:ipfsnets/utils/string_util.dart';
/**
 *  CNY 充值记录
 */
class CnyRechageRecordItem extends StatelessWidget {
  final CnyRechargeRecordEntity data;
  CnyRechageRecordItem(this.data);
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
              Text(DateUtil.getTime(data.createTime),style: ITextStyles.itemContent,),
              Expanded(child: SizedBox()),
              Text(getStatus(data.status!),style: TextStyle(
                fontSize: 14,
                color: getStatusColor(data.status!),
              ),),

            ],
          ),


          Visibility(child: Text(StringUtil.isEmpty(data.remarks!)?"":data.remarks!,style: ITextStyles.itemTitle,),visible: StringUtil.isEmpty(data.remarks!)?false:true,),
          // Visibility(child:Text(data.remarks!,style: ITextStyles.itemTitle,),visible:
          // data.status==0?false:true,),
          ImageUtil.loadImage(data.evidence!,100.w, 100.w, def: ''),
          // Image.network(data.evidence!,width: 100.w,height: 100.w,)
        ],
      ),
    );
  }

  String getStatus(String status) {
    if (status == "1") {
      return S.current.cny_rechage_record_suc;
    }else if (status == "2") {
      return S.current.cny_rechage_record_fail;
    }
    return S.current.cny_rechage_record_ing;
  }

  Color getStatusColor(String status) {
    if (status == "1") {
      return Colours.item_green;
    }else if (status == "2") {
      return Colours.item_red;
    }
    return Colours.item_content_color;
  }



}

