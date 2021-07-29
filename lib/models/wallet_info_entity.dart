import 'package:json_annotation/json_annotation.dart';
import 'dart:core';



part 'wallet_info_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class WalletInfoEntity{
	num freeze = 0;
	num pledge = 0;
	num sum = 0;
	num todayEarnings = 0;
	num txValue = 0;
	WalletInfoEntity();

factory WalletInfoEntity.fromJson(Map<String, dynamic> json) => _$WalletInfoEntityFromJson(json);

Map<String, dynamic> toJson() => _$WalletInfoEntityToJson(this);
}
