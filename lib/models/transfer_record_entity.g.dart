// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_record_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferRecordEntity _$TransferRecordEntityFromJson(Map<String, dynamic> json) {
  return TransferRecordEntity()
    ..coinCode = json['coinCode'] as num
    ..coinIcon = json['coinIcon'] as String
    ..coinName = json['coinName'] as String
    ..createTime = json['createTime'] as num
    ..fromNickname = json['fromNickname'] as String
    ..fromUsername = json['fromUsername'] as String
    ..status = json['status'] as num
    ..transferNumber = json['transferNumber'] as num
    ..toNickname = json['toNickname'] as String
    ..toUsername = json['toUsername'] as String
    ..outStatus = json['outStatus'] as num;
}

Map<String, dynamic> _$TransferRecordEntityToJson(
        TransferRecordEntity instance) =>
    <String, dynamic>{
      'coinCode': instance.coinCode,
      'coinIcon': instance.coinIcon,
      'coinName': instance.coinName,
      'createTime': instance.createTime,
      'fromNickname': instance.fromNickname,
      'fromUsername': instance.fromUsername,
      'toNickname': instance.toNickname,
      'toUsername': instance.toUsername,
      'status': instance.status,
      'transferNumber': instance.transferNumber,
      'outStatus': instance.outStatus,
    };
