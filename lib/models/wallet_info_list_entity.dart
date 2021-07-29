import 'package:json_annotation/json_annotation.dart';
import 'dart:core';


part 'wallet_info_list_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class WalletInfoListEntity{
	WalletInfoListEntity();
	num createTime = 0;
	num flowType = 0;
	num transactionType = 0;
	num value = 0;

factory WalletInfoListEntity.fromJson(Map<String, dynamic> json) => _$WalletInfoListEntityFromJson(json);

Map<String, dynamic> toJson() => _$WalletInfoListEntityToJson(this);


}
