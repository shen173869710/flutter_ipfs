// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferEntity _$TransferEntityFromJson(Map<String, dynamic> json) {
  return TransferEntity()
    ..coinCode = json['coinCode'] as num
    ..coinIcon = json['coinIcon'] as String
    ..coinName = json['coinName'] as String
    ..transferInfoVo = (json['transferInfoVo'] == null ? null : TransferInfoEntiy.fromJson(json['transferInfoVo'] as Map<String, dynamic>))!
    ..value = json['value'] as num;
}

Map<String, dynamic> _$TransferEntityToJson(TransferEntity instance) =>
    <String, dynamic>{
      'coinCode': instance.coinCode,
      'coinIcon': instance.coinIcon,
      'coinName': instance.coinName,
      'transferInfoVo': instance.transferInfoVo?.toJson(),
      'value': instance.value,
    };
