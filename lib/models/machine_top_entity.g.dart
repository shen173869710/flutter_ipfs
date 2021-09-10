// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_top_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MachineTopEntity _$MachineTopEntityFromJson(Map<String, dynamic> json) {
  return MachineTopEntity()
    ..allRealCap = json['allRealCap'] as double
    ..allUseCap = json['allUseCap'] as double
    ..allYield = json['allYield'] as double
    ..machineNumber = json['machineNumber'] as double
    ..onlineNumber = json['onlineNumber'] as double
    ..todayYield = json['todayYield'] as double;
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
