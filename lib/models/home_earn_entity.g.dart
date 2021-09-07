// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_earn_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeEarnEntity _$HomeEarnEntityFromJson(Map<String, dynamic> json) {
  return HomeEarnEntity()
    ..total = json['total'] as num
    ..today = json['today'] as num
    ..userRealCap = json['userRealCap'] as num
    ..teamRealCap = json['teamRealCap'] as num;
}

Map<String, dynamic> _$HomeEarnEntityToJson(HomeEarnEntity instance) =>
    <String, dynamic>{
      'total': instance.total,
      'today': instance.today,
      'userRealCap': instance.userRealCap,
      'teamRealCap': instance.teamRealCap,
    };
