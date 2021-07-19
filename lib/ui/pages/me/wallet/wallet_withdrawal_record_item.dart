import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/wallet_withdrawal_record_entity.dart';
/**
 *  wall 提现记录
 */
class WalletWithdrawalRecordItem extends StatelessWidget {
  final WalletWithdrawalRecordEntity data;
  WalletWithdrawalRecordItem(this.data);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 20.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(R.assetsImgMyWalletFil,width: 30.w,height: 30.w,),
                Gaps.hGap8,
                Text(data.coinName,style: ITextStyles.itemTitle),
                Expanded(child:SizedBox()),
                Text(data.txValue.toString(),style: ITextStyles.itemTitle),
              ],
            ),
            Gaps.vGap8,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(DateUtil.getTime(data.createTime),style: ITextStyles.itemContent),
                Expanded(child:SizedBox()),
                Text(getStatus(data.transactionStatus),style: ITextStyles.itemContent),
              ],
            ),
            Gaps.vGap8,
            Text(data.fromAddress,maxLines:2,style:ITextStyles.itemContent),
          ],
        )
    );
  }

  String getStatus(num status) {
    if (status == 1) {
      return S.current.cny_withdrawal_record_suc;
    }else if (status == 2) {
      return S.current.cny_withdrawal_record_fail;
    }
    return S.current.cny_withdrawal_record_ing;
  }

  Color getStatusColor(String status) {
    if (status == 1) {
      return Colours.item_green;
    }else if (status == 2) {
      return Colours.item_red;
    }
    return Colours.item_content_color;
  }

}

