// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_withdrawal_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletWithdrawalEntity _$WalletWithdrawalEntityFromJson(
    Map<String, dynamic> json) {
  return WalletWithdrawalEntity()
    ..chain = json['chain'] as String
    ..coinCode = json['coinCode'] as num
    ..coinName = json['coinName'] as String
    ..outStatus = json['outStatus'] as num
    ..withdrawCoinStartTime = json['withdrawCoinStartTime'] as num
    ..withdrawCoinEndTime = json['withdrawCoinEndTime'] as num
    ..withdrawCoinLowNumber = json['withdrawCoinLowNumber'] as num
    ..withdrawCoinHighNumber = json['withdrawCoinHighNumber'] as num
    ..withdrawCoinGasType = json['withdrawCoinGasType'] as num
    ..withdrawCoinGasPrice = json['withdrawCoinGasPrice'] as num
    ..outDes = json['outDes'] as String;
}

Map<String, dynamic> _$WalletWithdrawalEntityToJson(
        WalletWithdrawalEntity instance) =>
    <String, dynamic>{
      'chain': instance.chain,
      'coinCode': instance.coinCode,
      'coinName': instance.coinName,
      'outStatus': instance.outStatus,
      'withdrawCoinStartTime': instance.withdrawCoinStartTime,
      'withdrawCoinEndTime': instance.withdrawCoinEndTime,
      'withdrawCoinLowNumber': instance.withdrawCoinLowNumber,
      'withdrawCoinHighNumber': instance.withdrawCoinHighNumber,
      'withdrawCoinGasType': instance.withdrawCoinGasType,
      'withdrawCoinGasPrice': instance.withdrawCoinGasPrice,
      'outDes': instance.outDes,
    };
