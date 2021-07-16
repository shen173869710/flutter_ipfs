import 'package:flutter/cupertino.dart';

import '../include.dart';

class ImagePickerDialog extends StatelessWidget {

  final void Function(int index) onItemClickListener;
  ImagePickerDialog({required this.onItemClickListener});

  @override
  Widget build(BuildContext context) {
    return new CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text(S.current.choose_camera,
            style: ITextStyles.itemTitle,
          ),
          onPressed: () {
            // 打开相机拍照
            // _getCameraImage();
            // 关闭菜单
            onItemClickListener(1);
            Navigator.of(context).pop();
          },
        ),
        CupertinoActionSheetAction(
          child: Text(
            S.current.choose_photo, style:ITextStyles.itemTitle,
          ),
          onPressed: () {
            // 打开相册，选取照片
            // _getGalleryImage();
            // 关闭菜单
            onItemClickListener(2);
            Navigator.of(context).pop();
          },
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text(
          S.current.cancle,
          style: ITextStyles.itemTitle,
        ),
        onPressed: () {
          // 关闭菜单
          Navigator.of(context).pop();
        },
      ),
    );
  }


}
