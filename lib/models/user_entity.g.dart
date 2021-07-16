// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return UserEntity()
    ..userId = json['userId'] as int
    ..avatar = json['avatar'] as String
    ..code = json['code'] as String
    ..createBy = json['createBy'] as String
    ..createTime = json['createTime'] as String
    ..delFlag = json['delFlag'] as String
    ..level = json['level'] as int
    ..nickname = json['nickname'] as String
    ..password = json['password'] as String
    ..ref = json['ref'] as String
    ..remark = json['remark'] as String
    ..searchValue = json['searchValue'] as String
    ..sex = json['sex'] as String
    ..status = json['status'] as String
    ..updateBy = json['updateBy'] as String
    ..updateTime = json['updateTime'] as String
    ..username = json['username'] as String;
}

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'avatar': instance.avatar,
      'code': instance.code,
      'createBy': instance.createBy,
      'createTime': instance.createTime,
      'delFlag': instance.delFlag,
      'level': instance.level,
      'nickname': instance.nickname,
      'password': instance.password,
      'ref': instance.ref,
      'remark': instance.remark,
      'searchValue': instance.searchValue,
      'sex': instance.sex,
      'status': instance.status,
      'updateBy': instance.updateBy,
      'updateTime': instance.updateTime,
      'username': instance.username,
    };
