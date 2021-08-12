// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_bar_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketBarEntity _$MarketBarEntityFromJson(Map<String, dynamic> json) {
  return MarketBarEntity()
    ..typeId = json['typeId'] as num
    ..name = json['name'] as String;
}

Map<String, dynamic> _$MarketBarEntityToJson(MarketBarEntity instance) =>
    <String, dynamic>{
      'typeId': instance.typeId,
      'name': instance.name,
    };
