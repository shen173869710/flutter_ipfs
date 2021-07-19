import 'package:json_annotation/json_annotation.dart';


part 'cny_withdrawal_record_entity.g.dart';
@JsonSerializable()
class CnyWithdrawalRecordEntity{
	CnyWithdrawalRecordEntity();
	num? id;
	num? amount;
	num? serviceCharge;
	num? recordedAmount;
	num? recordedNets;
	String? accountName;
	String? accountNumber;
	String? accountBank;
	String? status;
	num? createTime;

factory CnyWithdrawalRecordEntity.fromJson(Map<String, dynamic> json) => _$CnyWithdrawalRecordEntityFromJson(json);

Map<String, dynamic> toJson() => _$CnyWithdrawalRecordEntityToJson(this);
}
