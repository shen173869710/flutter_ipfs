// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MachineEntity _$MachineEntityFromJson(Map<String, dynamic> json) {
  return MachineEntity()
    ..alreadyGas = json['alreadyGas'] as num
    ..alreadyPledge = json['alreadyPledge'] as num
    ..buyCap = json['buyCap'] as num
    ..chain = json['chain'] as String
    ..createTime = json['createTime'] as num
    ..gas = json['gas'] as num
    ..hostingExpTime = json['hostingExpTime'] as num
    ..machineId = json['machineId'] as num
    ..hostingStatus = json['hostingStatus'] as num
    ..income = json['income'] as num
    ..name = json['name'] as String
    ..nodeName = json['nodeName'] as String
    ..online = json['online'] as String
    ..onlineTime = json['onlineTime'] as num
    ..pledge = json['pledge'] as num
    ..realCap = json['realCap'] as num
    ..symbol = json['symbol'] as String
    ..useCap = json['useCap'] as num;
}

Map<String, dynamic> _$MachineEntityToJson(MachineEntity instance) =>
    <String, dynamic>{
      'alreadyGas': instance.alreadyGas,
      'alreadyPledge': instance.alreadyPledge,
      'buyCap': instance.buyCap,
      'chain': instance.chain,
      'createTime': instance.createTime,
      'gas': instance.gas,
      'hostingExpTime': instance.hostingExpTime,
      'machineId': instance.machineId,
      'name': instance.name,
      'nodeName': instance.nodeName,
      'online': instance.online,
      'onlineTime': instance.onlineTime,
      'pledge': instance.pledge,
      'realCap': instance.realCap,
      'symbol': instance.symbol,
      'useCap': instance.useCap,
    };
