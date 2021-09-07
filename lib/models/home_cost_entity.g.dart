// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_cost_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeCostEntity _$HomeCostEntityFromJson(Map<String, dynamic> json) {
  return HomeCostEntity()
    ..totalCost = json['totalCost'] as num
    ..pledgeDay = json['pledgeDay'] as num
    ..gasDay = json['gasDay'] as num;
}

Map<String, dynamic> _$HomeCostEntityToJson(HomeCostEntity instance) =>
    <String, dynamic>{
      'totalCost': instance.totalCost,
      'pledgeDay': instance.pledgeDay,
      'gasDay': instance.gasDay,
    };
