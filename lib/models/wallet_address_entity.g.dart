// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_address_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletAddressEntity _$WalletAddressEntityFromJson(Map<String, dynamic> json) {
  return WalletAddressEntity()
    ..address = json['address'] as String
    ..aliasName = json['aliasName'] as String
    ..coinIcon = json['coinIcon'] as String
    ..coinName = json['coinName'] as String
    ..id = json['id'] as num
    ..type = json['type'] as num
    ..coinCode = json['coinCode'] as num;
}

Map<String, dynamic> _$WalletAddressEntityToJson(
        WalletAddressEntity instance) =>
    <String, dynamic>{
      'address': instance.address,
      'aliasName': instance.aliasName,
      'coinIcon': instance.coinIcon,
      'coinName': instance.coinName,
      'id': instance.id,
      'type': instance.type,
      'coinCode': instance.coinCode,
    };
