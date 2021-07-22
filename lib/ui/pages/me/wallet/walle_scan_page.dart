import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:ipfsnets/data/global_entiy.dart';
import "package:ipfsnets/include.dart";
import 'package:ipfsnets/models/wallet_entiy.dart';
import 'package:ipfsnets/ui/pages/me/wallet/wallet_item.dart';

class WalletScanPage extends StatelessWidget {
  List<WalletEntiy> list = List.from(GlobalEntiy.walletList);

  EasyRefreshController _refreshController = EasyRefreshController();
  int page = 1;
  bool isFailure = false;
  Future _onRefresh() async {
    page = 1;
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    // _refreshController.resetLoadState();
    _refreshController.finishRefresh();
  }

  Future _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    // _refreshController.resetRefreshState();
    _refreshController.finishLoad();
  }

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
                  padding: EdgeInsets.all(20.w),
                  decoration: ITextStyles.boxDecoration,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.current.wallet_total, style: ITextStyles.itemContent),
                      Gaps.vGap8,
                      bulidTopMoney(),
                      Gaps.vGap4,
                      Text("= 1111111 USDT", style: ITextStyles.itemTitle),
                    ],
                  ),
                ),
                Container(
                    width: double.infinity,
                    margin: ITextStyles.containerMargin,
                    padding: EdgeInsets.fromLTRB(0, 20.w, 0, 20.w),
                    decoration: ITextStyles.boxDecoration,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        bulidItem(R.assetsImgMeItem8, S.current.wallet_item_1, 0),
                        Gaps.hGap10,
                        bulidItem(R.assetsImgMeItem8, S.current.wallet_item_2, 1),
                        Gaps.hGap10,
                        bulidItem(R.assetsImgMeItem8, S.current.wallet_item_3, 2),
                        Gaps.hGap10,
                        bulidItem(R.assetsImgMeItem8, S.current.wallet_item_4, 3),
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
  Text bulidTopMoney() {
    return Text.rich(TextSpan(
      children: [
        TextSpan(
            text: "12345",
            style: TextStyle(color: Colours.item_red, fontSize: 32)),
        TextSpan(text: " ", style: ITextStyles.itemContent),
        TextSpan(text: "CNY", style: ITextStyles.itemTitle),
      ],
    ));
  }

  // 创建 item
  Column bulidItem(String image, String title, int index) {
    return Column(
      children: [
        GestureDetector(
          child:  Image.asset(image,width: 60.w,height: 60.w,),
          onTap: (){
            onItemClick(index);
          },
        ),
        Gaps.vGap4,
        Text(title,style: ITextStyles.itemTitle,),
      ],
    );
  }

  void onItemClick(int index) {
    if (index == 0) {

    }else if (index == 1) {

    }else if (index == 2) {

    }else if (index == 3) {

    }
  }

  // 创建充值和提现记录
  Expanded bulidRecordList() {
    return    Expanded(
      child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20.w, 0.w, 20.w, 30.w),
          decoration:ITextStyles.boxDecoration,
          child:EasyRefresh.custom(
              enableControlFinishRefresh: false,
              enableControlFinishLoad: false,
              controller: _refreshController,
              header:  null,
              footer: ClassicalFooter(),
              onRefresh: null,
              onLoad: null,
              slivers: [
                SliverList(delegate: SliverChildBuilderDelegate((context, index) {
                  return Text("11");
                },childCount: list.length
                ))
              ])),
    );
  }
}
