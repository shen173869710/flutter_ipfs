// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_day_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDayEntity _$HomeDayEntityFromJson(Map<String, dynamic> json) {
  return HomeDayEntity()
    ..cost32 = (json['cost32'] == null ? null : HomeCostEntity.fromJson(json['cost32'] as Map<String, dynamic>))!
    ..costTB = (json['costTB'] == null ? null : HomeCostEntity.fromJson(json['costTB'] as Map<String, dynamic>))!
    ..costPB = (json['costPB'] == null ? null : HomeCostEntity.fromJson(json['costPB'] as Map<String, dynamic>))!;
}

Map<String, dynamic> _$HomeDayEntityToJson(HomeDayEntity instance) =>
    <String, dynamic>{
      'cost32': instance.cost32!.toJson(),
      'costTB': instance.costTB!.toJson(),
      'costPB': instance.costPB!.toJson(),
    };
