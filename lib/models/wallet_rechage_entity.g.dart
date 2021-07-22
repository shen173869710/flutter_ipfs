// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_rechage_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletRechageEntity _$WalletRechageEntityFromJson(Map<String, dynamic> json) {
  return WalletRechageEntity()
    ..chain = json['chain'] as String
    ..coinCode = json['coinCode'] as num
    ..coinName = json['coinName'] as String
    ..inDes = json['inDes'] as String
    ..inStatus = json['inStatus'] as num;
}

Map<String, dynamic> _$WalletRechageEntityToJson(
        WalletRechageEntity instance) =>
    <String, dynamic>{
      'chain': instance.chain,
      'coinCode': instance.coinCode,
      'coinName': instance.coinName,
      'inDes': instance.inDes,
      'inStatus': instance.inStatus,
    };
