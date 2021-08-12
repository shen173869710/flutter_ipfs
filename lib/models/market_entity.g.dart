// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketEntity _$MarketEntityFromJson(Map<String, dynamic> json) {
  return MarketEntity()
    ..contractPeriod = json['contractPeriod'] as num
    ..details = json['details'] as String
    ..initial = json['initial'] as num
    ..machineId = json['machineId'] as num
    ..name = json['name'] as String
    ..nodeName = json['nodeName'] as String
    ..price = json['price'] as num
    ..recommend = json['recommend'] as String
    ..selled = json['selled'] as num
    ..shopStatus = json['shopStatus'] as String
    ..stock = json['stock'] as num
    ..tag = (json['tag'] as List).map((e) => e as String).toList();
}

Map<String, dynamic> _$MarketEntityToJson(MarketEntity instance) =>
    <String, dynamic>{
      'contractPeriod': instance.contractPeriod,
      'details': instance.details,
      'initial': instance.initial,
      'machineId': instance.machineId,
      'name': instance.name,
      'nodeName': instance.nodeName,
      'price': instance.price,
      'recommend': instance.recommend,
      'selled': instance.selled,
      'shopStatus': instance.shopStatus,
      'stock': instance.stock,
      'tag': instance.tag,
    };
