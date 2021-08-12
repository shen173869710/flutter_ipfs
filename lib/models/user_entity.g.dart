// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return UserEntity()
    ..userId = json['userId'] as num
    ..avatar = json['avatar'] as String
    ..level = json['level'] as num
    ..nickname = json['nickname'] as String
    ..password = json['password'] as String
    ..remark = json['remark'] as String
    ..searchValue = json['searchValue'] as String
    ..sex = json['sex'] as String
    ..status = json['status'] as String
    ..code = json['code'] as String
    ..refname = json['refname'] as String
    ..ref = json['ref'] as num
    ..refs = json['refs'] as String
    ..refLevels = json['refLevels'] as num
    ..username = json['username'] as String;
}

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'avatar': instance.avatar,
      'level': instance.level,
      'nickname': instance.nickname,
      'password': instance.password,
      'remark': instance.remark,
      'searchValue': instance.searchValue,
      'sex': instance.sex,
      'code': instance.code,
      'ref': instance.ref,
      'refname': instance.refname,
      'refs': instance.refs,
      'refLevels': instance.refLevels,
      'sex': instance.sex,

      'username': instance.username,
    };
