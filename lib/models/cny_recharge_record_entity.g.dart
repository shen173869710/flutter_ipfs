// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cny_recharge_record_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CnyRechargeRecordEntity _$CnyRechargeRecordEntityFromJson(
    Map<String, dynamic> json) {
  return CnyRechargeRecordEntity()
    ..createTime = json['createTime'] as num
    ..evidence = json['evidence'] as String
    ..id = json['id'] as num
    ..remarks = json['remarks'] as String
    ..status = json['status'] as String;
}

Map<String, dynamic> _$CnyRechargeRecordEntityToJson(
        CnyRechargeRecordEntity instance) =>
    <String, dynamic>{
      'createTime': instance.createTime,
      'evidence': instance.evidence,
      'id': instance.id,
      'remarks': instance.remarks,
      'status': instance.status,
    };
