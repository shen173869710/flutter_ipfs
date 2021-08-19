// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_pledge_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MachinePledgeEntity _$MachinePledgeEntityFromJson(Map<String, dynamic> json) {
  return MachinePledgeEntity()
    ..alreadyAmount = json['alreadyAmount'] as num
    ..amount = json['amount'] as num
    ..gas = json['gas'] as num
    ..machineId = json['machineId'] as num
    ..needAmount = json['needAmount'] as num
    ..pledge = json['pledge'] as num
    ..realCap = json['realCap'] as num
    ..symbol = json['symbol'] as String;
}

Map<String, dynamic> _$MachinePledgeEntityToJson(
        MachinePledgeEntity instance) =>
    <String, dynamic>{
      'alreadyAmount': instance.alreadyAmount,
      'amount': instance.amount,
      'gas': instance.gas,
      'machineId': instance.machineId,
      'needAmount': instance.needAmount,
      'pledge': instance.pledge,
      'realCap': instance.realCap,
      'symbol': instance.symbol,
    };
