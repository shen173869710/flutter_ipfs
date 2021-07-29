import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/wallet_withdrawal_record_entity.dart';
import 'package:ipfsnets/utils/string_util.dart';
/**
 *  wall 提现记录
 */
class WalletWithdrawalRecordItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 10.w),
        padding: ITextStyles.containerMargin,
        decoration: ITextStyles.boxDecoration,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("11111", style: ITextStyles.itemTitle,),
            Text("11111", style: TextStyle(fontSize: 14, color: Colours.item_red),),
            Text("11111", style: ITextStyles.itemContent,),
          ],
        )
    );
  }

  String getStatus(num status, String from) {
    if (StringUtil.isNotEmpty(from)) {
      if (status == 0) {
        return S.current.wallet_recharge_item_suc;
      }else if (status == 1) {
        return S.current.wallet_recharge_item_fail;
      }else if (status == 2) {
        return S.current.wallet_recharge_item_ing;
      }
      return S.current.wallet_recharge_item_sure;
    }else{
      if (status == 0) {
        return S.current.wallet_withdraw_item_suc;
      }else if (status == 1) {
        return S.current.wallet_withdraw_item_fail;
      }else if (status == 2) {
        return S.current.wallet_withdraw_item_ing;
      }
      return S.current.wallet_withdraw_item_sure;
    }
  }

}

