// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppInfoEntiy _$AppInfoEntiyFromJson(Map<String, dynamic> json) {
  return AppInfoEntiy()
    ..hasUpdate = json['hasUpdate'] as bool
    ..isIgnorable = json['isIgnorable'] as bool
    ..versionCode = json['versionCode'] as num
    ..versionName = json['versionName'] as String
    ..modifyContent = json['modifyContent'] as String
    ..downloadUrl = json['downloadUrl'] as String
    ..updateStatus = json['updateStatus'] as num
    ..apkSize = json['apkSize'] as int;
}

Map<String, dynamic> _$AppInfoEntiyToJson(AppInfoEntiy instance) =>
    <String, dynamic>{
      'hasUpdate': instance.hasUpdate,
      'isIgnorable': instance.isIgnorable,
      'versionCode': instance.versionCode,
      'versionName': instance.versionName,
      'modifyContent': instance.modifyContent,
      'downloadUrl': instance.downloadUrl,
      'updateStatus': instance.updateStatus,
      'apkSize': instance.apkSize,
    };
