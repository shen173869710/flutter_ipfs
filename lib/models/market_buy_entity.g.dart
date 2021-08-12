// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_buy_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketBuyEntity _$MarketBuyEntityFromJson(Map<String, dynamic> json) {
  return MarketBuyEntity()
    ..cnyBalance = json['cnyBalance'] as num
    ..cnyPrice = json['cnyPrice'] as num
    ..usdtBalance = json['usdtBalance'] as num
    ..usdtPrice = json['usdtPrice'] as num;
}

Map<String, dynamic> _$MarketBuyEntityToJson(MarketBuyEntity instance) =>
    <String, dynamic>{
      'cnyBalance': instance.cnyBalance,
      'cnyPrice': instance.cnyPrice,
      'usdtBalance': instance.usdtBalance,
      'usdtPrice': instance.usdtPrice,
    };
