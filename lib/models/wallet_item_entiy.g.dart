// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_item_entiy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletItemEntiy _$WalletItemEntiyFromJson(Map<String, dynamic> json) {
  return WalletItemEntiy()
    ..cny = json['cny'] as num
    ..coinCode = json['coinCode'] as num
    ..coinIcon = json['coinIcon'] as String
    ..coinName = json['coinName'] as String
    ..value = json['value'] as num;
}

Map<String, dynamic> _$WalletItemEntiyToJson(WalletItemEntiy instance) =>
    <String, dynamic>{
      'cny': instance.cny,
      'coinCode': instance.coinCode,
      'coinIcon': instance.coinIcon,
      'coinName': instance.coinName,
      'value': instance.value,
    };
