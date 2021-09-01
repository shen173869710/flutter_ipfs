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
                Text(getMoney(data.outStatus, data.transferNumber),style:TextStyle(fontSize: 14, color:getMoneyColor(data.outStatus))),
              ],
            ),
            Gaps.vGap4,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(DateUtil.getTime(data.createTime),style: ITextStyles.itemContent),
                Expanded(child:SizedBox()),
                Text(getStatus(data.status,data.outStatus),style: TextStyle(fontSize: 14, color:getStatusColor(data.status) )),
              ],
            ),
            Gaps.vGap4,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(getFromAddress(data),maxLines:2,style:ITextStyles.itemContent12),
                // Text(getFromNick(data),maxLines:2,style:ITextStyles.itemContent12),
              ],
            ),
            Gaps.vGap4,
          ],
        )
    );;
  }

  String getStatus(num status, num outStatus) {
    if (status == 0) {
      if (outStatus == 0) {
        return S.current.transfer_in_success;
      }else{
        return S.current.transfer_success;
      }
    }

    if (outStatus == 0) {
      return S.current.transfer_in_fail;
    }
    return S.current.transfer_fail;
  }

  Color getStatusColor(num status) {
    if (status == 0) {
      return Colours.item_green;
    }
    return Colours.item_red;
  }
  //	// 0 收款， 1 转出
  String getFromAddress(TransferRecordEntity data) {
    // 别人转给我
    String address = "";
    if (data.outStatus == 0) {
      address = S.current.transfer_record_out+": "+ data.fromUsername +" ("+data.fromNickname+")";
    }else {
      address = S.current.transfer_record_in +": "+ data.toUsername +" ("+data.toNickname+")";
    }
    return address;
  }


  Color getMoneyColor(num outStatus) {
    if (outStatus == 0) {
      return Colours.item_green;
    }
    return Colours.item_red;
  }

   getMoney(num outStatus,num transferNumber) {
    if (outStatus == 0) {
      return "+"+transferNumber.toString();
    }
    return "-"+transferNumber.toString();
  }
}

