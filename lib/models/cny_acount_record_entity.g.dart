// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cny_acount_record_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CnyAcountRecordEntity _$CnyAcountRecordEntityFromJson(
    Map<String, dynamic> json) {
  return CnyAcountRecordEntity()
    ..source = json['source'] as String
    ..createTime = json['createTime'] as num
    ..amount = json['amount'] as num
    ..id = json['id'] as num;
}

Map<String, dynamic> _$CnyAcountRecordEntityToJson(
        CnyAcountRecordEntity instance) =>
    <String, dynamic>{
      'source': instance.source,
      'createTime': instance.createTime,
      'amount': instance.amount,
      'id': instance.id,
    };
