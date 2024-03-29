
import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/utils/string_util.dart';


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
      errorWidget: (context, url, error) => Image.asset(R.assetsImgIconDefaultHead,height: 60.h,width: 60.h,),
    );
  }

  static CachedNetworkImage getDesc(String url) {
    LogUtil.e("CachedNetworkImage === "+url);
    return CachedNetworkImage(
      width: double.infinity,
      imageUrl: url,
      fit: BoxFit.fitWidth,
      placeholder: (context, url) =>
          Center(child: CupertinoActivityIndicator()),
      errorWidget: (context, url, error) => Image.asset(R.assetsImgIconDefaultHead,height: 60.h,width: double.infinity,),
    );
  }

  static CachedNetworkImage getFansFormNet(String url) {
    LogUtil.e("CachedNetworkImage === "+url);
    return CachedNetworkImage(
      width: 100.h,
      height: 100.h,
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          Center(child: CupertinoActivityIndicator()),
      errorWidget: (context, url, error) => Image.asset(R.assetsImgIconDefaultHead,height: 60.h,width: 60.h,),
    );
  }

  static  loadImage(String url, double width, double height,{def}) {
      if (StringUtil.isEmpty(url)) {
        url = "";
      }
      // if (url.contains('webp')) {
      //   LogUtil.e("加载webp 图片");
      //   return Image.network(url,height: width,width: height,fit: BoxFit.fill);
      // }

    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (context, url) => Center(child: CupertinoActivityIndicator()),
      errorWidget: (context, url, error) => Image.asset(getDefault(def),height: width,width: height,fit:BoxFit.cover ,),
    );
  }


  static String getDefault(String def) {
    if (StringUtil.isEmpty(def)) {
      return R.assetsImgIcDefHead;
    }else{
      return def;
    }
  }

}