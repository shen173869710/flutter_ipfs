import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/wallet_withdrawal_record_entity.dart';
import 'package:ipfsnets/utils/string_util.dart';
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
        margin: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 10.w),
        padding: ITextStyles.containerMargin,
        decoration: ITextStyles.boxDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                Text(getStatus(data.transactionStatus,data.fromAddress),style: ITextStyles.itemContent),
              ],
            ),
            Gaps.vGap8,
            Text(getFromAddress(),maxLines:2,style:ITextStyles.itemContent),
          ],
        )
    );
  }

  /**
   *   AGREE(0, "成功"),
       FAIL(1, "失败"),
       CONFIRM(2, "确认中"),
       WAIT_AUDIT(3, "待审核"),
       REJECTED(4, "已拒绝")
   */
  String getStatus(num status, String from) {
    if (StringUtil.isNotEmpty(from)) {
      if (status == 0) {
        return S.current.wallet_recharge_item_suc;
      }else {
        return S.current.wallet_recharge_item_fail;
      }

    }else{
      if (status == 0) {
        return S.current.wallet_withdraw_item_suc;
      }else if (status == 1) {
        return S.current.wallet_withdraw_item_fail;
      }else if (status == 2) {
        return S.current.wallet_withdraw_item_ing;
      }else if (status == 3) {
        return S.current.wallet_withdraw_item_wait;
      }else if (status == 4) {
        return S.current.wallet_withdraw_item_ref;
      }else {
        return S.current.wallet_withdraw_item_fail;
      }
    }
  }

  Color getStatusColor(String status) {
    if (status == 0) {
      return Colours.item_green;
    }else if (status == 1) {
      return Colours.item_red;
    }
    return Colours.item_content_color;
  }

  String getFromAddress() {
    if (StringUtil.isEmpty(data.fromAddress) && StringUtil.isEmpty(data.toAddress)) {
      return "";
    }
    if (StringUtil.isEmpty(data.fromAddress)) {
      return S.current.wallet_withdraw_address+data.toAddress;
    }
    return S.current.wallet_recharge_address+data.fromAddress;
  }

}

