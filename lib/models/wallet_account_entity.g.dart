// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_account_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletAccountEntity _$WalletAccountEntityFromJson(Map<String, dynamic> json) {
  return WalletAccountEntity()
    ..coinIcon = json['coinIcon'] as String
    ..coinName = json['coinName'] as String
    ..coinCode = json['coinCode'] as num
    ..value = json['value'] as num;
}

Map<String, dynamic> _$WalletAccountEntityToJson(
        WalletAccountEntity instance) =>
    <String, dynamic>{
      'coinIcon': instance.coinIcon,
      'coinName': instance.coinName,
      'coinCode': instance.coinCode,
      'value': instance.value,
    };
