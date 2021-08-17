import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/res/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ipfsnets/main.dart';
class MeGridItem extends StatelessWidget {
  const MeGridItem({
    required this.onItemClick,
    required this.data,
    required this.image,
  });

  final Function(int index) onItemClick;
  final List<String> data;
  final List<String> image;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(0, 0, 0,0),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.18,
      ),
      itemCount: data.length,
      itemBuilder: (_, index) {
        return InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(image[index],width: 50.w,height: 50.w,fit: BoxFit.cover,),
              Gaps.vGap4,
              Text(data[index], style: ITextStyles.textSize12,)
            ],
          ),
          onTap: () {
            onItemClick(index);
          },
        );
      },
    );
  }
}