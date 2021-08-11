import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/models/machine_entity.dart';
import 'package:ipfsnets/res/colors.dart';

import '../../../../include.dart';

class MachineInfoPage extends StatelessWidget {
  late MachineEntity entity;

  @override
  Widget build(BuildContext context) {
    entity = ModalRoute.of(context)!.settings.arguments as MachineEntity;
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
                      bulidItem1(S.current.machine_info_1,entity.symbol.toString()),
                      Gaps.vGap12,
                      bulidItem2(S.current.machine_info_2,entity.online),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_3,DateUtil.getTimeY(entity.createTime)),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_4,entity.onlineTime == null?"--":DateUtil.getTime(entity.onlineTime)),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_5,entity.hostingExpTime == null?"--":DateUtil.getTime(entity.hostingExpTime)),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_6,entity.name),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_7,entity.nodeName),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_8,entity.useCap.toString()+" TB"),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_9,entity.buyCap.toString()+" TB"),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_10,entity.realCap.toString()+" TB"),
                      // Gaps.vGap12,
                      // bulidItem(S.current.machine_info_11,entity.name),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_12,entity.income.toString()+"FIL"),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_13,entity.alreadyPledge.toString()+"/"+entity.pledge.toString()+"FIL"),
                      Gaps.vGap12,
                      bulidItem(S.current.machine_info_14,entity.alreadyGas.toString()+"/"+entity.gas.toString()+"FIL"),
                    ],
                  ),
                ),
                buildBottom(context),
              ],
            )

          ],
        ),
      ),
    );
  }

  buildBottom(BuildContext context) {
    return    Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.fromLTRB(20.w, 30.w, 20.w, 30.w),
        padding:EdgeInsets.fromLTRB(20.w, 30.w, 20.w, 30.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 190.w,
              height: 75.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colours.button_sel,
                borderRadius: new BorderRadius.circular((40.w)),
              ),
              child:GestureDetector(child:Text(S.current.machine_info_btn_1,style: ITextStyles.whiteTitle16,),onTap: (){
                NavigatorUtil.push(context, '${Routes.machineTotalPage}?machineId=${Uri.encodeComponent(entity.machineId.toString())}');
              },),
            ),
            Container(
              width: 190.w,
              height: 75.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colours.button_sel,
                borderRadius: new BorderRadius.circular((40.w)),
              ),
              child:GestureDetector(child:Text(S.current.machine_info_btn_2,style: ITextStyles.whiteTitle16,),onTap: (){
                NavigatorUtil.push(context, '${Routes.machineUpdatePage}?machineId=${Uri.encodeComponent(entity.machineId.toString())}');
              },),
            ),
            Container(
              width: 190.w,
              height: 75.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colours.button_sel,
                borderRadius: new BorderRadius.circular((40.w)),
              ),
              child:GestureDetector(child:Text(S.current.machine_info_btn_3,style: ITextStyles.whiteTitle16,),onTap: (){
                NavigatorUtil.push(context, '${Routes.machinePledgePage}?machineId=${Uri.encodeComponent(entity.machineId.toString())}');
              },),
            ),
          ],
        )
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

  bulidItem1(String title, String desc){
    return Row(
      children: [
        Text(title, style: ITextStyles.itemContent,),
        Expanded(child: SizedBox()),
        Text(desc, style: ITextStyles.itemContentSel,),
      ],
    );
  }

  bulidItem2(String title, String desc){
    return Row(
      children: [
        Text(title, style: ITextStyles.itemContent,),
        Expanded(child: SizedBox()),

        Text.rich(TextSpan(
          children: [
            WidgetSpan(child: Image.asset(desc == "1"?R.assetsImgIcMachineOffline:R.assetsImgIcMachineOnline, height: 35.w, width: 35.w,)),
            TextSpan(text: " "),
            TextSpan(text: desc == "1"?S.current.machine_list_offline:S.current.machine_list_online,
                style: desc == "1"?ITextStyles.itemContent:ITextStyles.itemContentSel,),

          ]
        )),
      ],
    );
  }
}
