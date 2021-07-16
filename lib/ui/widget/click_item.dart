import '../../include.dart';

class ClickItem extends StatelessWidget {

  const ClickItem({
    Key? key,
    this.onTap,
    required this.title,
    this.content = '',
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
  }): super(key: key);

  final GestureTapCallback? onTap;
  final String title;
  final String content;
  final TextAlign textAlign;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      //为了数字类文字居中
      crossAxisAlignment: maxLines == 1 ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: <Widget>[
        Text(title,style: ITextStyles.itemTitle,),
        Spacer(),
        Gaps.hGap16,
        Expanded(
          flex: 4,
          child: Text(
            content,
            maxLines: maxLines,
            textAlign: maxLines == 1 ? TextAlign.right : textAlign,
            overflow: TextOverflow.ellipsis,
            style: ITextStyles.itemTitle,
          ),
        ),
        Gaps.hGap8,
        Opacity(
          // 无点击事件时，隐藏箭头图标
          opacity: onTap == null ? 0 : 1,
          child: Padding(
            padding: EdgeInsets.only(top: maxLines == 1 ? 0.0 : 2.0),
            child: IImages.arrowRight
          ),
        )
      ],
    );

    /// 分隔线
    child = Container(
      padding:  ITextStyles.containerMargin,
      color: Colours.text_white,
      constraints: BoxConstraints(
        maxHeight: double.infinity,
        minHeight: 80.h,
      ),
      width: double.infinity,
      child: child,
    );

    return InkWell(
      onTap: onTap,
      child: child,
    );
  }
}