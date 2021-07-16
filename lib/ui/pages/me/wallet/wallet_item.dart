import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/cny_record_entiy.dart';
import 'package:ipfsnets/models/wallet_entiy.dart';
/**
 *  CNY 充值提现记录
 */
class WalletItem extends StatelessWidget {
  final WalletEntiy data;
  WalletItem(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(data.imgUrl,width: 50.w,height: 50.w,),
              Gaps.hGap8,
              Text(data.name,style: ITextStyles.itemTitle,),
              Expanded(child:SizedBox()),
              Column(
                children: [
                  Text(data.from,style: TextStyle(
                      fontSize: 12,
                      color: Colours.item_title_color
                  ),),
                  Text(data.to,style: TextStyle(
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

