import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/cny_record_entiy.dart';
import 'package:ipfsnets/models/wallet_entiy.dart';
import 'package:ipfsnets/models/wallet_home_entity.dart';
import 'package:ipfsnets/models/wallet_item_entiy.dart';
/**
 *  CNY 充值提现记录
 */
class WalletItem extends StatelessWidget {
  final WalletItemEntiy data;
  WalletItem(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 0),
      child: Column(
        children: [
          Gaps.vGap12,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ImageUtil.loadImage(data.coinIcon, 50.w, 50.w),
              Gaps.hGap12,
              Text(data.coinName,style: ITextStyles.itemTitle16,),
              Expanded(child:SizedBox(child: Text(""),)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(data.value.toString(),style: TextStyle(
                      fontSize: 14,
                      color: Colours.item_title_color
                  ),),
                  Gaps.vGap4,
                  Text("≈"+data.cny.toString(),style: TextStyle(
                      fontSize: 14,
                      color: Colours.item_content_color
                  ),),
                ],
              )
            ],
          ),
          Gaps.vGap24,
          Gaps.line
        ],
      )
    );
  }


}

