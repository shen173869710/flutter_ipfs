// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fans_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FansEntity _$FansEntityFromJson(Map<String, dynamic> json) {
  return FansEntity()
    ..avatar = json['avatar'] as String
    ..createTime = json['createTime'] as String
    ..levelName = json['levelName'] as String
    ..nickname = json['nickname'] as String
    ..personalKpi = json['personalKpi'] as num
    ..teamKpi = json['teamKpi'] as num
    ..unit = json['unit'] as String;
}

Map<String, dynamic> _$FansEntityToJson(FansEntity instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'createTime': instance.createTime,
      'levelName': instance.levelName,
      'nickname': instance.nickname,
      'personalKpi': instance.personalKpi,
      'teamKpi': instance.teamKpi,
      'unit': instance.unit,
    };
