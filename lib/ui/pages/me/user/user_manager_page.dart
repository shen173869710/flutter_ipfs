import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ipfsnets/dialog/choose_sex_dialog.dart';
import 'package:ipfsnets/dialog/image_picker_dialog.dart';
import 'package:ipfsnets/getx/user_controller.dart';
import 'package:ipfsnets/http/api_service.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/image_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/ui/pages/me/user/user_edit_page.dart';
import 'package:ipfsnets/ui/widget/click_icon_item.dart';
import 'package:ipfsnets/ui/widget/click_item.dart';
import 'package:ipfsnets/ui/widget/login_button.dart';
import 'package:ipfsnets/utils/toast_util.dart';

class UserManagerPage extends StatefulWidget {

  final String? resule;
  UserManagerPage({this.resule});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UserManagerState();
  }
}

class _UserManagerState extends State<UserManagerPage> {
  final UserController userController = Get.put(UserController());
  File? _image;
  final picker = ImagePicker();

  late String _headUrl = "";
  late String _sex = "";
  late String _nickName = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(S.current.me_info_title),
          centerTitle: true,
          // leading: Icon(Icons.arrow_back_ios,color: Colours.text_white),
          backgroundColor: Colours.app_bar_bg,
        ),
        body: Scaffold(
          backgroundColor: Colours.bg_color,
          body: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClickIconItem(title: S.current.me_info_head),
                  Positioned(
                      top: 8.0,
                      bottom: 8.0,
                      right: 30.h,
                      child: ClipOval(
                          clipper: _MyClipper(),
                          child:_image == null? getHeadDefault():GestureDetector(child: Image.file(_image!,width: 70.h,height: 70.h,fit: BoxFit.cover,),onTap: (){choosePhoto(context);},),
                      )
                  )
                ],
              ),
              Gaps.vGap16,
              ClickItem(
                title: S.current.me_info_nick,
                content: (_nickName==null||_nickName.isEmpty)?userController.user.nickname:_nickName,
                onTap: () async {
                  // Application.router!.navigateTo(context, Routes.userEdit, transition: TransitionType.inFromRight,).then((result) => (){
                  //   print(result);
                  //   // LogUtil.e("返回值------"+value.toString());
                  // });
                  var data = await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context){
                            return UserEditPage(userController.user.nickname);//跳转到Detail页面组件
                          }
                      )
                  );


                  if(data != null && data.toString().isNotEmpty) {
                    setState(() {
                      _nickName = data.toString();
                    });
                  }
                },
              ),
              ClickItem(
                  title: S.current.me_info_sex,
                  content:getSex(),
                  onTap: () {
                    chooseSex(context);
                  }),
              ClickItem(
                title: S.current.me_info_phone,
                content: userController.user.username,
              ),
              // Gaps.vGap16,
              // ClickItem(
              //   title: S.current.me_info_address,
              //   onTap: () {},
              // ),
              Padding(
                padding: EdgeInsets.fromLTRB(30.w, 50.h, 30.w, 0),
                child: LoginButton(text: S.current.save, endble: true, onPressed: () async {
                  bool isSuc =  await userController.doUpdateUser(_headUrl, _sex, _nickName);
                  if (isSuc) {
                    userController.changeUserNickNam(_nickName);
                    userController.changeUserHead(_headUrl);
                    userController.changeUserGender(_sex);
                    ToastUtil.show(S.current.option_success);

                  }

                }),
              )
            ],
          ),
        ));
  }

  GestureDetector getHeadDefault() {
    return GestureDetector(child: ImageUtil.getHeadFormNet(userController.user.avatar), onTap: () {choosePhoto(context);});
  }

  // 获取性别
  String getSex() {
    String str = "";
    if (_sex == null || _sex.isEmpty) {
      if (userController.user.sex != null && userController.user.sex == "2"){
        str = S.current.me_info_image_woman;
      }else{
        str = S.current.me_info_image_man;
      }
    }else{
      if (_sex == "2") {
        str  = S.current.me_info_image_woman;
      }else{
        str = S.current.me_info_image_man;
      }
    }
    return str;
  }


  // 选择图片
  void chooseSex(BuildContext context) async {
    LogUtil.e("chooseSex() ");
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => ChooseSexDialog(
        onItemClickListener: (index) {
          setState(() {
            if (index == 1) {
              _sex = "1";
            } else if (index == 2) {
              _sex = "2";
            }
          });
        },
      ),
    ).then((value) {});
  }



  // 选择图片
  void choosePhoto(BuildContext context) async {
    LogUtil.e("choosePhoto() ");
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => ImagePickerDialog(
        onItemClickListener: (index) {
          if (index == 1) {
            fromCamera();
          } else if (index == 2) {
            fromPhoteo();
          }
        },
      ),
    ).then((value) {});
  }

  void fromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera,imageQuality: 50);
    if (pickedFile != null) {
      LogUtil.e("==" + pickedFile.path.toString());
      _image = File(pickedFile.path);

      LogUtil.e("==" + _image!.lengthSync().toString());
      BaseEntity baseEntity = await ApiServer.uploadFile(_image!);
      if (baseEntity != null && baseEntity.code == 200) {
        ImageEntity entity = baseEntity.data;
        LogUtil.e("url==" + entity.url);
        if (entity != null) {
          setState(() {
            _headUrl = entity.url;
          });
        }
      }else{
        ToastUtil.show(baseEntity.msg);
      }
      LogUtil.e("code ==" + baseEntity.code.toString());
    }
  }

  void fromPhoteo() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,maxWidth: 800);
    if (pickedFile != null) {
      LogUtil.e("==" + pickedFile.path.toString());
      // setState(() {
      _image = File(pickedFile.path);
      if(_image != null  && _image!.lengthSync() > 5000000) {
        ToastUtil.show(S.current.image_to_big);
        return;
      }
      
      BaseEntity baseEntity = await ApiServer.uploadFile(_image!);
      if (baseEntity != null && baseEntity.code == 200) {
        ImageEntity entity = baseEntity.data;
        if (entity != null) {
          setState(() {
            _headUrl = entity.url;
          });
        }
        LogUtil.e("fromPhoteo url==" + entity.url);
      }else{
        ToastUtil.show(baseEntity.msg);
      }
      LogUtil.e("code ==" + baseEntity.code.toString());
      // }
    }
  }
}

class _MyClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    return new Rect.fromLTRB(0, 0, 70.h,70.h);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
