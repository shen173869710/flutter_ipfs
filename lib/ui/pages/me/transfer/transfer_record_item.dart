import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/transfer_record_entity.dart';
/**
 *  CNY 充值提现记录
 */
class TransferRecordItem extends StatelessWidget {
  final TransferRecordEntity data;

  TransferRecordItem(this.data);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
        margin: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 10.w),
        padding: ITextStyles.containerMargin,
        decoration: ITextStyles.boxDecoration,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ImageUtil.loadImage(data.coinIcon, 40.w, 40.w,def:R.assetsImgMyWalletFil),
                Gaps.hGap8,
                Text(data.coinName,style: ITextStyles.itemTitle),
                Expanded(child:SizedBox()),
                Text(data.transferNumber.toString(),style: ITextStyles.itemTitle),
              ],
            ),
            Gaps.vGap4,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(DateUtil.getTime(data.createTime),style: ITextStyles.itemContent),
                Expanded(child:SizedBox()),
                Text(getStatus(data.status),style: TextStyle(fontSize: 14, color:getStatusColor(data.status) )),
              ],
            ),
            Gaps.vGap4,
            Row(
              children: [
                Expanded(child:  Text(getFromAddress(data),maxLines:2,style:ITextStyles.itemContent),),
              ],
            ),
            Gaps.vGap4,
            Row(
              children: [
                Expanded(child:  Text(getFromNick(data),maxLines:2,style:ITextStyles.itemContent),),
              ],
            ),
          ],
        )
    );;
  }

  String getStatus(num status) {
    if (status == 0) {
      return S.current.transfer_success;
    }
    return S.current.transfer_fail;
  }

  Color getStatusColor(num status) {
    if (status == 0) {
      return Colours.item_green;
    }
    return Colours.item_red;

  }

  String getFromAddress(TransferRecordEntity data) {
    // 别人转给我
    String address = "";
    if (data.outStatus == 0) {
      address = S.current.transfer_record_in +": "+ data.username;
    }else {
      address = S.current.transfer_record_out +": "+ data.username;
    }
    return address;
  }

  String getFromNick(TransferRecordEntity data) {
    String address = "";
    if (data.outStatus == 0) {
      address = S.current.me_info_nick +":     "+ data.username;
    }else {
      address = S.current.me_info_nick +":     "+ data.username;
    }
    return address;
  }


}

