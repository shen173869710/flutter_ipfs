// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletInfoEntity _$WalletInfoEntityFromJson(Map<String, dynamic> json) {
  return WalletInfoEntity()
    ..freeze = json['freeze'] as num
    ..pledge = json['pledge'] as num
    ..sum = json['sum'] as num
    ..todayEarnings = json['todayEarnings'] as num
    ..txValue = json['txValue'] as num;
}

Map<String, dynamic> _$WalletInfoEntityToJson(WalletInfoEntity instance) =>
    <String, dynamic>{
      'freeze': instance.freeze,
      'pledge': instance.pledge,
      'sum': instance.sum,
      'todayEarnings': instance.todayEarnings,
      'txValue': instance.txValue,
    };
