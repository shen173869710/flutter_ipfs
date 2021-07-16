import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipfsnets/generated/l10n.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/res/styles.dart';


class LanguagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LanguagePageState();
  }
}


class _LanguagePageState extends State<LanguagePage> {
  bool chinSel = true;
  bool enSel  = false;
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        backgroundColor: Colours.bg_color,
        appBar: AppBar(
          title: new Text(S.current.language_title),
          centerTitle: true,
          backgroundColor: Colours.button_sel,
        ),
        body: Column(
          children: [
            buildLanguage(context,S.current.language_ch, 1),
            Gaps.line,
            buildLanguage(context,S.current.language_en, 2),
          ],
        ));
  }


  Container buildLanguage(BuildContext context, String hint,int index) {
    return Container(
      width: double.infinity,
      color: Colours.text_white,
      padding: EdgeInsets.fromLTRB(30.h, 10.h, 30.h, 10.h),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(hint, style: ITextStyles.textBold16,textAlign: TextAlign.left),
            Expanded(child: SizedBox()),
            Checkbox(
                activeColor: Colours.button_sel,
                value: index == 1?chinSel:enSel,
                onChanged: (value) {
                  if (index == 1) {
                    chinSel = true;
                    enSel = false;
                    setState(() {
                      S.load(Locale('zh'));
                      SpUtil.putString(GlobalEntiy.LANGUAGE_KEY,GlobalEntiy.LANGUAGE_ZH);
                      print(" 保存 "+SpUtil.getString(GlobalEntiy.LANGUAGE_KEY).toString());
                    });
                  }else if (index == 2) {
                    chinSel = false;
                    enSel = true;
                    setState(() {
                      S.load(Locale('en'));
                      SpUtil.putString(GlobalEntiy.LANGUAGE_KEY,GlobalEntiy.LANGUAGE_EN);
                      print(" 保存 "+SpUtil.getString(GlobalEntiy.LANGUAGE_KEY).toString());
                    });
                  }

                },
                shape: CircleBorder()),
          ]
      ),
    );
  }


}
