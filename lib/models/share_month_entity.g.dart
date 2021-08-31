// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_month_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareMonthEntity _$ShareMonthEntityFromJson(Map<String, dynamic> json) {
  return ShareMonthEntity()
    ..earningList = (json['earningList'] as List).map((e) => e == null ? null : ShareCionEntity.fromJson(e as Map<String, dynamic>)).toList()
    ..total = json['total'] as num;
}

Map<String, dynamic> _$ShareMonthEntityToJson(ShareMonthEntity instance) =>
    <String, dynamic>{
      'earningList': instance.earningList.map((e) => e?.toJson()).toList(),
      'total': instance.total,
    };
