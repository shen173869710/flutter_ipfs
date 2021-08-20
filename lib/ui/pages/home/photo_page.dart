

import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';
import '../../../include.dart';

class PhotoPage extends StatefulWidget {
  String type;
  PhotoPage(this.type);
  @override
  State<StatefulWidget> createState() {
    return _PhotoState();
  }
}
//启动页面
class _PhotoState extends State<PhotoPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: PhotoView(imageProvider:CachedNetworkImageProvider(widget.type),
        )
    );
  }

}