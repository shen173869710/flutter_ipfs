import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:ipfsnets/models/user_entity.dart';
import 'package:sqflite/sqflite.dart';

import '../base_db_provider.dart';

/**
 */

class UserInfoDbProvider extends BaseDbProvider {
  final String name = 'UserInfo';

  Map<String, dynamic> toMap(String avatar, String code, String createBy,
      String createTime, String delFlag, int level,
      String nickname, String password, String ref,
      String remark, String searchValue,String sex,
      String status, String updateBy,String updateTime, String username) {
    Map<String, dynamic> map = {columnAvatar: avatar, columnCode: code,columnCreateBy:createBy,
      columnCreateTime:createTime, columnDelFlag:delFlag,columnLevel:level,
      columnNickname:nickname,columnPassword:password, columnRef:ref,
      columnRemark:remark,columnSearchValue:searchValue,columnSex:sex,
      columnStatus:status,columnUpdateBy:updateBy,columnUpdateTime:updateTime,columnUsername:username,};
    if (userId != null) {
      map[columnUserId] = userId;
    }
    return map;
  }

  final String columnUserId = "_userId";
  final String columnAvatar = "avatar";
  final String columnCode = "code";
  final String columnCreateBy = "createBy";
  final String columnCreateTime = "createTime";
  final String columnDelFlag= "delFlag";
  final String columnLevel = "level";
  final String columnNickname= "nickname";
  final String columnPassword = "password";
  final String columnRef = "ref";
  final String columnRemark = "remark";
  final String columnSearchValue = "searchValue";
  final String columnSex = "sex";
  final String columnStatus = "status";
  final String columnUpdateBy= "updateBy";
  final String columnUpdateTime = "updateTime";
  final String columnUsername = "username";

  int? userId;
  String? avatar;
  String? code;
  String? createBy;
  String? createTime;
  String? delFlag;
  int? level;
  String? nickname;
  String? password;
  String? ref;
  String? remark;
  String? searchValue;
  String? sex;
  String? status;
  String? updateBy;
  String? updateTime;
  String? username;

  UserInfoDbProvider();


  UserInfoDbProvider.fromMap(Map map) {
    userId = map[columnUserId];
    avatar = map[columnAvatar];
    code = map[columnCode];
    createBy = map[columnCreateBy];
    createTime = map[columnCreateTime];
    delFlag = map[columnDelFlag];
    level = map[columnLevel];

    nickname = map[columnNickname];
    password = map[columnPassword];
    ref = map[columnRef];
    remark = map[columnRemark];
    searchValue = map[columnSearchValue];

    sex = map[columnSex];
    status = map[columnStatus];
    updateBy = map[columnUpdateBy];
    updateTime = map[columnUpdateTime];
    username = map[columnUsername];
  }

  @override
  tableSqlString() {
    return tableBaseString(name, columnUserId) +
        '''
        $columnUsername text not null,
        $avatar text not null)
      ''';
  }

  @override
  tableName() {
    return name;
  }


  Future _getUserProvider(Database db, String avatar, String code, String createBy,
      String createTime, String delFlag, int level,
      String nickname, String password, String ref,
      String remark, String searchValue,String sex,
      String status, String updateBy,String updateTime, String username) async {
    List<Map<String, dynamic>> maps = await db.query(name, columns: [columnUserId, columnAvatar, columnCode,columnCreateBy,columnCreateTime,columnDelFlag,
      columnLevel, columnNickname, columnPassword,columnRef,columnRemark,columnSearchValue,
      columnSex, columnStatus, columnUpdateBy,columnUpdateTime,columnUsername],
        where: "$columnUsername = ?",
        whereArgs: [username]);
    if (maps.length > 0) {
      UserInfoDbProvider provider = UserInfoDbProvider.fromMap(maps.first);
      return provider;
    }
    return null;
  }

  // ///插入到数据库
  // Future insert(String userName, String eventMapString) async {
  //   Database db = await getDataBase();
  //   var userProvider = await _getUserProvider(db, userName);
  //   if (userProvider != null) {
  //     await db.delete(name, where: "$columnUsername = ?", whereArgs: [userName]);
  //   }
  //   return await db.insert(name, toMap(userName, eventMapString));
  // }



  ///获取事件数据
  // Future<UserEntity?> getUserInfo(String? userName) async {
  //   Database db = await getDataBase();
  //   var userProvider = await _getUserProvider(db, userName);
  //   if (userProvider != null) {
  //     ///使用 compute 的 Isolate 优化 json decode
  //     var mapData =
  //     await compute(CodeUtils.decodeMapResult, userProvider.data as String?);
  //     return UserEntity.fromJson(mapData);
  //   }
  //   return null;
  // }
}