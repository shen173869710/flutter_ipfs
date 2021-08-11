
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:ipfsnets/http/machine_api.dart';
import 'package:ipfsnets/models/machine_entity.dart';
import 'package:ipfsnets/models/machine_top_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/register/index_controller.dart';
import 'package:ipfsnets/utils/LoadingUtils.dart';

import '../../../../include.dart';


class MachinePage extends StatefulWidget{



  @override
  State<StatefulWidget> createState() {
    return _MachineStatus();
  }
}

class _MachineStatus extends State<MachinePage> {
  late MachineTopEntity entity;
  late List<MachineEntity> list = [];

  final IndexController controller = Get.put(IndexController());

  EasyRefreshController _refreshController = EasyRefreshController();
  @override
  void initState() {
    // TODO: implement initState
    list = [];
    entity = MachineTopEntity();
    entity.init();
    getData();
    super.initState();
  }
  @override
  bool get wantKeepAlive => true;


  Future<void> getData() async {
    LoadingUtils.show();
    BaseEntity baseEntity = await MachineApi.getMachineStatistics();
    if (baseEntity.isOk() && baseEntity.data != null) {
      entity = baseEntity.data;
    }
    BaseEntity info = await MachineApi.getMachineList();
    if (info.isOk()&& info.data != null) {
      list = info.data;
    }
    setState(() {

    });
    LoadingUtils.dismiss();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.white,
      body: SingleChildScrollView(
        reverse: false,
        padding: EdgeInsets.all(0.0),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width:double.infinity,
              child: Stack(
              children: [
                Image.asset(R.assetsImgIcMachineBg,height:470.h,width:double.infinity,fit: BoxFit.cover,),
                Container(
                  padding: EdgeInsets.only(left: 20.w, top: 80.w,right: 20.w),
                  alignment: Alignment.topRight,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        children: [
                          GestureDetector(child:Image.asset(R.assetsImgIcWhiteBack,height:50.w,width:50.w),onTap: (){
                            NavigatorUtil.goBack(context);
                          },),
                          Expanded(child: SizedBox()),
                        ],
                      ),
                      buildItem(S.current.machine_item_1,S.current.machine_item_2, entity.onlineNumber,entity.machineNumber,0),
                      Gaps.vGap10,
                      buildItemM(S.current.machine_item_3,S.current.machine_item_4, entity.allUseCap,entity.allRealCap,1),
                      Gaps.vGap12,
                      buildInfo(),
                      Gaps.vGap12,
                      buildButton(),
                      Gaps.vGap12,
                      Container(
                        width: double.infinity,
                        height: 5.w,
                        color: Colours.layout_bg,
                      ),
                      Gaps.vGap12,
                      buildRefreshView(context),
                      // ListView.builder
                      //   (
                      //   shrinkWrap: true,
                      //     itemCount: 25,
                      //     itemBuilder: (BuildContext ctxt, int index) {
                      //       return new Text(""+index.toString());
                      //     }
                      // )
                    ],
                  )
                ),

              ],
            ),)
          ],
        ),
      ),
    );
  }
  // 在线数量
  buildItem(String title, String dec,num number, num all,int index) {
    return Container(
      padding: EdgeInsets.all(30.w),
      width: 460.w,
      decoration: BoxDecoration(
          color: Color(0x9F828DF6),
          borderRadius: new BorderRadius.circular((10.w)),

      ),
      child: Row(
        children: [
          Container(
            width: 100.w,
            height: 100.w,
            child: _circularProgressIndicator(number,all),
          ),
          Gaps.hGap12,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: ITextStyles.textWhite14,),
              Gaps.vGap4,
              Text(dec,style: ITextStyles.textWhite14,),
            ],
          ),
          Expanded(child: SizedBox(),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(number.toString()+" "+S.current.machine_tai,style: ITextStyles.textWhite14,),
              Gaps.vGap4,
              Text(all.toString()+" "+S.current.machine_tai,style: ITextStyles.textWhite14,),
            ],
          ),
        ],
      ),
    );
  }

  buildItemM(String title, String dec,num number, num all,int index) {
    return Container(
      padding: EdgeInsets.all(30.w),
      width: 460.w,
      decoration: BoxDecoration(
        color: Color(0x9F828DF6),
        borderRadius: new BorderRadius.circular((10.w)),

      ),
      child: Row(
        children: [
          Container(
            width: 100.w,
            height: 100.w,
            child: _circularProgressIndicator(number,all),
          ),
          Gaps.hGap12,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: ITextStyles.textWhite14,),
              Gaps.vGap4,
              Text(dec,style: ITextStyles.textWhite14,),
            ],
          ),
          Expanded(child: SizedBox(),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(number.toString()+" TB",style: ITextStyles.textWhite14,),
              Gaps.vGap4,
              Text(all.toString()+" TB",style: ITextStyles.textWhite14,),
            ],
          ),
        ],
      ),
    );
  }

  CircularProgressIndicator _circularProgressIndicator(num postion, num all){
    if (postion == null) {
      postion = 0;
    }
    if (all == null) {
      all = 0;
    }
    return CircularProgressIndicator(
      value: all == 0?0:postion/all, // 当前进度
      strokeWidth: 10, // 最小宽度
      backgroundColor: Color(0xFFA9BAE1), // 进度条背景色
      valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow), // 进度条当前进度颜色
    );
  }
  // 今天产币
  buildInfo() {
    return Container(
      margin: EdgeInsets.all(20.w),
      padding: EdgeInsets.all(30.w),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular((10.w)),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 2.0),
                blurRadius: 0, //阴影模糊程度
                spreadRadius: 0
            )
          ]
      ),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.current.machine_item_5, style: ITextStyles.itemTitle,),
              Gaps.vGap4,
              Text(entity.todayYield.toString(), style: ITextStyles.itemTitle,),
            ],
          ),
          Gaps.vLine,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(S.current.machine_item_6, style: ITextStyles.itemTitle,),
              Gaps.vGap4,
              Text(entity.allYield.toString(), style: ITextStyles.itemTitle,),
            ],
          ),
        ],
      ),
    );
  }
  // 查看收益
  buildButton(){
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 250.w,
          decoration: BoxDecoration(
            color: Colours.button_sel,
            borderRadius: new BorderRadius.circular((10.w)),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.all(30.w),
        child: GestureDetector(child: Text(S.current.machine_item_7,style: ITextStyles.textWhite14,),onTap: (){
          NavigatorUtil.jump(context, Routes.machineTotalPage);
          },)
        ),
        Container(
          width: 250.w,
          alignment: Alignment.center,
          padding: EdgeInsets.all(30.w),
          decoration: BoxDecoration(
            color: Colours.button_sel,
            borderRadius: new BorderRadius.circular((10.w)),
          ),
          child: GestureDetector(child:Text(S.current.machine_item_8,style: ITextStyles.textWhite14,),onTap: (){
            NavigatorUtil.goBack(context);
            controller.changePage(1);
          },)
        ),
      ],
    );
  }


  /// 构建一个带刷新的列表视图
  Widget buildRefreshView(BuildContext context) {
    return EasyRefresh.custom(
        header: null,
        footer: null,
        controller: _refreshController,
        topBouncing: true,
        shrinkWrap: true,
        bottomBouncing: true,
        slivers: [
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            return GestureDetector(child: setListView(list[index]),onTap: (){
              onItemClick(context, index);
            },);
          },childCount: list.length,
          ))
        ]);

  }

  Widget setListView(MachineEntity data) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(20.w),
          padding: EdgeInsets.all(30.w),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colours.button_sel, width: 2.w),
              borderRadius: new BorderRadius.circular((10.w)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 0, //阴影模糊程度
                    spreadRadius: 0)
              ]),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(data.online == "1"?R.assetsImgIcMachineOffline:R.assetsImgIcMachineOnline,
                      width: 60.w,
                      height: 70.w,
                    ),
                    Gaps.vGap4,
                    Text(data.online == "1"?S.current.machine_list_offline:S.current.machine_list_online,
                      style: data.online == "1"?ITextStyles.itemContent:ITextStyles.itemTitle,),
                  ],
                ),
                flex: 1,
              ),
              Gaps.vLine,
              Gaps.hGap8,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(text: S.current.machine_list_1,style: ITextStyles.itemContent),
                      TextSpan(text: data.realCap.toString(),style: ITextStyles.itemTitle),
                      TextSpan(text: "TB",style: ITextStyles.itemTitle),
                    ])),
                    Gaps.vGap8,
                    Text.rich(TextSpan(children: [
                      TextSpan(text: S.current.machine_list_3,style: ITextStyles.itemContent),
                      TextSpan(text: data.pledge.toString(),style: ITextStyles.itemTitle),
                      TextSpan(text: "FIL",style: ITextStyles.itemTitle),
                    ])),

                  ],
                ),
                flex: 3,
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(text: S.current.machine_list_2,style: ITextStyles.itemContent),
                        TextSpan(text: data.useCap.toString(),style: ITextStyles.itemTitle),
                        TextSpan(text: "TB",style: ITextStyles.itemTitle),
                      ])),
                      Gaps.vGap8,
                      Text.rich(TextSpan(children: [
                        TextSpan(text: S.current.machine_list_4,style: ITextStyles.itemContent),
                        TextSpan(text: data.realCap.toString(),style: ITextStyles.itemTitle),
                        TextSpan(text: "TB",style: ITextStyles.itemTitle),
                      ])),
                    ],
                  ),
                  flex: 3)
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.only(left:8.w, top: 10.w),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(R.assetsImgIcMachineBtc,width: 82.w,height: 51.w,fit: BoxFit.fitWidth,),
              Text("FIL", style: TextStyle(fontSize: 10, color: Colours.white),),
            ],

          )
        )
      ],
    );
  }

  void onItemClick(BuildContext context, int index){
    NavigatorUtil.push(context,Routes.machineInfoPage,arguments: list[index]);

  }
}