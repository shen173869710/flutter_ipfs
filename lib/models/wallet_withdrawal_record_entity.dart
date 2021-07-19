import 'package:json_annotation/json_annotation.dart';


part 'wallet_withdrawal_record_entity.g.dart';
@JsonSerializable()
class WalletWithdrawalRecordEntity{
	WalletWithdrawalRecordEntity();
	late String chain;
	late String coinName;
	late num createTime;
	late String fromAddress;
	late num transactionStatus;
	late num txValue;

factory WalletWithdrawalRecordEntity.fromJson(Map<String, dynamic> json) => _$WalletWithdrawalRecordEntityFromJson(json);

Map<String, dynamic> toJson() => _$WalletWithdrawalRecordEntityToJson(this);
}
