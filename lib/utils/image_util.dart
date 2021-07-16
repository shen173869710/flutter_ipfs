

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:ipfsnets/include.dart';

class ImageUtil{

  static CachedNetworkImage loadHeadFormNet(String url) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Image.asset(R.assetsImgIcDefHead),
    );
  }


  static CachedNetworkImage getHeadFormNet(String url) {
    LogUtil.e("CachedNetworkImage === "+url);
    return CachedNetworkImage(
      width: 70.h,
      height: 70.h,
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          Center(child: CupertinoActivityIndicator()),
      errorWidget: (context, url, error) => Image.asset(R.assetsImgIcDefHead,height: 60.h,width: 60.h,),
    );
  }




}