import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:ipfsnets/models/main_tab_entiy.dart';
import 'package:ipfsnets/res/colors.dart';

import '../../../../include.dart';

class MachineInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MachineInfoStatus();
  }
}

class _MachineInfoStatus extends State<MachineInfoPage> {
  @override
  void initState() {
    // TODO: implement initState
    getData();

    super.initState();
  }

  Future<void> getData() async {
    // BaseEntity baseEntity = await MarketApi.getMachineHome();
    // if (baseEntity.isOk()) {
    //   List<MarketBarEntity> barEntity = baseEntity.data;
    //   if (barEntity != null && barEntity.length > 0) {
    //     int length = barEntity.length;
    //     List<MainTabEntiy> temp = [];
    //     for (int i = 0; i < length; i++) {
    //       MainTabEntiy entiy = new MainTabEntiy(barEntity[i].name, MarketListPage(barEntity[i].typeId));
    //       temp.add(entiy);
    //     }
    //     entiys = temp;
    //     tabController  = TabController(length: entiys.length, vsync: this);
    //     setState(() {
    //     });
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.bg_color,
      appBar: AppBar(
        title: new Text(S.current.machine_info_title),
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
                  margin: EdgeInsets.fromLTRB(20.w, 0.w, 20.w, 30.w),
                  padding:EdgeInsets.fromLTRB(20.w, 30.w, 20.w, 30.w),
                  decoration: ITextStyles.boxDecoration,
                  child: Column(
                    children: [
                      bulidItem(S.current.machine_info_1,"1111"),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_2,"1111"),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_3,"1111"),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_4,"1111"),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_5,"1111"),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_6,"1111"),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_7,"1111"),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_8,"1111"),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_9,"1111"),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_10,"1111"),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_11,"1111"),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_12,"1111"),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_13,"1111"),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_14,"1111"),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.fromLTRB(20.w, 30.w, 20.w, 30.w),
                  padding:EdgeInsets.fromLTRB(20.w, 30.w, 20.w, 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 200.w,
                        height: 80.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colours.button_sel,
                          borderRadius: new BorderRadius.circular((40.w)),
                        ),
                        child:GestureDetector(child:Text(S.current.machine_info_btn_1,style: ITextStyles.whiteTitle,),onTap: (){
                          NavigatorUtil.jump(context, Routes.machineHostingPage);
                        },),
                      ),
                      Container(
                        width: 200.w,
                        height: 80.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colours.button_sel,
                          borderRadius: new BorderRadius.circular((40.w)),
                        ),
                        child:GestureDetector(child:Text(S.current.machine_info_btn_2,style: ITextStyles.whiteTitle,),onTap: (){
                          NavigatorUtil.jump(context, Routes.machineUpdatePage);
                        },),
                      ),
                      Container(
                        width: 200.w,
                        height: 80.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colours.button_sel,
                          borderRadius: new BorderRadius.circular((40.w)),
                        ),
                        child:GestureDetector(child:Text(S.current.machine_info_btn_3,style: ITextStyles.whiteTitle,),onTap: (){
                          NavigatorUtil.jump(context, Routes.machinePledgePage);
                        },),
                      ),
                    ],
                  )
                ),

              ],
            )

          ],
        ),
      ),
    );
  }

  bulidItem(String title, String desc){
    return Row(
      children: [
        Text(title, style: ITextStyles.itemContent,),
        Expanded(child: SizedBox()),
        Text(desc, style: ITextStyles.itemTitle,),
      ],
    );
  }
}
