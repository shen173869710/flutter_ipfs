
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:ipfsnets/http/machine_api.dart';
import 'package:ipfsnets/models/main_tab_entiy.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import '../../../../include.dart';


class MachinePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _MachineStatus();
  }
}

class _MachineStatus extends State<MachinePage> {
  List<MainTabEntiy> entiys = [];
  EasyRefreshController _refreshController = EasyRefreshController();
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
  @override
  bool get wantKeepAlive => true;


  Future<void> getData() async {
    BaseEntity baseEntity = await MachineApi.getMachineStatistics();
    if (baseEntity.isOk()) {
      // List<MarketBarEntity> barEntity = baseEntity.data;
      // if (barEntity != null && barEntity.length > 0) {
      //   int length = barEntity.length;
      //   List<MainTabEntiy> temp = [];
      //   for (int i = 0; i < length; i++) {
      //     MainTabEntiy entiy = new MainTabEntiy(barEntity[i].name, MarketListPage(barEntity[i].typeId));
      //     temp.add(entiy);
      //   }
      //   entiys = temp;
      //   tabController  = TabController(length: entiys.length, vsync: this);
      //   setState(() {
      //   });
      }
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
                      buildItem(S.current.machine_item_1,S.current.machine_item_2, 1,10,0),
                      Gaps.vGap10,
                      buildItemM(S.current.machine_item_3,S.current.machine_item_4, 15,20,1),
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
  buildItem(String title, String dec,int number, int all,int index) {
    return Container(
      padding: EdgeInsets.all(30.w),
      width: 430.w,
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
          Gaps.hGap16,
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

  buildItemM(String title, String dec,int number, int all,int index) {
    return Container(
      padding: EdgeInsets.all(30.w),
      width: 430.w,
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
          Gaps.hGap16,
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

  CircularProgressIndicator _circularProgressIndicator(int postion, int all){
    return CircularProgressIndicator(
      value: postion/all, // 当前进度
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
              Text("123", style: ITextStyles.itemTitle,),
            ],
          ),
          Gaps.vLine,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(S.current.machine_item_6, style: ITextStyles.itemTitle,),
              Gaps.vGap4,
              Text("1111111111", style: ITextStyles.itemTitle,),
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
            NavigatorUtil.jump(context, Routes.marketBuyPage);
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
            return GestureDetector(child: setListView(index),onTap: (){
              onItemClick(context, index);
            },);
          },childCount: 5
          ))
        ]);

  }

  Widget setListView(int index) {
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
                    Image.asset(
                      R.assetsImgIcMachineOnline,
                      width: 60.w,
                      height: 70.w,
                    ),
                    Gaps.vGap4,
                    Text(S.current.machine_list_online,style: ITextStyles.itemTitle,),
                  ],
                ),
                flex: 1,
              ),
              Gaps.vLine,
              Gaps.hGap16,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.current.machine_list_1+" 111",
                      style: ITextStyles.itemTitle,
                    ),
                    Gaps.vGap8,
                    Text(
                      S.current.machine_list_3+" 333",
                      style: ITextStyles.itemTitle,
                    ),
                  ],
                ),
                flex: 2,
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.current.machine_list_2+" 2222",
                        style: ITextStyles.itemTitle,
                      ),
                      Gaps.vGap8,
                      Text(
                        S.current.machine_list_4+" 444",
                        style: ITextStyles.itemTitle,
                      ),
                    ],
                  ),
                  flex: 2)
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.only(left:8.w, top: 10.w),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(R.assetsImgIcMachineBtc,width: 82.w,height: 51.w,fit: BoxFit.fitWidth,),
              Text("BTC", style: TextStyle(fontSize: 10, color: Colours.white),),
            ],

          )
        )
      ],
    );
  }

  void onItemClick(BuildContext context, int index){
    NavigatorUtil.jump(context, Routes.machineInfoPage);

  }
}