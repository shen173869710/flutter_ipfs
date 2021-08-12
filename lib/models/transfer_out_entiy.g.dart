// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_out_entiy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferOutEntiy _$TransferOutEntiyFromJson(Map<String, dynamic> json) {
  return TransferOutEntiy()
    ..coinName = json['coinName'] as String
    ..gas = json['gas'] as num
    ..transferGasType = json['transferGasType'] as num;
}

Map<String, dynamic> _$TransferOutEntiyToJson(TransferOutEntiy instance) =>
    <String, dynamic>{
      'coinName': instance.coinName,
      'gas': instance.gas,
      'transferGasType': instance.transferGasType,
    };
