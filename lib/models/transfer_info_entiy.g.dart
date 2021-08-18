// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_info_entiy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferInfoEntiy _$TransferInfoEntiyFromJson(Map<String, dynamic> json) {
  return TransferInfoEntiy()
    ..transferIn = (json['transferIn'] == null ? null : TransferInEntiy.fromJson(json['transferIn'] as Map<String, dynamic>))!
    ..transferOut = (json['transferOut'] == null ? null : TransferOutEntiy.fromJson(json['transferOut'] as Map<String, dynamic>))!;
}

Map<String, dynamic> _$TransferInfoEntiyToJson(TransferInfoEntiy instance) =>
    <String, dynamic>{
      'transferIn': instance.transferIn.toJson(),
      'transferOut': instance.transferOut.toJson(),
    };
