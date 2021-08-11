import 'package:ipfsnets/getx/user_controller.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/utils/image_util.dart';

class MePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    return GetBuilder<UserController>(builder:(userController){
      return Scaffold(backgroundColor: Colours.bg_color,body: SingleChildScrollView(
          reverse: false,
          padding: EdgeInsets.all(0.0),
           physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            buildToplayout(context,userController),
            buildAccountLayout(userController),
            buildGridLayout(context,S.current.me_order, GlobalEntiy.ORDER_TITLE, GlobalEntiy.ORDER_IMAGE,0),
            buildGridLayout(context,S.current.me_life, GlobalEntiy.LIFE_TITLE, GlobalEntiy.LIFE_IMAGE,GlobalEntiy.ORDER_TITLE.length),
            buildGridLayout(context,S.current.me_server, GlobalEntiy.SERVER_TITLE, GlobalEntiy.SERVER_IMAGE,GlobalEntiy.LIFE_TITLE.length+GlobalEntiy.ORDER_TITLE.length)
          ],
        )
      )

      );
    });
  }

  //顶部布局
  Container buildToplayout(BuildContext context,UserController userController) {
    return Container(
        padding: EdgeInsets.fromLTRB(30.w, 40.h, 30.w, 40.h),
        width: double.infinity,
        color: Colours.app_bar_bg,
        child: SafeArea(
          child: Row(
            children: [
              buildUserHead(userController),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    userController.user.nickname!,
                    maxLines: 1,
                    style: TextStyle(fontSize: Dimens.font_sp20, color: Colours.text_white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        R.assetsImgIcVip,
                        width: 20.h,
                        height: 20.h,
                        alignment: Alignment.centerLeft,
                      ),
                      Text(
                        userController.user.username!,
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
              Expanded(child: SizedBox(),flex: 1,),
              GestureDetector(
                child: Image.asset(
                  R.assetsImgIcWriteMore,
                  width: 50.h,
                  height: 50.h,
                ),
                onTap: () {
                  // userController.changeAccount(true);
                  NavigatorUtil.jump(context, Routes.userManager);
                },
              )
            ],
          ),
        ));
  }

  // 创建头像
  ClipOval buildUserHead(UserController userController) {
    return ClipOval(clipper: _MyClipper(),child: ImageUtil.getHeadFormNet(userController.user.avatar!));
  }

  // 创建账户布局
  Container buildAccountLayout(UserController userController) {
    return Container(
      width: double.infinity,
      margin: ITextStyles.containerMargin,
      padding: EdgeInsets.all(20.w),
      decoration: ITextStyles.boxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.current.me_money,
            style: TextStyle(
                color: Colours.item_content_color, fontSize: Dimens.font_sp20),
          ),
          Gaps.vGap4,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "2.123456",
                style: TextStyle(
                    color: Colours.item_red, fontSize: Dimens.font_sp26),
              ),
              Gaps.hGap4,
              Text(
                " == 4000.111",
                style: TextStyle(
                    color: Colours.item_title_color,
                    fontSize: Dimens.font_sp20),
              ),
            ],
          ),
          Visibility(
            visible: !userController.showAccount,
            child: Container(
              width: double.infinity,
              height: 30.h,
              child:  GestureDetector(
                child: Image.asset(
                  R.assetsImgIcDown,
                  width: 30.h,
                  height: 30.h,
                ),
                onTap: () {
                  userController.changeAccount(true);
                },
              ),
            ),
          ),
          buildUserAccount(userController),
        ],
      ),
    );
  }

  Visibility buildUserAccount(UserController userController) {
    return Visibility(
        visible: userController.showAccount,
        child: Column(
          children: [
            Gaps.vGap8,
            Gaps.line,
            Gaps.vGap12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child:buildAccountItem("NETS","33333")),
                Expanded(child:buildAccountItem("FIL","011111111111111")),
              ],
            ),
            Gaps.vGap12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child:buildAccountItem("USDT","33333")),
                Expanded(child:buildAccountItem("BTC","011111111111111")),
              ],
            ),
            Gaps.vGap12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child:buildAccountItem("ETH","33333")),
                Expanded(child:buildAccountItem("EOS","011111111111111")),
              ],
            ),
            Gaps.vGap12,
            Container(
              width: double.infinity,
              height: 30.h,
              child:GestureDetector (child: Image.asset(R.assetsImgIcUp, width: 30.h, height: 30.h),
              onTap: (){
                userController.changeAccount(false);
              }),

            ),

          ],
        ));
  }
  // 创建账户imte
  Column buildAccountItem(String text, String value) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,textAlign: TextAlign.left,
          style: ITextStyles.itemContent,
        ),
        Gaps.hGap4,
        Text(value,
          style: TextStyle(
              color: Colours.item_title_color,
              fontSize: Dimens.font_sp18),
        ),
      ],
    );
  }
  // 创建财富生活
  Container buildGridLayout(BuildContext context,String title, List<String>name, List<String> image,int add) {
    return Container(
      width: double.infinity,
      margin: ITextStyles.containerMargin,
      decoration: ITextStyles.boxDecoration,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.fromLTRB(30.w, 15.h, 0, 0),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(child: Text(title, style: ITextStyles.textBold16,textAlign: TextAlign.left)),
                ],
              )
            ),
            MeGridItem(
              data: name,
              image:image,
              onItemClick: (index) {
                onItemClickListen(context, index+add);
              },
            ),
          ]
      ),
    );
  }
  // 点击事件
  void onItemClickListen(BuildContext context, int index) {
    LogUtil.e("index = "+index.toString());
    switch (index) {
      case 0:
      // 全部
        break;
      case 1:
      //待发货
        break;
      case 2:
      //已发货
        break;
      case 3:
      //已完成
        break;
      case 4:
      //钱包
        NavigatorUtil.jump(context, Routes.walletPage);
        break;
      case 5:
      //付款
        NavigatorUtil.jump(context, Routes.walletWithdrawalPage);
        break;
      case 6:
        NavigatorUtil.jump(context, Routes.walletRechagePage);
      //收款
        break;
      case 7:
        NavigatorUtil.jump(context, Routes.qrcodeScannerPage);
      //扫一扫
        break;
      case 8:
      //服务器
        NavigatorUtil.jump(context, Routes.machinePage);
        break;
      case 9:
      //CNY账号
        NavigatorUtil.jump(context, Routes.cnyAccount);
        break;
      case 10:
      //转账
        NavigatorUtil.jump(context, Routes.transferPage);
        break;
      case 11:
      //我的粉丝
        NavigatorUtil.jump(context, Routes.fansPage);
        break;
      case 12:
      //推广二维码
        break;
      case 13:
      //我的客服
        NavigatorUtil.goWebViewPage(context, S.current.me_item_17, GlobalEntiy.web_my_server);
        break;
      case 14:
      //设置
        NavigatorUtil.jump(context, Routes.settingPage);
        break;
      case 15:
      //更多应用
        NavigatorUtil.jump(context, Routes.morePage);
        break;
      case 16:

        break;
      case 17:

        break;
      case 18:

        break;
    }
  }
}
class _MyClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    return new Rect.fromLTRB(0, 0, 70.h,70.h);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}