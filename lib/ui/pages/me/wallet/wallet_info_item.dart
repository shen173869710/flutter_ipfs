import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/wallet_info_list_entity.dart';
import 'package:ipfsnets/utils/num_util.dart';
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
                Image.asset(getStatusImage(data.value),width: 30.w,height: 30.w,),
                Gaps.hGap8,
                Text(getStatus(data.transactionType),style: ITextStyles.itemTitle),
                Expanded(child:SizedBox()),

                Text(NumUtil.prseeZero(data.value.toStringAsFixed(8)),style: TextStyle(fontSize: 14, color: getStatusColor(data.value))),
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

  getStatus(num status) {
    String message = "";
    switch (status) {
      case 1:
        message = S.current.wallet_type_1;
        break;
      case 2:
        message = S.current.wallet_type_2;
        break;
      case 3:
        message = S.current.wallet_type_3;
        break;
      case 4:
        message = S.current.wallet_type_4;
        break;
      case 5:
        message = S.current.wallet_type_5;
        break;
      case 6:
        message = S.current.wallet_type_6;
        break;
      case 7:
        message = S.current.wallet_type_7;
        break;
      case 8:
        message = S.current.wallet_type_8;
        break;
      case 9:
        message = S.current.wallet_type_9;
        break;
      case 10:
        message = S.current.wallet_type_10;
        break;
      case 11:
        message = S.current.wallet_type_11;
        break;
      case 12:
        message = S.current.wallet_type_12;
        break;
      case 13:
        message = S.current.wallet_type_13;
        break;
      case 14:
        message = S.current.wallet_type_14;
        break;
      case 15:
        message = S.current.wallet_type_15;
        break;
      case 16:
        message = S.current.wallet_type_16;
        break;
      case 17:
        message = S.current.wallet_type_17;
        break;
      case 18:
        message = S.current.wallet_type_18;
        break;
      case 19:
        message = S.current.wallet_type_19;
        break;
      case 20:
        message = S.current.wallet_type_20;
        break;
      case 21:
        message = S.current.wallet_type_21;
        break;
      case 22:
        message = S.current.wallet_type_22;
        break;
      case 23:
        message = S.current.wallet_type_23;
        break;
      case 24:
        message = S.current.wallet_type_24;
        break;
      case 25:
        message = S.current.wallet_type_25;
        break;
      case 26:
        message = S.current.wallet_type_26;
        break;
      case 27:
        message = S.current.wallet_type_27;
        break;
      case 31:
        message = S.current.wallet_type_31;
        break;
      case 32:
        message = S.current.wallet_type_32;
        break;
      case 33:
        message = S.current.wallet_type_33;
        break;
      case 34:
        message = S.current.wallet_type_34;
        break;
    }
    return message;
  }




  Color getStatusColor(num status) {
    if (status > 0) {
      return Colours.item_green;
    }else{
      return Colours.item_red;
    }
  }

   getStatusImage(num status) {
    if (status > 0) {
      return R.assetsImgTransferIn;
    }else{
      return R.assetsImgTransferOut;
    }
  }

}

