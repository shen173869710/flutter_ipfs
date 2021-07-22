import 'package:json_annotation/json_annotation.dart';

part 'wallet_account_entity.g.dart';
@JsonSerializable()
class WalletAccountEntity {
	late String coinIcon;
	late String coinName;
	late num coinCode;
	late num value;
	WalletAccountEntity();

factory WalletAccountEntity.fromJson(Map<String, dynamic> json) => _$WalletAccountEntityFromJson(json);

Map<String, dynamic> toJson() => _$WalletAccountEntityToJson(this);
}

