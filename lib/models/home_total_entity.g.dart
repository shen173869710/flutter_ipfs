// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_total_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeTotalEntity _$HomeTotalEntityFromJson(Map<String, dynamic> json) {
  return HomeTotalEntity()
    ..total = json['total'] as num
    ..releaseNow = json['releaseNow'] as num
    ..freezeNum = json['freezeNum'] as num;
}

Map<String, dynamic> _$HomeTotalEntityToJson(HomeTotalEntity instance) =>
    <String, dynamic>{
      'total': instance.total,
      'releaseNow': instance.releaseNow,
      'freezeNum': instance.freezeNum,
    };
