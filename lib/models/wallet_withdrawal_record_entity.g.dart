// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_withdrawal_record_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletWithdrawalRecordEntity _$WalletWithdrawalRecordEntityFromJson(
    Map<String, dynamic> json) {
  return WalletWithdrawalRecordEntity()
    ..chain = json['chain'] as String
    ..coinName = json['coinName'] as String
    ..createTime = json['createTime'] as num
    ..fromAddress = json['fromAddress'] as String
    ..toAddress = json['toAddress'] as String
    ..transactionStatus = json['transactionStatus'] as num
    ..txValue = json['txValue'] as num;
}

Map<String, dynamic> _$WalletWithdrawalRecordEntityToJson(
        WalletWithdrawalRecordEntity instance) =>
    <String, dynamic>{
      'chain': instance.chain,
      'coinName': instance.coinName,
      'createTime': instance.createTime,
      'fromAddress': instance.fromAddress,
      'toAddress': instance.toAddress,
      'transactionStatus': instance.transactionStatus,
      'txValue': instance.txValue,
    };
