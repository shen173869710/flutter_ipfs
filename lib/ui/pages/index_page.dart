
import 'package:flutter/material.dart';
import 'package:ipfsnets/generated/l10n.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/res/dimens.dart';
import 'package:ipfsnets/ui/pages/home/home_page.dart';
import 'package:ipfsnets/ui/pages/market/market_page.dart';
import 'package:ipfsnets/ui/pages/me/me_page.dart';
import 'package:ipfsnets/ui/pages/quote/quote_page.dart';
import 'package:ipfsnets/ui/pages/register/index_controller.dart';

import '../../include.dart';
import '../../r.dart';
import 'find/find_page.dart';



class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IndexPageState();
  }
}

final List<BottomNavigationBarItem> bottomBar = <BottomNavigationBarItem>[
  BottomNavigationBarItem(backgroundColor:Colors.white,
      icon: Image.asset(R.assetsImgTabHomeN,width: Dimens.font_sp20,height: Dimens.font_sp20),
      activeIcon: Image.asset(R.assetsImgTabHomeP,width: Dimens.font_sp20,height: Dimens.font_sp20),
      label: S.current.tab_home,
      ),

  BottomNavigationBarItem(backgroundColor:Colors.white,
      icon: Image.asset(R.assetsImgTabMarketN,width: Dimens.font_sp20,height: Dimens.font_sp20),
      activeIcon: Image.asset(R.assetsImgTabMarketP,width: Dimens.font_sp20,height: Dimens.font_sp20),
      label: S.current.tab_market),
  BottomNavigationBarItem(backgroundColor:Colors.white,
      icon: Image.asset(R.assetsImgTabFindN,width: Dimens.font_sp20,height: Dimens.font_sp20),
      activeIcon: Image.asset(R.assetsImgTabFindP,width: Dimens.font_sp20,height: Dimens.font_sp20),
      label: S.current.tab_find),
  BottomNavigationBarItem(backgroundColor:Colors.white,
      icon: Image.asset(R.assetsImgTabQuotesN,width: Dimens.font_sp20,height: Dimens.font_sp20),
      activeIcon: Image.asset(R.assetsImgTabQuotesP,width: Dimens.font_sp20,height: Dimens.font_sp20),
      label: S.current.tab_quotes),
  BottomNavigationBarItem(backgroundColor:Colors.white,
      icon: Image.asset(R.assetsImgTabMeN,width: Dimens.font_sp20,height: Dimens.font_sp20),
      activeIcon: Image.asset(R.assetsImgTabMeP,width: Dimens.font_sp20,height: Dimens.font_sp20),
      label: S.current.tab_me)

];


final List<Widget> pages = <Widget>[
  HomePage(),
  MarketPage(),
  FindPage(),
  QuotePage(),
  MePage()
];

class _IndexPageState extends State<IndexPage> {
  final IndexController controller = Get.put(IndexController());


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<IndexController>(builder: (controller){
      return  Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: bottomBar,
            currentIndex: controller.currentIndex,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colours.tab_nusel,//主要用于设置item及字体颜色
            selectedItemColor: Colours.tab_sel,//主要用于设置item及字体颜色
            selectedFontSize: 12,
            unselectedFontSize: 12,
            onTap: (index){
              controller.changePage(index);
            },
          ),
          body: IndexedStack(
            index: controller.currentIndex,
            children: pages,
          )
      );
    });


  }



}