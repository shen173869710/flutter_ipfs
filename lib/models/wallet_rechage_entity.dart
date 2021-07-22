import 'package:json_annotation/json_annotation.dart';


part 'wallet_rechage_entity.g.dart';
@JsonSerializable()
class WalletRechageEntity{
	late String chain;
	late num coinCode;
	late String coinName;
	late String address;
	late String inDes;
	late num inStatus;
	WalletRechageEntity();
factory WalletRechageEntity.fromJson(Map<String, dynamic> json) => _$WalletRechageEntityFromJson(json);

Map<String, dynamic> toJson() => _$WalletRechageEntityToJson(this);

}
