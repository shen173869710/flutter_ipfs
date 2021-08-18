// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_hosting_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MachineHostingEntity _$MachineHostingEntityFromJson(Map<String, dynamic> json) {
  return MachineHostingEntity()
    ..cnyBalance = json['cnyBalance'] as num
    ..cnyPrice = json['cnyPrice'] as num
    ..hostingDay = json['hostingDay'] as num
    ..hostingPeriod = json['hostingPeriod'] == null ?[]:(json['hostingPeriod']as List).map((e) => e as int).toList()
    ..machineId = json['machineId'] as num
    ..hostingStatus = json['hostingStatus'] as num
    ..nodeName = json['nodeName'] as String
    ..symbol = json['symbol'] as String
    ..usdtBalance = json['usdtBalance'] as num
    ..usdtPrice = json['usdtPrice'] as num
    ..expand = json['expand'] as num;
}

Map<String, dynamic> _$MachineHostingEntityToJson(
        MachineHostingEntity instance) =>
    <String, dynamic>{
      'cnyBalance': instance.cnyBalance,
      'cnyPrice': instance.cnyPrice,
      'hostingDay': instance.hostingDay,
      'hostingPeriod': instance.hostingPeriod,
      'machineId': instance.machineId,
      'hostingStatus': instance.hostingStatus,
      'nodeName': instance.nodeName,
      'symbol': instance.symbol,
      'usdtBalance': instance.usdtBalance,
      'usdtPrice': instance.usdtPrice,
      'expand': instance.expand,
    };
