// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_day_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareDayEntity _$ShareDayEntityFromJson(Map<String, dynamic> json) {
  return ShareDayEntity()
    ..freezeNum = json['freezeNum'] as num
    ..releaseNow = json['releaseNow'] as num
    ..servEarnings = (json['servEarnings'] as List).map((e) => e == null ? null : ShareCionEntity.fromJson(e as Map<String, dynamic>)).toList()
    ..todayEarning = json['todayEarning'] as num
    ..totalNum = json['totalNum'] as num;
}

Map<String, dynamic> _$ShareDayEntityToJson(ShareDayEntity instance) =>
    <String, dynamic>{
      'freezeNum': instance.freezeNum,
      'releaseNow': instance.releaseNow,
      'servEarnings': instance.servEarnings.map((e) => e?.toJson()).toList(),
      'todayEarning': instance.todayEarning,
      'totalNum': instance.totalNum,
    };
