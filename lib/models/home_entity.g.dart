// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeEntity _$HomeEntityFromJson(Map<String, dynamic> json) {
  return HomeEntity()
    ..oneDayCost = (json['oneDayCost'] == null ? null : HomeDayEntity.fromJson(json['oneDayCost'] as Map<String, dynamic>))!
    ..totalEarnings = (json['totalEarnings'] == null ? null : HomeTotalEntity.fromJson(json['totalEarnings'] as Map<String, dynamic>))
    ..earningsView = (json['earningsView'] == null ? null : HomeEarnsEntity.fromJson(json['earningsView'] as Map<String, dynamic>))!;
}

Map<String, dynamic> _$HomeEntityToJson(HomeEntity instance) =>
    <String, dynamic>{
      'oneDayCost': instance.oneDayCost!.toJson(),
      'totalEarnings': instance.totalEarnings!.toJson(),
      'earningsView': instance.earningsView!.toJson(),
    };
