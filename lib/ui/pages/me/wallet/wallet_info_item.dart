import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/wallet_info_list_entity.dart';
import 'package:ipfsnets/utils/string_util.dart';
/**
 *  wall 提现记录
 */
class WalletInfoItem extends StatelessWidget {
  final WalletInfoListEntity data;
  WalletInfoItem(this.data);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.fromLTRB(20.w, 0.w, 20.w, 0.w),
        padding: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 10.w),
        decoration: ITextStyles.boxDecoration,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(R.assetsImgMyWalletFil,width: 30.w,height: 30.w,),
                Gaps.hGap8,
                Text(data.flowType.toString(),style: ITextStyles.itemTitle),
                Expanded(child:SizedBox()),
                Text(data.value.toString(),style: ITextStyles.itemTitle),
              ],
            ),
            Gaps.vGap8,
            Row(
              children: [
                Gaps.hGap20,
                Text(DateUtil.getTime(data.createTime),style: ITextStyles.itemContent),
              ],
            ),
            Gaps.vGap4,
            Gaps.line
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

  Color getStatusColor(String status) {
    if (status == 0) {
      return Colours.item_green;
    }else if (status == 1) {
      return Colours.item_red;
    }
    return Colours.item_content_color;
  }


}

