// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_cion_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareCionEntity _$ShareCionEntityFromJson(Map<String, dynamic> json) {
  return ShareCionEntity()
    ..createTime = json['createTime'] as String
    ..extraCut = json['extraCut'] as num
    ..freezeNum = json['freezeNum'] as num
    ..releaseDay = json['releaseDay'] as num
    ..releaseNow = json['releaseNow'] as num
    ..sid = json['sid'] as num
    ..total = json['total'] as num;
}

Map<String, dynamic> _$ShareCionEntityToJson(ShareCionEntity instance) =>
    <String, dynamic>{
      'createTime': instance.createTime,
      'extraCut': instance.extraCut,
      'freezeNum': instance.freezeNum,
      'releaseDay': instance.releaseDay,
      'releaseNow': instance.releaseNow,
      'sid': instance.sid,
      'total': instance.total,
    };
