// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acount_entiy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountEntiy _$AccountEntiyFromJson(Map<String, dynamic> json) {
  return AccountEntiy()
    ..accountName = json['accountName'] as String
    ..accountBank = json['accountBank'] as String
    ..accountNumber = json['accountNumber'] as String
    ..type = json['type'] as String;
}

Map<String, dynamic> _$AccountEntiyToJson(AccountEntiy instance) =>
    <String, dynamic>{
      'accountName': instance.accountName,
      'accountBank': instance.accountBank,
      'accountNumber': instance.accountNumber,
      'type': instance.type,
    };
