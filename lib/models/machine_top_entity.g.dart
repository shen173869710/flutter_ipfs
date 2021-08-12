// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_top_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MachineTopEntity _$MachineTopEntityFromJson(Map<String, dynamic> json) {
  return MachineTopEntity()
    ..allRealCap = json['allRealCap'] as num
    ..allUseCap = json['allUseCap'] as num
    ..allYield = json['allYield'] as num
    ..machineNumber = json['machineNumber'] as num
    ..onlineNumber = json['onlineNumber'] as num
    ..todayYield = json['todayYield'] as num;
}

Map<String, dynamic> _$MachineTopEntityToJson(MachineTopEntity instance) =>
    <String, dynamic>{
      'allRealCap': instance.allRealCap,
      'allUseCap': instance.allUseCap,
      'allYield': instance.allYield,
      'machineNumber': instance.machineNumber,
      'onlineNumber': instance.onlineNumber,
      'todayYield': instance.todayYield,
    };
