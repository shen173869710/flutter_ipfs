import 'package:json_annotation/json_annotation.dart';


part 'wallet_address_entity.g.dart';
@JsonSerializable()
class WalletAddressEntity{

	WalletAddressEntity();
	late String address = "";
	late String aliasName = "";
	late String coinIcon = "";
	late String coinName = "";
	late num id = 0;
	late num type = 0;
	late num coinCode = 0;

factory WalletAddressEntity.fromJson(Map<String, dynamic> json) => _$WalletAddressEntityFromJson(json);

Map<String, dynamic> toJson() => _$WalletAddressEntityToJson(this);
}
