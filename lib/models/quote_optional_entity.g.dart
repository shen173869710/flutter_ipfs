// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_optional_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteOptionalEntity _$QuoteOptionalEntityFromJson(Map<String, dynamic> json) {
  return QuoteOptionalEntity()
    ..changeRate = json['changeRate'] as num
    ..optionalStatus = json['optionalStatus'] as num
    ..id = json['id'] as num
    ..logo = json['logo'] as String
    ..marketCap = json['marketCap'] as num
    ..name = json['name'] as String
    ..priceCny = json['priceCny'] as num
    ..priceUsd = json['priceUsd'] as num
    ..star = json['star'] as num;
}

Map<String, dynamic> _$QuoteOptionalEntityToJson(
        QuoteOptionalEntity instance) =>
    <String, dynamic>{
      'changeRate': instance.changeRate,
      'optionalStatus': instance.optionalStatus,
      'id': instance.id,
      'logo': instance.logo,
      'marketCap': instance.marketCap,
      'name': instance.name,
      'priceCny': instance.priceCny,
      'priceUsd': instance.priceUsd,
      'star': instance.star,
    };
