import 'dart:core';

import 'package:ipfsnets/models/wallet_item_entiy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet_home_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class WalletHomeEntity {
	late num cnySum = 0;
	late List<WalletItemEntiy?> rows =[];
	late num usdtSum = 0;


	WalletHomeEntity(this.cnySum, this.rows, this.usdtSum);

  factory WalletHomeEntity.fromJson(Map<String, dynamic> json) => _$WalletHomeEntityFromJson(json);

Map<String, dynamic> toJson() => _$WalletHomeEntityToJson(this);


}

