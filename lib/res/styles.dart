import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/utils/limit_formatter.dart';
import 'colors.dart';
import 'dimens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ITextStyles {

  static const TextStyle textSize12 = TextStyle(
    fontSize: Dimens.font_sp12,
      fontWeight: FontWeight.normal
  );
  static const TextStyle textSize16 = TextStyle(
    fontSize: Dimens.font_sp16,
      fontWeight: FontWeight.normal
  );
  static const TextStyle textBold14 = TextStyle(
      fontSize: Dimens.font_sp14,
      fontWeight: FontWeight.normal
  );
  static const TextStyle textBold16 = TextStyle(
      fontSize: Dimens.font_sp16,
      fontWeight: FontWeight.normal
  );
  static const TextStyle textBold18 = TextStyle(
      fontSize: Dimens.font_sp18,
      fontWeight: FontWeight.normal
  );
  static const TextStyle textBold24 = TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.normal
  );
  static const TextStyle textBold26 = TextStyle(
      fontSize: Dimens.font_sp26,
      fontWeight: FontWeight.normal
  );

  static const TextStyle textGray14 = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.text_gray,
  );
  static const TextStyle textDarkGray14 = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.dark_text_gray,
  );

  static const TextStyle textWhite14 = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colors.white,
  );

  static TextStyle loginTitle = TextStyle(
      fontSize: Dimens.font_sp26,
      fontWeight: FontWeight.normal,
      color: Colours.gray_33
  );

  // 顶部的标题
  static TextStyle whiteTitle = TextStyle(
    fontSize: Dimens.font_sp16,
    fontWeight: FontWeight.normal,
    color: Colours.text_white
  );



  static TextStyle mainTitle = TextStyle(
    fontSize: Dimens.font_sp18,
    fontWeight: FontWeight.normal,
  );

  // listitem 标题
  static TextStyle itemTitle16 = TextStyle(
    fontSize: Dimens.font_sp16,
    color: Colours.item_title_color,
    fontWeight: FontWeight.normal,
  );

  // listitem 标题
  static TextStyle itemTitle = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.item_title_color,
    fontWeight: FontWeight.normal,
  );

  // listitem 标题
  static TextStyle itemTitle12 = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.item_title_color,
    fontWeight: FontWeight.normal,
  );

  // listitem 内容
  static TextStyle itemContent = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.item_content_color,
    fontWeight: FontWeight.normal,
  );

  // listitem 内容
  static TextStyle itemContent12 = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.item_content_color,
    fontWeight: FontWeight.normal,
  );
  static TextStyle listExtra = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.text_gray,
  );
  // 所有页面的圆角
  static BoxDecoration boxDecoration = new BoxDecoration(
    color: Colours.text_white,
    borderRadius: new BorderRadius.circular((10.w))
  );
  // 所以页面的间距
  static EdgeInsets containerMargin = EdgeInsets.all(20.w);
}


class IButtonStyle {

  static ButtonStyle statusButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                //获取焦点时的颜色
                return Colours.button_unsel;
              }
              //默认状态使用灰色
              return Colours.button_sel;
        },
      ),
      minimumSize: MaterialStateProperty.all(Size(200, 70.h)),
  );

  static ButtonStyle updateButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colours.button_sel),
    minimumSize: MaterialStateProperty.all(Size(200, 60.h),),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.h))),
    overlayColor:  MaterialStateProperty.all( Colours.button_sel),
  );


  static ButtonStyle chainButtonSel = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
        //默认状态使用灰色
        return Colours.chain_bg;
      },
    ),
    shape: MaterialStateProperty.all(StadiumBorder(side: BorderSide(color:Colours.transparent,style: BorderStyle.solid))),
  );

  static ButtonStyle chainButtonUnsel = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith(
          (states) {return Colours.transparent;
      },
    ),
    shape: MaterialStateProperty.all(StadiumBorder(side: BorderSide(color:Colours.transparent,style: BorderStyle.solid))),
  );
}

class Decorations {
  static Decoration bottom = BoxDecoration(
      border: Border(bottom: BorderSide(width: 0.33, color: Colours.divider)));
}
/// 间隔
class Gaps {
  /// 水平间隔
  static const Widget hGap4 = SizedBox(width: Dimens.gap_dp4);
  static const Widget hGap5 = SizedBox(width: Dimens.gap_dp5);
  static const Widget hGap8 = SizedBox(width: Dimens.gap_dp8);
  static const Widget hGap10 = SizedBox(width: Dimens.gap_dp10);
  static const Widget hGap12 = SizedBox(width: Dimens.gap_dp12);
  static const Widget hGap15 = SizedBox(width: Dimens.gap_dp15);
  static const Widget hGap16 = SizedBox(width: Dimens.gap_dp16);
  static const Widget hGap20 = SizedBox(width: Dimens.gap_dp20);
  static const Widget hGap32 = SizedBox(width: Dimens.gap_dp32);

  /// 垂直间隔
  static const Widget vGap4 = SizedBox(height: Dimens.gap_dp4);
  static const Widget vGap5 = SizedBox(height: Dimens.gap_dp5);
  static const Widget vGap8 = SizedBox(height: Dimens.gap_dp8);
  static const Widget vGap10 = SizedBox(height: Dimens.gap_dp10);
  static const Widget vGap12 = SizedBox(height: Dimens.gap_dp12);
  static const Widget vGap15 = SizedBox(height: Dimens.gap_dp15);
  static const Widget vGap16 = SizedBox(height: Dimens.gap_dp16);
  static const Widget vGap24 = SizedBox(height: Dimens.gap_dp24);
  static const Widget vGap32 = SizedBox(height: Dimens.gap_dp32);
  static const Widget vGap50 = SizedBox(height: Dimens.gap_dp50);

//  static Widget line = const SizedBox(
//    height: 0.6,
//    width: double.infinity,
//    child: const DecoratedBox(decoration: BoxDecoration(color: Colours.line)),
//  );

  static const Widget line = Divider(height:1,indent:0.0,color: Colours.line);


  static const Widget vLine = SizedBox(
    width: 0.6,
    height: 24.0,
    child: VerticalDivider(),
  );

  static const Widget empty = SizedBox.shrink();

/// 补充一种空Widget实现 https://github.com/letsar/nil
/// https://github.com/flutter/flutter/issues/78159
///
}

class IImages {
  static Widget arrowRight = Image.asset(R.assetsImgIcArrowRight, height: 30.w, width: 30.w);
}

class IInpitFormatters{
  static List<TextInputFormatter> inputMoney = [
    LengthLimitingTextInputFormatter(GlobalEntiy.MONEY_MAX_INPUT),
    FilteringTextInputFormatter.allow(RegExp(r'^\d+(\.)?[0-9]{0,2}')),//数字包括小数
    LimitFormatter(2),
  ];

}


class Refresh{
  static ClassicalHeader head = ClassicalHeader(
    refreshText: S.current.pullToRefresh,
    refreshReadyText: S.current.releaseToRefresh,
    refreshingText: S.current.refreshing,
    refreshedText: S.current.refreshed,
    refreshFailedText: S.current.refreshFailed,
    noMoreText: S.current.noMore,
    infoText: S.current.updateAt,
  );

  static ClassicalFooter loadMore = ClassicalFooter(
    loadText: S.current.pushToLoad,
    loadReadyText: S.current.releaseToLoad,
    loadingText: S.current.loading,
    loadedText: S.current.loaded,
    loadFailedText: S.current.loadFailed,
    noMoreText: S.current.noMore,
    infoText: S.current.updateAt,
  );

}





