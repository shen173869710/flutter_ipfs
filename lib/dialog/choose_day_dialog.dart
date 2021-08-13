import 'package:flutter/cupertino.dart';
import '../include.dart';

class ChooseDayDialog extends StatelessWidget {
  List<int> list = [];

  final void Function(int index) onItemClickListener;

  ChooseDayDialog({required this.list,required this.onItemClickListener});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Container(
          padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 40.w),
          decoration: new BoxDecoration(
              color: Colours.text_white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30.w), topRight: Radius.circular(30.w))
            // borderRadius: new BorderRadius.circular((10.w)),
          ),
          child: Column(
            children: [
              getTopLayout(context),
              Gaps.vGap12,
              SizedBox(child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => Divider(height: 1.0, color: Colours.line),
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index)=>InkWell(onTap: () {
                }, child: Container(child:getListItem(list[index], index,context)),
                ),
              ),height: 380,),

            ],
          )) ,
    );

  }

  Column getTopLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(S.current.machine_hosting_time,style: ITextStyles.itemTitle,),
      ],
    );
  }
  Container getListItem(int entiy, int index,BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20.h, 0, 20.h),
      child: Center(child: GestureDetector(child:Text(entiy.toString()+S.current.day,style: ITextStyles.itemTitle,),onTap: (){
            Navigator.of(context).pop();
            onItemClickListener(index);
      },))
    );
  }



}
