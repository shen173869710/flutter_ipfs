// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_in_entiy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferInEntiy _$TransferInEntiyFromJson(Map<String, dynamic> json) {
  return TransferInEntiy()
    ..coinCode = json['coinCode'] as num
    ..coinName = json['coinName'] as String
    ..username = json['username'] as String;
}

Map<String, dynamic> _$TransferInEntiyToJson(TransferInEntiy instance) =>
    <String, dynamic>{
      'coinCode': instance.coinCode,
      'coinName': instance.coinName,
      'username': instance.username,
    };
