// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_home_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletHomeEntity _$WalletHomeEntityFromJson(Map<String, dynamic> json) {
  return WalletHomeEntity(
    json['cnySum'] as num,
    (json['rows'] as List).map((e) => e == null ? null : WalletItemEntiy.fromJson(e as Map<String, dynamic>)).toList(),
    json['usdtSum'] as num,
  );
}

Map<String, dynamic> _$WalletHomeEntityToJson(WalletHomeEntity instance) =>
    <String, dynamic>{
      'cnySum': instance.cnySum,
      'rows': instance.rows?.map((e) => e?.toJson())?.toList(),
      'usdtSum': instance.usdtSum,
    };
