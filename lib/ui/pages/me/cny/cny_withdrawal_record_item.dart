import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/cny_record_entiy.dart';
import 'package:ipfsnets/models/cny_withdrawal_record_entity.dart';
import 'package:ipfsnets/models/rechage_record_model.dart';
import 'package:ipfsnets/utils/date_util.dart';
/**
 *  CNY 充值记录
 */
class CnyWithdrawalRecordItem extends StatelessWidget {
  final CnyWithdrawalRecordEntity data;
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
              Text(data.amount.toString()+"CNY",style: ITextStyles.itemTitle,),
              Expanded(child: SizedBox()),
              Text("实际到账:"+data.recordedAmount.toString()+"CNY",style: ITextStyles.itemTitle,),
            ],
          ),
          Gaps.vGap8,
          Row(
            children: [
              Text("手续费"+data.serviceCharge.toString()+"CNY",style: ITextStyles.itemContent,),
              Expanded(child: SizedBox()),
              Text("转化:"+data.recordedNets.toString()+"NETS",style: ITextStyles.itemContent,),
            ],
          ),
          Gaps.vGap8,
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
          Gaps.vGap8,
          Text("收款账户:"+data.accountName.toString() +" " +data.accountNumber!+" "+data.accountBank!,style: ITextStyles.itemContent,),
        ],
      ),
    );
  }

  String getStatus(String status) {
    if (status == "1") {
      return S.current.cny_withdrawal_record_suc;
    }else if (status == "2") {
      return S.current.cny_withdrawal_record_fail;
    }
    return S.current.cny_withdrawal_record_ing;
  }

  Color getStatusColor(String status) {
    if (status == "1") {
      return Colours.item_green;
    }else if (status == "2") {
      return Colours.item_red;
    }
    return Colours.item_content_color;
  }


  getAddress() {

  }

}

