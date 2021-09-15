import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:ipfsnets/http/wallet_api.dart';
import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/wallet_home_entity.dart';
import 'package:ipfsnets/models/wallet_item_entiy.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/ui/pages/me/wallet/wallet_item.dart';
import 'package:ipfsnets/utils/num_util.dart';

class WalletPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WalletPageState();
  }
}

class _WalletPageState extends State<WalletPage> {

  late num cnySum = 0;
  late List<WalletItemEntiy?> list =[];
  late num usdtSum = 0;

  @override
  void initState() {
    getAccountInfo();
  }

  getAccountInfo() async {
    BaseEntity baseEntity  = await WalletApi.getWalletHome(true);
    setState(() {
      if (baseEntity.isOk()) {
        WalletHomeEntity entity = baseEntity.data;
        cnySum = entity.cnySum;
        usdtSum = entity.usdtSum;
        if (entity.rows != null) {
          list.clear();
          list.addAll(entity.rows);
        }
      }
    });
  }


  EasyRefreshController _refreshController = EasyRefreshController();
  int page = 1;
  bool isFailure = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colours.bg_color,
      appBar: AppBar(
        title: new Text(S.current.wallet_title),
        centerTitle: true,
        backgroundColor: Colours.app_bar_bg,
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: [
            SizedBox(
                width: double.infinity,
                height: 70.h,
                child: Container(
                  color: Colours.app_bar_bg,
                )),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: ITextStyles.containerMargin,
                  padding: EdgeInsets.all(30.w),
                  decoration: ITextStyles.boxDecoration,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.current.wallet_total, style: ITextStyles.itemContent),
                      Gaps.vGap8,
                      bulidTopMoney(),
                      Gaps.vGap4,
                      bulidTopUsdt(),
                    ],
                  ),
                ),
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(20.w, 0.w, 20.w, 20.w),
                    padding: EdgeInsets.fromLTRB(0, 20.w, 0, 20.w),
                    decoration: ITextStyles.boxDecoration,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        bulidItem(context,R.assetsImgIcWalletItem1, S.current.wallet_item_1, Routes.qrcodeScannerPage),
                        Gaps.hGap10,
                        bulidItem(context,R.assetsImgIcWalletItem2, S.current.wallet_item_2, Routes.walletWithdrawalPage),
                        Gaps.hGap10,
                        bulidItem(context,R.assetsImgIcWalletItem3, S.current.wallet_item_3, Routes.walletRechagePage),
                        Gaps.hGap10,
                        bulidItem(context,R.assetsImgIcWalletItem4, S.current.wallet_item_4, Routes.walletExchangePage),
                      ],
                    )),
                bulidRecordList(),
              ],
            )
          ],
        ),
      ),
    );
  }
  // 创建顶部资产
  Text bulidTopUsdt() {
    return Text.rich(TextSpan(
      children: [
        TextSpan(
            text: "≈ ",
            style: ITextStyles.itemContent),
        TextSpan(text: NumUtil.prseeZero(usdtSum.toStringAsFixed(8)), style: ITextStyles.itemContent),
        TextSpan(text: "  USDT", style: ITextStyles.itemContent),
      ],
    ));
  }

  // 创建顶部资产
  Text bulidTopMoney() {
    return Text.rich(TextSpan(
      children: [
        TextSpan(
            text: NumUtil.prseeZero(cnySum.toStringAsFixed(8)),
            style: TextStyle(color: Colours.item_red, fontSize: 32)),
        TextSpan(text: " ", style: ITextStyles.itemContent),
        TextSpan(text: "CNY", style: ITextStyles.itemTitle),
      ],
    ));
  }

  // 创建 item
  Column bulidItem(BuildContext context,String image, String title, String rouser) {
    return Column(
      children: [
        GestureDetector(
          child:  Image.asset(image,width: 50.w,height: 50.w,fit: BoxFit.cover,),
          onTap: (){
            if(Routes.walletExchangePage == rouser) {
              ToastUtil.show(S.current.not_open);
            }else{
              NavigatorUtil.jump(context, rouser);
            }
          },
        ),
        Gaps.vGap4,
        Text(title,style: ITextStyles.itemTitle,),
      ],
    );
  }

  Future onRefresh() async {
    BaseEntity baseEntity  = await WalletApi.getWalletHome(true);
    _refreshController.finishRefresh(success: true);
    setState(() {
      if (baseEntity.isOk()) {
        WalletHomeEntity entity = baseEntity.data;
        cnySum = entity.cnySum;
        usdtSum = entity.usdtSum;
        if (entity.rows != null) {
          list.clear();
          list.addAll(entity.rows);
        }
      }
    });

    // _refreshController.finishRefresh(success: true);
  }
  // 创建充值和提现记录
  Expanded bulidRecordList() {
    return    Expanded(
      child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20.w, 0.w, 20.w, 30.w),
          decoration:ITextStyles.boxDecoration,
          child:EasyRefresh.custom(
              enableControlFinishRefresh: true,
              enableControlFinishLoad: false,
              controller: _refreshController,
              header:  Refresh.head,
              footer: null,
              onRefresh: onRefresh,
              onLoad: null,
              slivers: [
                SliverList(delegate: SliverChildBuilderDelegate((context, index) {
                  return GestureDetector(
                    onTap: (){
                      onItemClick(index);
                    },
                    child:WalletItem(list[index]!),
                  );


                },childCount: list.length
                ))
              ])),
    );
  }

  onItemClick(int index) {
    LogUtil.e(index.toString());
    NavigatorUtil.push(context,'${Routes.walletInfoPage}',arguments: list[index]);
  }



}
