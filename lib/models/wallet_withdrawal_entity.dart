import 'package:json_annotation/json_annotation.dart';

part 'wallet_withdrawal_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class WalletWithdrawalEntity{

	late String chain = "";
	late num coinCode;
	late String coinName = "";
	late num outStatus;
	late num withdrawCoinStartTime;
	late num withdrawCoinEndTime;
	late num withdrawCoinLowNumber = 0;
	late num withdrawCoinHighNumber;
	late num withdrawCoinGasType;
	late num withdrawCoinGasPrice;
	late String outDes ="";


	WalletWithdrawalEntity();

  factory WalletWithdrawalEntity.fromJson(Map<String, dynamic> json) => _$WalletWithdrawalEntityFromJson(json);

Map<String, dynamic> toJson() => _$WalletWithdrawalEntityToJson(this);
}
