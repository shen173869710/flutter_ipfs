import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/cny_record_entiy.dart';
import 'package:ipfsnets/models/rechage_record_model.dart';
import 'package:ipfsnets/models/wallet_entiy.dart';
import 'package:ipfsnets/ui/pages/me/baseListpage/base_list_item.dart';
/**
 *  CNY 充值提现记录
 */
class WalleRchargeRecordItem extends BaseListItem {
  WalleRchargeRecordItem(RechageRecordModel data) : super(data);

  @override
  Widget buildItem() {
    // TODO: implement buildItem
    return Container(
        padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(data.imgUrl,width: 50.w,height: 50.w,),
                Gaps.hGap8,
                Text(data.title,style: ITextStyles.itemTitle,),
                Expanded(child:SizedBox()),
                Column(
                  children: [
                    Text(data.title,style: TextStyle(
                        fontSize: 12,
                        color: Colours.item_title_color
                    ),),
                    Text(data.title,style: TextStyle(
                        fontSize: 12,
                        color: Colours.item_content_color
                    ),),
                  ],
                )
              ],
            ),
            Gaps.vGap12,
            Gaps.line
          ],
        )
    );
  }


}

