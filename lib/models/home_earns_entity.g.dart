// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_earns_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeEarnsEntity _$HomeEarnsEntityFromJson(Map<String, dynamic> json) {
  return HomeEarnsEntity()
    ..USDT = (json['USDT'] == null ? null : HomeEarnEntity.fromJson(json['USDT'] as Map<String, dynamic>))!
    ..CNY = (json['CNY'] == null ? null : HomeEarnEntity.fromJson(json['CNY'] as Map<String, dynamic>))!;
}

Map<String, dynamic> _$HomeEarnsEntityToJson(HomeEarnsEntity instance) =>
    <String, dynamic>{
      'USDT': instance.USDT!.toJson(),
      'CNY': instance.CNY!.toJson(),
    };
