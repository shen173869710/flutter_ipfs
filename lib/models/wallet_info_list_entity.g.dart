// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_info_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletInfoListEntity _$WalletInfoListEntityFromJson(Map<String, dynamic> json) {
  return WalletInfoListEntity()
    ..createTime = json['createTime'] as num
    ..flowType = json['flowType'] as num
    ..transactionType = json['transactionType'] as num
    ..value = json['value'] as num;
}

Map<String, dynamic> _$WalletInfoListEntityToJson(
        WalletInfoListEntity instance) =>
    <String, dynamic>{
      'createTime': instance.createTime,
      'flowType': instance.flowType,
      'transactionType': instance.transactionType,
      'value': instance.value,
    };
