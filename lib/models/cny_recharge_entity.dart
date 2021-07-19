import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
/***
 *    充值账户信息
 */
part 'cny_recharge_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class CnyRechargeEntity {
	String? accountName;
	String? accountNumber;
	String? accountType;
	num? id;
	String? qrCode;

	CnyRechargeEntity();

factory CnyRechargeEntity.fromJson(Map<String, dynamic> json) => _$CnyRechargeEntityFromJson(json);

Map<String, dynamic> toJson() => _$CnyRechargeEntityToJson(this);


}
