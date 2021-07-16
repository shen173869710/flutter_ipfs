import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/cny_record_entiy.dart';
import 'package:ipfsnets/models/rechage_record_model.dart';
/**
 *  CNY 充值记录
 */
class CnyRechageRecordItem extends StatelessWidget {
  final RechageRecordModel data;
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
              Text(data.time,style: ITextStyles.itemContent,),
              Expanded(child: SizedBox()),
              Text(getStatus(data.status),style: TextStyle(
                fontSize: 14,
                color: getStatusColor(data.status),
              ),),

            ],
          ),
          Text(data.title,style: ITextStyles.itemTitle,),
          Visibility(child:Text(data.source,style: ITextStyles.itemTitle,),visible:
          data.status==0?false:true,),
          Image.network(data.imgUrl,width: 100.w,height: 100.w,)
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

