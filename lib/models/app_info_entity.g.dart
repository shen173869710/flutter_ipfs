// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppInfoEntiy _$AppInfoEntiyFromJson(Map<String, dynamic> json) {
  return AppInfoEntiy()
    ..hasUpdate = json['hasUpdate'] as bool
    ..isIgnorable = json['isIgnorable'] as bool
    ..versionCode = json['versionCode'] as int
    ..versionName = json['versionName'] as String
    ..updateLog = json['updateLog'] as String
    ..apkUrl = json['apkUrl'] as String
    ..apkSize = json['apkSize'] as int;
}

Map<String, dynamic> _$AppInfoEntiyToJson(AppInfoEntiy instance) =>
    <String, dynamic>{
      'hasUpdate': instance.hasUpdate,
      'isIgnorable': instance.isIgnorable,
      'versionCode': instance.versionCode,
      'versionName': instance.versionName,
      'updateLog': instance.updateLog,
      'apkUrl': instance.apkUrl,
      'apkSize': instance.apkSize,
    };
