// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cny_withdrawal_record_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CnyWithdrawalRecordEntity _$CnyWithdrawalRecordEntityFromJson(
    Map<String, dynamic> json) {
  return CnyWithdrawalRecordEntity()
    ..id = json['id'] as num
    ..amount = json['amount'] as num
    ..serviceCharge = json['serviceCharge'] as num
    ..recordedAmount = json['recordedAmount'] as num
    ..recordedNets = json['recordedNets'] as num
    ..accountName = json['accountName'] as String
    ..accountNumber = json['accountNumber'] as String
    ..accountBank = json['accountBank'] as String
    ..status = json['status'] as String
    ..createTime = json['createTime'] as num;
}

Map<String, dynamic> _$CnyWithdrawalRecordEntityToJson(
        CnyWithdrawalRecordEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'serviceCharge': instance.serviceCharge,
      'recordedAmount': instance.recordedAmount,
      'recordedNets': instance.recordedNets,
      'accountName': instance.accountName,
      'accountNumber': instance.accountNumber,
      'accountBank': instance.accountBank,
      'status': instance.status,
      'createTime': instance.createTime,
    };
