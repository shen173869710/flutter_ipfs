// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cny_recharge_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CnyRechargeEntity _$CnyRechargeEntityFromJson(Map<String, dynamic> json) {
  return CnyRechargeEntity()
    ..accountName = json['accountName'] as String
    ..accountNumber = json['accountNumber'] as String
    ..accountType = json['accountType'] as String
    ..id = json['id'] as num
    ..qrCode = json['qrCode'] as String;
}

Map<String, dynamic> _$CnyRechargeEntityToJson(CnyRechargeEntity instance) =>
    <String, dynamic>{
      'accountName': instance.accountName,
      'accountNumber': instance.accountNumber,
      'accountType': instance.accountType,
      'id': instance.id,
      'qrCode': instance.qrCode,
    };
