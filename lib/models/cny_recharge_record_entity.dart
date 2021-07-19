import 'package:json_annotation/json_annotation.dart';

import 'package:json_annotation/json_annotation.dart';

part 'cny_recharge_record_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class CnyRechargeRecordEntity {
	num? createTime;
	String? evidence;
	num? id;
	String? remarks;
	String? status;

	CnyRechargeRecordEntity();

factory CnyRechargeRecordEntity.fromJson(Map<String, dynamic> json) => _$CnyRechargeRecordEntityFromJson(json);

Map<String, dynamic> toJson() => _$CnyRechargeRecordEntityToJson(this);
}
