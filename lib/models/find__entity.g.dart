// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find__entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindEntity _$FindEntityFromJson(Map<String, dynamic> json) {
  return FindEntity()
    ..createBy = json['createBy'] as String
    ..createTime = json['createTime'] as String
    // ..noticeContent = json['noticeContent'] as String
    ..noticeId = json['noticeId'] as int
    ..noticeTitle = json['noticeTitle'] as String
    ..noticeType = json['noticeType'] as String
    ..remark = json['remark'] as String
    ..searchValue = json['searchValue'] as String
    ..status = json['status'] as String
    ..updateBy = json['updateBy'] as String
    ..updateTime = json['updateTime'] as String;
}

Map<String, dynamic> _$FindEntityToJson(FindEntity instance) =>
    <String, dynamic>{
      'createBy': instance.createBy,
      'createTime': instance.createTime,
      // 'noticeContent': instance.noticeContent,
      'noticeId': instance.noticeId,
      'noticeTitle': instance.noticeTitle,
      'noticeType': instance.noticeType,
      'remark': instance.remark,
      'searchValue': instance.searchValue,
      'status': instance.status,
      'updateBy': instance.updateBy,
      'updateTime': instance.updateTime,
    };
