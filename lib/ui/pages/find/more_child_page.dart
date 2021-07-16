import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/news_model.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/find/new_item.dart';
import 'package:ipfsnets/ui/widget/base_list_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class MoreChildPage extends StatelessWidget {

  int index = 1;
  MoreChildPage(this.index);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colours.bg_color,
      body:
        Column(
          children: [
            Visibility(visible:(index==0)?true:false,child:buildGridLayout(context,S.current.more_tab_1, getList(0),getImage(0),0)),
            Visibility(visible:(index==0 || index == 1)?true:false,child:buildGridLayout(context,S.current.more_tab_2, getList(1), getImage(1),5)),
            Visibility(visible:(index==0 || index == 2)?true:false,child:buildGridLayout(context,S.current.more_tab_3, getList(2), getImage(2),11)),
          ],
        ),
    );
  }


  Container buildGridLayout(BuildContext context,String title, List<String>name, List<String> image, int add) {
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

  }

  List<String> getList(int postion) {
    if (postion == 0) {
      return GlobalEntiy.MORE_TITLE_1;
    }else if (postion == 1) {
      return GlobalEntiy.MORE_TITLE_2;
    }else if (postion == 2) {
      return GlobalEntiy.MORE_TITLE_3;
    }else{
      return GlobalEntiy.MORE_TITLE_1;
    }
  }

  List<String> getImage(int postion) {
    if (postion == 0) {
      return GlobalEntiy.MORE_IMAGE_1;
    }else if (postion == 1) {
      return GlobalEntiy.MORE_IMAGE_2;
    }else if (postion == 2) {
      return GlobalEntiy.MORE_IMAGE_3;
    }else{
      return GlobalEntiy.MORE_IMAGE_1;
    }
  }
}
