import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/dialog/month_picker_dialog.dart';
import 'package:ipfsnets/http/market_api.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/machine_entity.dart';
import 'package:ipfsnets/models/market_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/picker/common/date.dart';
import 'package:ipfsnets/picker/flutter_my_picker.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/widget/base_list_page.dart';

import 'machine_total_list_item.dart';



class MachineTotalPage extends StatefulWidget {

  late num id;
  MachineTotalPage(this.id);
  @override
  _MachineTotalState createState() => _MachineTotalState(id);
}

class _MachineTotalState extends BaseListPageState<MachineTotalPage> with AutomaticKeepAliveClientMixin {
  late num id;

  _MachineTotalState(this.id);

  late MachineEntity entity;

  late String currentTime = DateTime.now().year.toString() + "-" + DateTime.now().month.toString();
  List<MarketEntity> list = [];

  @override
  Widget build(BuildContext context) {
    entity = ModalRoute
        .of(context)!
        .settings
        .arguments as MachineEntity;


    setEnableRefresh(false);
    setEnableLoadMore(false);
    return Scaffold(
      backgroundColor: Colours.bg_color,
      appBar: AppBar(
        title: new Text(S.current.machine_total_title),
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
                buildItem4(context),
                buildItem2(context),
                Expanded(child: buildRefreshView(context),),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget setListView(int index) {
    return MachineTotalListItem(list[index]);
  }

  @override
  void onItemClick(BuildContext context, int index) {
    // TODO: implement onItemClick

  }


  @override
  int getListLength() {
    // TODO: implement getListSize
    return list.length;
  }


  @override
  Future<BaseEntity> getData() async {
    BaseEntity entity = await MarketApi.getMachineById(id, false);
    if (entity.isOk()) {
      list.addAll(entity.data);
      setState(() {

      });
    }
    return entity;
  }

  @override
  void clearList() {
    list.clear();
  }


  // 矿区收益
  buildItem4(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.w),
      padding: EdgeInsets.all(30.w),
      decoration: ITextStyles.boxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(S.current.machine_total_1, style: ITextStyles.itemContent),
              Gaps.vGap8,
              Text("123456",
                style: TextStyle(fontSize: 20, color: Color(0xffF23E2A)),),
            ],
          ),
          Gaps.vGap8,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: buildItem3Desc(
                  S.current.machine_total_2, S.current.machine_total_2),
                flex: 1,),
              Expanded(child: buildItem3Desc(
                  S.current.machine_total_3, S.current.machine_total_3),
                flex: 1,)
            ],
          ),
        ],
      ),
    );
  }


  // 矿区收益
  buildItem2(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(child: Text.rich(TextSpan(children: [
            TextSpan(text: currentTime, style: ITextStyles.itemTitle),
            WidgetSpan(child: Image.asset(
              R.assetsImgIcDown, height: 35.w, width: 35.w,)),
          ])), onTap: () {
            // _showCupertinoDatePicker();
            showTimeDialog();
          },),

          Expanded(child: SizedBox(),),
          Text(S.current.machine_total_4 + "：123 FIL",
              style: ITextStyles.itemContent),
        ],
      ),
    );
  }

  showTimeDialog() async {
    // DateTime? time = await showDatePicker(
    //     context: context,
    //     initialDate: DateTime.now(),
    //     firstDate: DateTime(2019),
    //     lastDate: DateTime.now());
    // print('$time');
    // print("--"+time!.month.toString());
    // currentTime = time.year.toString() + "-"+time.month.toString();
    // setState(() {
    //   print(currentTime);
    // });


    showMonthPicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 3, 1),
        lastDate: DateTime(DateTime.now().year, DateTime.now().month),
        initialDate: DateTime(DateTime.now().year, DateTime.now().month),)
        .then((date) => setState(() {
        currentTime = date!.year.toString() + "-" + date.month.toString();

    }));
  }




  buildItem3Desc(String title, String dec) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(dec, style: ITextStyles.itemContent),
        Gaps.vGap4,
        Text(title, style: ITextStyles.itemTitle,),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> _showCupertinoDatePicker() async {
    print("_showCupertinoDatePicker");
    DateTime _selectedDate = DateTime.now();

    // DayPicker(
    //   selectedDate: _selectedDate,
    //   currentDate: DateTime.now(),
    //   onChanged: (date) {
    //     setState(() {
    //       _selectedDate = date;
    //     });
    //   },
    //   firstDate: DateTime(2020, 5, 1),
    //   lastDate: DateTime(2020, 5, 31),
    //   displayedMonth: DateTime(2020, 5),
    // );
    // var date =await YearPicker(
    //   selectedDate: _selectedDate,
    //   onChanged: (date) {
    //     setState(() {
    //       _selectedDate = date;
    //     });
    //   },
    //   firstDate: DateTime(2000, 1),
    //   lastDate: DateTime(2020, 12),
    // );
    DateTime selectedDate = DateTime.now();
    MonthPicker(
      selectedDate: _selectedDate,
      onChanged: (date) {
        setState(() {
          selectedDate = date;
        });
      },
      firstDate: DateTime(2020, 1),
      lastDate: DateTime(2020, 12),
    );

  }
  _change(formatString) {
    return (_date) {
      print(MyDate.format(formatString, _date));
      setState(() {

      });
    };
  }

}

