// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cny_withdrawal_setting_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CnyWithdrawalSettingEntity _$CnyWithdrawalSettingEntityFromJson(
    Map<String, dynamic> json) {
  return CnyWithdrawalSettingEntity()
    ..conversion = json['conversion'] as num
    ..id = json['id'] as num
    ..minAmount = json['minAmount'] as num
    ..remarks = json['remarks'] as String
    ..serviceChargeType = json['serviceChargeType'] as num
    ..serviceChargeValue = json['serviceChargeValue'] as num;
}

Map<String, dynamic> _$CnyWithdrawalSettingEntityToJson(
        CnyWithdrawalSettingEntity instance) =>
    <String, dynamic>{
      'conversion': instance.conversion,
      'id': instance.id,
      'minAmount': instance.minAmount,
      'remarks': instance.remarks,
      'serviceChargeType': instance.serviceChargeType,
      'serviceChargeValue': instance.serviceChargeValue,
    };
