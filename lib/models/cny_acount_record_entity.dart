import 'package:json_annotation/json_annotation.dart';

part 'cny_acount_record_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class CnyAcountRecordEntity{
	CnyAcountRecordEntity();
	String? source;
	num? createTime;
	num? amount;
	num? id;

factory CnyAcountRecordEntity.fromJson(Map<String, dynamic> json) => _$CnyAcountRecordEntityFromJson(json);

Map<String, dynamic> toJson() => _$CnyAcountRecordEntityToJson(this);

}
