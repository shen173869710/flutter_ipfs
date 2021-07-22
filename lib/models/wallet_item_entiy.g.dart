// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_item_entiy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletItemEntiy _$WalletItemEntiyFromJson(Map<String, dynamic> json) {
  return WalletItemEntiy(
    json['cny'] as num,
    json['coinCode'] as num,
    json['coinIcon'] as String,
    json['coinName'] as String,
    json['value'] as num,
  );
}

Map<String, dynamic> _$WalletItemEntiyToJson(WalletItemEntiy instance) =>
    <String, dynamic>{
      'cny': instance.cny,
      'coinCode': instance.coinCode,
      'coinIcon': instance.coinIcon,
      'coinName': instance.coinName,
      'value': instance.value,
    };
