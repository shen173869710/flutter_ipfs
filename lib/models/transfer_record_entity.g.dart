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
    ..nickname = json['nickname'] as String
    ..status = json['status'] as num
    ..transferNumber = json['transferNumber'] as num
    ..username = json['username'] as String
    ..outStatus = json['outStatus'] as num;
}

Map<String, dynamic> _$TransferRecordEntityToJson(
        TransferRecordEntity instance) =>
    <String, dynamic>{
      'coinCode': instance.coinCode,
      'coinIcon': instance.coinIcon,
      'coinName': instance.coinName,
      'createTime': instance.createTime,
      'nickname': instance.nickname,
      'status': instance.status,
      'transferNumber': instance.transferNumber,
      'username': instance.username,
      'outStatus': instance.outStatus,
    };
